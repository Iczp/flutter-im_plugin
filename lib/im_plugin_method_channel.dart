import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'im_plugin_platform_interface.dart';

/// An implementation of [ImPluginPlatform] that uses method channels.
class MethodChannelImPlugin extends ImPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('im_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
