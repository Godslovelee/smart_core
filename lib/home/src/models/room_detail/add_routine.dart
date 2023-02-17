import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'room_vm.dart';
import 'device_list.dart';

class AddGroupButton extends StatefulWidget {
  const AddGroupButton({Key? key}) : super(key: key);

  @override
  State<AddGroupButton> createState() => _AddGroupButtonState();
}

class _AddGroupButtonState extends State<AddGroupButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: 102,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(5),
        ),
        child: Text(
          'Add Routine',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 16,
            color: Colors.redAccent,
          ),
        ),
        onPressed: () => addExistingGroupListModel(context),
      ),
    );
  }

  //ADD EXISTING GROUP

  Future addExistingGroupListModel(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height / 2,
        maxHeight: MediaQuery.of(context).size.height - 100,
      ),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      barrierColor: Colors.white.withOpacity(0.6),
      elevation: 24,
      backgroundColor: Colors.white,
      builder: (
          ctx,
          ) {
        return SizedBox.fromSize(
          size: Size.fromHeight(MediaQuery.of(context).size.height - 150),
          child: const GroupList(),
        );
      },
    );
  }
}

class GroupList extends ConsumerStatefulWidget {
  const GroupList({Key? key}) : super(key: key);

  @override
  ConsumerState<GroupList> createState() => _GroupListState();
}

class _GroupListState extends ConsumerState<GroupList> {
  List<LightDevice> groupSelected = [];
  List<String> containedLights = [];
  final textController = TextEditingController();
  late final roomVm = ref.read(roomProvider.notifier);
  late List<LightDevice> groupedLightDevicesList;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    groupedLightDevicesList = roomVm.getGroupedDevicesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Create Group',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 24,
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 18, right: 10),
          child: RichText(
            text: TextSpan(
              text: 'Group Name',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14,
              ),
              children: const <TextSpan>[
                TextSpan(text: '*', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 18,
              bottom: 20,
              right: 10,
            ),
            child: SizedBox(
              height: 45,
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            )),
        Expanded(
          child: HookConsumer(
            builder: (ctx, ref, child) {
              final listDeviceFuture = useMemoized(() async {
                final devices = ref.read(roomProvider.notifier);
                return devices.getLamps();
              });

              final devicesData = useFuture(listDeviceFuture);
              if (devicesData.hasData) {
                final groupList = devicesData.data!;
                return ListView.separated(
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      onTap: !groupedLightDevicesList.contains(groupList[index])
                          ? () {
                        setState(() {
                          if (!groupSelected.contains(groupList[index])) {
                            groupSelected.add(groupList[index]);
                          } else {
                            groupSelected.remove(groupList[index]);
                          }
                        });
                      }
                          : null,
                      title: Text(
                        groupList[index].configuration['name'],
                        style: groupedLightDevicesList
                            .contains(groupList[index])
                            ? Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 18,
                          color: Colors.grey,
                        )
                            : Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      trailing: groupSelected.contains(groupList[index]) &&
                          !groupedLightDevicesList
                              .contains(groupList[index])
                          ? Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(-1, 0),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.blue,
                            size: 16,
                          ),
                        ),
                      )
                          : const SizedBox.shrink(),
                    );
                  },
                  separatorBuilder: (context, index) => const ButtonDivider(),
                  itemCount: groupList.length,
                );
              }

              return child!;
            },
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
          child: Consumer(
            builder: (ctc, ref, _) {
              return ValueListenableBuilder<TextEditingValue>(
                  valueListenable: textController,
                  builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: groupSelected.isNotEmpty &
                      value.text.isNotEmpty
                          ? () {
                        final roomVM = ref.read(roomProvider.notifier);
                        final group = GroupsLightDevice(
                            uuid: textController.text,
                            path: '',
                            configuration: {'name': textController.text});
                        group.addDevices(groupSelected);
                        roomVM.addGroup(group);
                        Navigator.pop(context);
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.grey,
                        minimumSize: const Size(
                          double.infinity,
                          40,
                        ),
                      ),
                      child: Text(
                        'Save'.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    );
                  });
            },
          ),
        )
      ],
    );
  }
}

class ButtonDivider extends StatelessWidget {
  const ButtonDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 18.0),
      child: Divider(
        thickness: 1,
        height: 1,
      ),
    );
  }
}



