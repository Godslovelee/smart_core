import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../config/size_config.dart';
import '../../../models/room_detail/add_routine.dart';
import '../../../models/room_detail/room_vm.dart';

class AddNewDevice extends HookConsumerWidget {
  const AddNewDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomVM = ref.watch(roomProvider);
    final deviceGroupedFuture = useMemoized(
        ref.read(roomProvider.notifier).groupDevices,
        [roomVM.asData?.value.length]);
    final deviceGroupedData = useFuture(deviceGroupedFuture);
    if (deviceGroupedData.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: EdgeInsets.all(
        getProportionateScreenHeight(5),
      ),
      color: const Color(0xFFBDBDBD),
      strokeWidth: 2,
      dashPattern: const [9, 3],
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: getProportionateScreenHeight(55),
          width: double.maxFinite,
          color: const Color(0xFFF2F2F2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                color: Color(0xFFBDBDBD),
              ),
              AddGroupButton(),


            ],
          ),
        ),
      ),
    );
  }
}
