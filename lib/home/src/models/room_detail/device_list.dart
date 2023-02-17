import 'package:flutter/widgets.dart';
import 'package:smart_core_mobile/home/src/models/room_detail/commons.dart';

enum DevicesType {
  rgb,
  rgbw,
  tunnable,
  brightness,
  regular,
  shutter,
  blind,
  shader,
  powerSocker,
  usb,
  lightGroups,
}

mixin groups<T extends BaseDevice> on BaseDevice {
  final List<T> _devices = [];
  List<T> get devices => _devices;
  void addDevice(T device) {
    if (!_devices.contains(device)) {
      _devices.add(device);
    }
  }

  void addDevices(List<T> devices) {
    if (_devices.toSet().intersection(devices.toSet()).isEmpty) {
      _devices.addAll(devices);
    }
  }

  void removeDevice(T device) {
    if (devices.contains(device)) {
      devices.remove(device);
    }
  }
}

@immutable
abstract class BaseDevice {
  final String uuid;
  final String path;
  final Map<String, dynamic> configuration;
  const BaseDevice({
    required this.uuid,
    required this.path,
    this.configuration = const {},
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is BaseDevice && other.uuid == uuid;
  }

  factory BaseDevice.generate({
    required String uuid,
    required String path,
    Map<String, dynamic> configuration = const {},
    required DevicesType type,
  }) {
    switch (type) {
      case DevicesType.rgb:
        return RgbLightDevice(
          uuid: uuid,
          path: path,
          configuration: configuration,
        );
      case DevicesType.rgbw:
        return RgbwLightDevice(
          uuid: uuid,
          path: path,
          configuration: configuration,
        );
      case DevicesType.regular:
        return RegularLightDevice(
          uuid: uuid,
          path: path,
          configuration: configuration,
        );
      case DevicesType.tunnable:
        return TunnableLightDevice(
          uuid: uuid,
          path: path,
          configuration: configuration,
        );
      case DevicesType.brightness:
        return BrightnessLightDevice(
          uuid: uuid,
          path: path,
          configuration: configuration,
        );
      case DevicesType.lightGroups:
        return GroupsLightDevice(
          uuid: uuid,
          path: path,
          configuration: configuration,
        );
      case DevicesType.shutter:
        return ShutterDevice(
          uuid: uuid,
          path: path,
          configuration: configuration,
        );
      case DevicesType.blind:
        return BlindDevice(
          uuid: uuid,
          path: path,
          configuration: configuration,
        );
      case DevicesType.shader:
        return ShaderDevice(
          uuid: uuid,
          path: path,
          configuration: configuration,
        );
      case DevicesType.powerSocker:
        return PowerSocket(
          uuid: uuid,
          path: path,
          configuration: configuration,
        );
      case DevicesType.usb:
        return UsbPort(
          uuid: uuid,
          path: path,
          configuration: configuration,
        );
    }
  }

  BaseDevice copyWith({
    String? uuid,
    String? path,
    Map<String, dynamic>? configuration,
  }) {
    switch (runtimeType) {
      case RgbLightDevice:
        return RgbLightDevice(
          uuid: uuid ?? this.uuid,
          path: path ?? this.path,
          configuration: configuration ?? this.configuration,
        );
      case RgbwLightDevice:
        return RgbwLightDevice(
          uuid: uuid ?? this.uuid,
          path: path ?? this.path,
          configuration: configuration ?? this.configuration,
        );
      case RegularLightDevice:
        return RegularLightDevice(
          uuid: uuid ?? this.uuid,
          path: path ?? this.path,
          configuration: configuration ?? this.configuration,
        );
      case TunnableLightDevice:
        return TunnableLightDevice(
          uuid: uuid ?? this.uuid,
          path: path ?? this.path,
          configuration: configuration ?? this.configuration,
        );
      case BrightnessLightDevice:
        return BrightnessLightDevice(
          uuid: uuid ?? this.uuid,
          path: path ?? this.path,
          configuration: configuration ?? this.configuration,
        );
      case GroupsLightDevice:
        final group = GroupsLightDevice(
          uuid: uuid ?? this.uuid,
          path: path ?? this.path,
          configuration: configuration ?? this.configuration,
        );
        group.addDevices((this as GroupsLightDevice).devices);
        return group;
      case ShutterDevice:
        return ShutterDevice(
          uuid: uuid ?? this.uuid,
          path: path ?? this.path,
          configuration: configuration ?? this.configuration,
        );
      case BlindDevice:
        return BlindDevice(
          uuid: uuid ?? this.uuid,
          path: path ?? this.path,
          configuration: configuration ?? this.configuration,
        );

      case ShaderDevice:
        return BlindDevice(
          uuid: uuid ?? this.uuid,
          path: path ?? this.path,
          configuration: configuration ?? this.configuration,
        );

      case PowerSocket:
        return BlindDevice(
          uuid: uuid ?? this.uuid,
          path: path ?? this.path,
          configuration: configuration ?? this.configuration,
        );

      case UsbPort:
        return BlindDevice(
          uuid: uuid ?? this.uuid,
          path: path ?? this.path,
          configuration: configuration ?? this.configuration,
        );
      default:
        throw Exception('undefined type');
    }
  }



  @override
  int get hashCode => uuid.hashCode;
}

abstract class LightDevice extends BaseDevice {
  static const keyColorConfig = 'preSetColors';
  int get brigthness => configuration["brigthness"];
  int get temperature => configuration["temperature"];

  List<Color> get preSetColor => configuration.containsKey(keyColorConfig)
      ? (configuration[keyColorConfig] as List<String>)
      .map((e) => e.fromHex())
      .toList()
      : [];
  const LightDevice({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}

@immutable
class GroupsLightDevice extends LightDevice with groups<LightDevice> {
  GroupsLightDevice({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}

class NoDevice extends BaseDevice {
  NoDevice() : super(uuid: '', path: '', configuration: {});
}

class NoLightDevice extends LightDevice {
  NoLightDevice() : super(uuid: '', path: '', configuration: {});
}

class NoGroupDevice extends NoLightDevice with groups<LightDevice> {
  NoGroupDevice() : super();
}

abstract class ElectricityDevice extends BaseDevice {
  const ElectricityDevice({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}

abstract class DssDevice extends BaseDevice {
  const DssDevice({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}

class RgbLightDevice extends LightDevice {
  const RgbLightDevice({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}

class RgbwLightDevice extends LightDevice {
  const RgbwLightDevice({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}

class RegularLightDevice extends LightDevice {
  const RegularLightDevice({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}

class TunnableLightDevice extends LightDevice {
  const TunnableLightDevice({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}

class BrightnessLightDevice extends LightDevice {
  const BrightnessLightDevice({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}

class ShutterDevice extends DssDevice {
  const ShutterDevice({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}

class BlindDevice extends DssDevice {
  const BlindDevice({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}

class ShaderDevice extends DssDevice {
  const ShaderDevice({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}

class PowerSocket extends ElectricityDevice {
  const PowerSocket({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}

class UsbPort extends ElectricityDevice {
  const UsbPort({
    required super.uuid,
    required super.path,
    super.configuration,
  });
}
