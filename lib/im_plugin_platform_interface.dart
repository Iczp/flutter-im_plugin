import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'im_plugin_method_channel.dart';

abstract class ImPluginPlatform extends PlatformInterface {
  /// Constructs a ImPluginPlatform.
  ImPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ImPluginPlatform _instance = MethodChannelImPlugin();

  /// The default instance of [ImPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelImPlugin].
  static ImPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ImPluginPlatform] when
  /// they register themselves.
  static set instance(ImPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
