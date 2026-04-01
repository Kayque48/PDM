import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'notas_platform_interface.dart';

/// An implementation of [NotasPlatform] that uses method channels.
class MethodChannelNotas extends NotasPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('notas');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
