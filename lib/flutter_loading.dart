library flutter_loading;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_loading/loading_container.dart';

import 'loading_controller.dart';

mixin LoadingStateMixin<T extends StatefulWidget> on State<T> {
  final LoadingController loadingController = LoadingController();

  @override
  void dispose() {
    loadingController.dispose();
    super.dispose();
  }

  loading(Future f) {
    return loadingController.loading(f);
  }

  Widget buildLoadingBody() {
    return Container(
      color: Colors.black45,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  LoadingContainer buildLoadingContainer({required Widget child}) {
    return LoadingContainer(
        child: child,
        controller: loadingController,
        loadingBody: buildLoadingBody());
  }
}
