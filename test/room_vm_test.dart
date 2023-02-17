import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_core_mobile/home/src/models/room_detail/device_list.dart';
import 'package:smart_core_mobile/home/src/models/room_detail/room_vm.dart';

/// here we should integrate room to change list of device depend on room selected
class FakeRoomVM extends RoomVM {
  FakeRoomVM();
  @override
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
      RgbLightDevice(
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

    state = AsyncValue.data(list);
  }
}

// Using mockito to keep track of when a provider notify its listeners
class Listener extends Mock {
  void call(AsyncValue<List<BaseDevice>>? previous,
      AsyncValue<List<BaseDevice>> value);
}

void main() {
  test('test room_vm', () async {
    final container = ProviderContainer(overrides: [
      roomProvider.overrideWithProvider(
          StateNotifierProvider<FakeRoomVM, AsyncValue<List<BaseDevice>>>(
                  (ref) => FakeRoomVM())),
    ]);
    addTearDown(container.dispose);
    final listener = Listener();

    container.listen<AsyncValue<List<BaseDevice>>>(
      roomProvider,
      listener,
      fireImmediately: true,
    );
    expect(container.read(roomProvider.notifier).state.isLoading, true);
    expect(container.read(roomProvider.notifier).state.hasValue, false);

    await container.read(roomProvider.notifier).recuperateDevices();

    expect(container.read(roomProvider.notifier).state.isLoading, false);
    expect(container.read(roomProvider.notifier).state.hasValue, true);
    final list = container.read(roomProvider.notifier).getLamps();
    expect(list?.isNotEmpty, true);
  });

  test('test getGroupedDevicesList', () async {
    final container = ProviderContainer(overrides: [
      roomProvider.overrideWith((ref) => FakeRoomVM()),
    ]);
    addTearDown(container.dispose);
    final listener = Listener();

    container.listen<AsyncValue<List<BaseDevice>>>(
      roomProvider,
      listener,
      fireImmediately: true,
    );
    await container.read(roomProvider.notifier).recuperateDevices();
    final listDeviceInGroup =
    container.read(roomProvider.notifier).getGroupedDevicesList();
    expect(listDeviceInGroup.length, 3);
  });
}
