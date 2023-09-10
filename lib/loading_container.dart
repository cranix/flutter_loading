import 'package:flutter/material.dart';
import 'loading_controller.dart';

class LoadingContainer extends StatelessWidget {
  final Widget child;
  final LoadingController controller;
  final Widget? loadingBody;

  const LoadingContainer(
      {Key? key,
      required this.controller,
      required this.child,
      this.loadingBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = loadingBody ??
        Container(
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
            stream: controller.loadingStream,
            builder: (context, snapshot) {
              return Visibility(
                visible: snapshot.data!,
                child: body,
              );
            }),
      ],
    );
  }
}
