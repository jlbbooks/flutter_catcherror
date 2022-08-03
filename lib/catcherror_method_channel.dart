import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'catcherror_platform_interface.dart';

/// An implementation of [CatcherrorPlatform] that uses method channels.
class MethodChannelCatcherror extends CatcherrorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('catcherror');

  @override
  Future<bool> checkVowel(String alphabet) async {
    final version = await methodChannel.invokeMethod<bool>("checkVowel", {
      "alphabet": 2
      // alphabet.characters.first,
    });
    return version!;
  }
}
