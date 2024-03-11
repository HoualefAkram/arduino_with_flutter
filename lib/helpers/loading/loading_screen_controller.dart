import 'package:flutter/material.dart' show immutable;

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String text);

@immutable
class LoadingScreenContoller {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingScreenContoller({
    required this.close,
    required this.update,
  });
}
