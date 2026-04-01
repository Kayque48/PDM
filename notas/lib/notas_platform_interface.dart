import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'notas_method_channel.dart';

abstract class NotasPlatform extends PlatformInterface {
  /// Constructs a NotasPlatform.
  NotasPlatform() : super(token: _token);

  static final Object _token = Object();

  static NotasPlatform _instance = MethodChannelNotas();

  /// The default instance of [NotasPlatform] to use.
  ///
  /// Defaults to [MethodChannelNotas].
  static NotasPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NotasPlatform] when
  /// they register themselves.
  static set instance(NotasPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
