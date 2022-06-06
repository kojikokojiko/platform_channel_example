import 'package:flutter_test/flutter_test.dart';
import 'package:platform_channel/platform_channel.dart';
import 'package:platform_channel/platform_channel_platform_interface.dart';
import 'package:platform_channel/platform_channel_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPlatformChannelPlatform 
    with MockPlatformInterfaceMixin
    implements PlatformChannelPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PlatformChannelPlatform initialPlatform = PlatformChannelPlatform.instance;

  test('$MethodChannelPlatformChannel is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPlatformChannel>());
  });

  test('getPlatformVersion', () async {
    PlatformChannel platformChannelPlugin = PlatformChannel();
    MockPlatformChannelPlatform fakePlatform = MockPlatformChannelPlatform();
    PlatformChannelPlatform.instance = fakePlatform;
  
    expect(await platformChannelPlugin.getPlatformVersion(), '42');
  });
}
