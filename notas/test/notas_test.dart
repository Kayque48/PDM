import 'package:flutter_test/flutter_test.dart';
import 'package:notas/notas.dart';
import 'package:notas/notas_platform_interface.dart';
import 'package:notas/notas_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNotasPlatform
    with MockPlatformInterfaceMixin
    implements NotasPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NotasPlatform initialPlatform = NotasPlatform.instance;

  test('$MethodChannelNotas is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNotas>());
  });

  test('getPlatformVersion', () async {
    Notas notasPlugin = Notas();
    MockNotasPlatform fakePlatform = MockNotasPlatform();
    NotasPlatform.instance = fakePlatform;

    expect(await notasPlugin.getPlatformVersion(), '42');
  });
}
