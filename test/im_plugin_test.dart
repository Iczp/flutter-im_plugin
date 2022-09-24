import 'package:flutter_test/flutter_test.dart';
import 'package:im_plugin/im_plugin.dart';
import 'package:im_plugin/im_plugin_platform_interface.dart';
import 'package:im_plugin/im_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockImPluginPlatform
    with MockPlatformInterfaceMixin
    implements ImPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ImPluginPlatform initialPlatform = ImPluginPlatform.instance;

  test('$MethodChannelImPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelImPlugin>());
  });

  test('getPlatformVersion', () async {
    ImPlugin imPlugin = ImPlugin();
    MockImPluginPlatform fakePlatform = MockImPluginPlatform();
    ImPluginPlatform.instance = fakePlatform;

    expect(await imPlugin.getPlatformVersion(), '42');
  });
}
