import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'catcherror_method_channel.dart';

abstract class CatcherrorPlatform extends PlatformInterface {
  /// Constructs a CatcherrorPlatform.
  CatcherrorPlatform() : super(token: _token);

  static final Object _token = Object();

  static CatcherrorPlatform _instance = MethodChannelCatcherror();

  /// The default instance of [CatcherrorPlatform] to use.
  ///
  /// Defaults to [MethodChannelCatcherror].
  static CatcherrorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CatcherrorPlatform] when
  /// they register themselves.
  static set instance(CatcherrorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> checkVowel(String alphabet) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
