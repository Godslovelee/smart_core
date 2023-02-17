import 'package:flutter/widgets.dart';

import 'device_list.dart';


extension ExtString on String {
  Color fromHex() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension ExtList on List<BaseDevice> {
  List<List<BaseDevice>> groupDevices() {
    final grouped = <List<BaseDevice>>[];
    final lightList = <LightDevice>[];
    final dssList = <DssDevice>[];
    final electricityList = <ElectricityDevice>[];
    forEach((element) {
      if (element is LightDevice) {
        lightList.add(element);
      } else if (element is DssDevice) {
        dssList.add(element);
      } else if (element is ElectricityDevice) {
        electricityList.add(element);
      }
    });
    if (lightList.isNotEmpty) {
      grouped.add(lightList);
    }
    if (dssList.isNotEmpty) {
      grouped.add(dssList);
    }
    if (electricityList.isNotEmpty) {
      grouped.add(electricityList);
    }
    return grouped;
  }

  List<LightDevice> getLamps() {
    final onlyDevices =
    where((element) => element is! GroupsLightDevice).toList();
    return onlyDevices.whereType<LightDevice>().toList();
  }
}

extension ExtColor on Color {
  String toHex() => '#${value.toRadixString(16)}';

  String toRgbString() {
    return '$red,$green,$blue';
  }

  Color invert() {
    return Color.fromARGB(
      (opacity * 255).round(),
      255 - red,
      255 - green,
      255 - blue,
    );
  }
}

extension ToRgbColor on String {
  Color toRgbColor() {
    return Color.fromRGBO(
      int.parse(split(',')[0]),
      int.parse(split(',')[1]),
      int.parse(split(',')[2]),
      1,
    );
  }
}