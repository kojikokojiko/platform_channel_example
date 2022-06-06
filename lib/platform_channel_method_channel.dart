import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_channel_platform_interface.dart';

/// An implementation of [PlatformChannelPlatform] that uses method channels.
class MethodChannelPlatformChannel extends PlatformChannelPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('platform_channel');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
