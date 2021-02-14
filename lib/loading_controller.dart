import 'dart:async';

class LoadingController {
  final StreamController<bool> _loadingController = StreamController.broadcast();

  Stream<bool> get loadingStream => _loadingController.stream;

  void dispose() {
    _loadingController.close();
  }

  showLoading() {
    if (_loadingController.isClosed) {
      return;
    }
    _loadingController.add(true);
  }

  hideLoading() {
    if (_loadingController.isClosed) {
      return;
    }
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
