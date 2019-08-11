library flutter_loading;

import 'dart:async';

import 'package:flutter/material.dart';

Widget buildFlutterLoadingContainer(
    {@required Widget child,
    @required LoadingBloc loadingBloc,
    Widget loadingBody}) {
  loadingBody ??= Container(
    color: Colors.black45,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
  return Stack(
    children: <Widget>[
      child,
      StreamBuilder<bool>(
          initialData: false,
          stream: loadingBloc.loadingStream,
          builder: (context, snapshot) {
            return Visibility(
              visible: snapshot.data,
              child: loadingBody,
            );
          }),
    ],
  );
}

class LoadingBloc {
  final StreamController<bool> _loadingController = StreamController();

  Stream<bool> get loadingStream => _loadingController.stream;

  void dispose() {
    _loadingController.close();
  }

  showLoading() {
    _loadingController.add(true);
  }

  hideLoading() {
    _loadingController.add(false);
  }


  loading(Future f) async {
    showLoading();
    try {
      return await f;
    } finally {
      hideLoading();
    }
  }
}

mixin LoadingStateMixin<T extends StatefulWidget> on State<T> {
  final LoadingBloc loadingBloc = LoadingBloc();

  @override
  void dispose() {
    loadingBloc.dispose();
    super.dispose();
  }

  loading(Future f) {
    return loadingBloc.loading(f);
  }

  Widget buildLoadingBody() {
    return Container(
      color: Colors.black45,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildLoadingContainer({@required Widget child}) {
    return buildFlutterLoadingContainer(
        child: child, loadingBloc: loadingBloc, loadingBody: buildLoadingBody());
  }
}
