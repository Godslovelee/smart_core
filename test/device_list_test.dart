import 'package:flutter_test/flutter_test.dart';
import 'package:smart_core_mobile/home/src/models/room_detail/commons.dart';
import 'package:smart_core_mobile/home/src/models/room_detail/device_list.dart';

void main() {
  test('test sort', () {
    final devices = [
      RgbLightDevice(uuid: '111', path: ''),
      ShutterDevice(uuid: '211', path: ''),
      BlindDevice(uuid: '222', path: ''),
      RgbwLightDevice(uuid: '122', path: ''),
      RgbLightDevice(uuid: '133', path: ''),
      ShutterDevice(uuid: '233', path: ''),
      RgbLightDevice(uuid: '144', path: ''),
    ];
    final groupedDevices = devices.groupDevices();
    //debugPrint(groupedDevices.toString());
    expect(groupedDevices.length, 2);
    expect(groupedDevices.first.runtimeType, List<LightDevice>);
    expect(groupedDevices.last.runtimeType, List<DssDevice>);
    expect((groupedDevices.first).length, 4);
    expect((groupedDevices.last).length, 3);
  });
  test('test get lamps', () {
    final devices = [
      RgbLightDevice(uuid: '111', path: ''),
      ShutterDevice(uuid: '211', path: ''),
      BlindDevice(uuid: '222', path: ''),
      RgbwLightDevice(uuid: '122', path: ''),
      RgbLightDevice(uuid: '133', path: ''),
      ShutterDevice(uuid: '233', path: ''),
      RgbLightDevice(uuid: '144', path: ''),
      GroupsLightDevice(uuid: '511', path: '')
    ];
    final groupedDevices = devices.getLamps();
    expect(groupedDevices.length, 4);
  });
}
