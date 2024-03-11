import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pfc_sgc/constants/text_style.dart';

import 'loading_screen_controller.dart';

class LoadingScreen {
  static final LoadingScreen _shared = LoadingScreen._shareInstance();
  LoadingScreen._shareInstance();
  factory LoadingScreen() => _shared;

  LoadingScreenContoller? controller;

  void show({
    required BuildContext context,
    String? text,
    Widget? image,
  }) {
    if (controller?.update(text ?? "Chargement...") ?? false) {
      return;
    } else {
      controller = showOverlay(
        context: context,
        text: text ?? "Chargement...",
        image: image,
      );
    }
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  LoadingScreenContoller showOverlay({
    required BuildContext context,
    required String text,
    required Widget? image,
  }) {
    final loadingScreenText = StreamController<String>();
    loadingScreenText.add(text);

    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: size.width * 0.8,
                  maxHeight: size.height * 0.8,
                  minWidth: size.width * 0.5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: (image != null)
                            ? MediaQuery.of(context).size.height * 0.4
                            : 0,
                        child: image,
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      ),
                      StreamBuilder(
                        stream: loadingScreenText.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data as String,
                              textAlign: TextAlign.center,
                              style: style(color: Colors.black, fontSize: 16),
                            );
                          } else {
                            return Container();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    state.insert(overlay);
    return LoadingScreenContoller(
      close: () {
        loadingScreenText.close();
        overlay.remove();
        return true;
      },
      update: (text) {
        loadingScreenText.add(text);
        return true;
      },
    );
  }
}
