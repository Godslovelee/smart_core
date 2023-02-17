
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_core_mobile/home/src/models/room_detail/commons.dart';

import 'device_list.dart';

final roomProvider =
    StateNotifierProvider<RoomVM, AsyncValue<List<BaseDevice>>>(
        (ref) => RoomVM());

/// here we should integrate room to change list of routine depending on room/routine selected
class RoomVM extends StateNotifier<AsyncValue<List<BaseDevice>>> {
  RoomVM() : super(const AsyncLoading());

  Future recuperateDevices() async {
    final list = [
      RegularLightDevice(
        uuid: '111',
        path: '',
        configuration: {'name': 'light 1'},
      ),
      RgbwLightDevice(
        uuid: '122',
        path: '',
        configuration: {'name': 'light 2'},
      ),
      const RgbLightDevice(
        uuid: '133',
        path: '',
        configuration: {'name': 'light 3'},
      ),
      TunnableLightDevice(
        uuid: '144',
        path: '',
        configuration: {'name': 'light 4'},
      ),
      BrightnessLightDevice(
        uuid: '155',
        path: '',
        configuration: {'name': 'light 5'},
      ),
      RgbLightDevice(
        uuid: '166',
        path: '',
        configuration: {'name': 'light 6'},
      ),
      RgbwLightDevice(
        uuid: '177',
        path: '',
        configuration: {'name': 'light 7'},
      ),
      ShutterDevice(
        uuid: '211',
        path: '',
        configuration: {'name': 'shutter 1'},
      ),
      BlindDevice(
        uuid: '222',
        path: '',
        configuration: {'name': 'blind 1'},
      ),
      ShutterDevice(
        uuid: '233',
        path: '',
        configuration: {'name': 'shutter 2'},
      ),
      PowerSocket(
        uuid: '344',
        path: '',
        configuration: {'name': 'Power Socker 1'},
      ),
    ];
    final g1 = GroupsLightDevice(
      uuid: '511',
      path: '',
      configuration: {'name': 'Light Group 1'},
    )..addDevice(list[1] as LightDevice);
    final g2 = GroupsLightDevice(
      uuid: '512',
      path: '',
      configuration: {'name': 'Light Group 2'},
    )
      ..addDevice(list[2] as LightDevice)
      ..addDevice(list[3] as LightDevice);
    final allLights = GroupsLightDevice(
      uuid: '0',
      path: '',
      configuration: {'name': 'All light'},
    )..addDevices(list.getLamps());
    list
      ..insert(0, allLights)
      ..add(g1)
      ..add(g2);

    state = AsyncValue.data(list);
  }

  Future updateDevices(List<BaseDevice> devices) async {
    final listDevices = state.asData!.value;
    for (final device in devices) {
      final index =
          listDevices.indexWhere((element) => element.uuid == device.uuid);
      if (index != -1) {
        listDevices[index].configuration[LightDevice.keyColorConfig] =
            device.configuration[LightDevice.keyColorConfig];
      }
    }
    state = AsyncValue.data(listDevices);
  }

  Future<List<List<BaseDevice>>> groupDevices() async {
    final groups = state.asData!.value.groupDevices();
    return groups;
  }

  List<LightDevice> getGroupedDevicesList(
      {List<LightDevice> excludeList = const []}) {
    final groupData = state.asData!.value
        .whereType<groups<LightDevice>>()
        .toList()
      ..removeWhere((element) => element.uuid == '0');
    final containedLights =
        groupData.map((e) => e.devices).reduce((g1, g2) => g1..addAll(g2));
    if (excludeList.isNotEmpty) {
      containedLights.removeWhere((device) => excludeList.contains(device));
    }
    return containedLights;
  }

  List<LightDevice>? getLamps() => state.asData?.value.getLamps();

  List<LightDevice>? getRgbRgbwLamps({String? excludeUuid}) {
    final rgbRgbwLamps = getLamps();
    // filter only the RGBW and RGB Lamps
    // and the Lamp that does not have excludeUuid
    // ignore: cascade_invocations
    rgbRgbwLamps?.retainWhere(
      (lamp) =>
          (lamp is RgbwLightDevice || lamp is RgbLightDevice) &&
          lamp.uuid != excludeUuid,
    );

    return rgbRgbwLamps;
  }

  void addGroup(groups<LightDevice> group) {
    final list = List<BaseDevice>.from(state.asData!.value);
    list.add(group as LightDevice);
    state = AsyncValue.data(list);
  }

  void replace(groups<LightDevice> group) {
    final list = List<BaseDevice>.from(state.asData!.value);
    final index = list.indexWhere((element) => element.uuid == group.uuid);
    if (index != -1) {
      list[index] = group;
    }
    state = AsyncValue.data(list);
  }

  void removeGroup(groups<LightDevice> group) {
    final list = List<BaseDevice>.from(state.asData!.value);
    final index = list.indexWhere((element) => element.uuid == group.uuid);
    if (index != -1) {
      list.removeAt(index);
    }
    state = AsyncValue.data(list);
  }
}
