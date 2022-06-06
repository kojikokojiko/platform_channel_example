import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'platform_channel_method_channel.dart';

abstract class PlatformChannelPlatform extends PlatformInterface {
  /// Constructs a PlatformChannelPlatform.
  PlatformChannelPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlatformChannelPlatform _instance = MethodChannelPlatformChannel();

  /// The default instance of [PlatformChannelPlatform] to use.
  ///
  /// Defaults to [MethodChannelPlatformChannel].
  static PlatformChannelPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlatformChannelPlatform] when
  /// they register themselves.
  static set instance(PlatformChannelPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
