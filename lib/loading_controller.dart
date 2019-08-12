import 'dart:async';

class LoadingController {
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
