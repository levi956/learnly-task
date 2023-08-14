import 'package:flutter/material.dart';

class BaseNotifier<T> extends ChangeNotifier {
  NotifierState<T> state = const NotifierState();

  BaseNotifier() {
    onInit();
  }

  void onInit() {}

  void setLoading() {
    state = const NotifierState(status: NotifierStatus.loading);
    notifyListeners();
  }

  void setIdle() {
    state = const NotifierState(status: NotifierStatus.idle);
    notifyListeners();
  }

  setData(T data) {
    state = NotifierState(status: NotifierStatus.done, data: data);
    notifyListeners();
  }

  void setError(String message) {
    state = NotifierState(
      status: NotifierStatus.error,
      message: message,
    );
    notifyListeners();
  }
}

typedef FutureNotifierState<T> = Future<NotifierState<T>>;

enum NotifierStatus { loading, idle, done, error }

class NotifierState<T> {
  final T? data;
  final NotifierStatus status;
  final String? message;
  const NotifierState({
    this.data,
    this.status = NotifierStatus.idle,
    this.message,
  });

  bool get isDone => status == NotifierStatus.done;
  bool get isLoading => status == NotifierStatus.loading;
  bool get isIdle => status == NotifierStatus.idle;
  bool get isError => status == NotifierStatus.error;

  Widget when({
    required Widget Function(T data) done,
    required Widget Function(String? message) error,
    required Widget Function() loading,
    Widget Function()? idle,
  }) {
    switch (status) {
      case NotifierStatus.loading:
        {
          return loading();
        }
      case NotifierStatus.idle:
        {
          if (idle == null) {
            return const SizedBox();
          }
          return idle();
        }
      case NotifierStatus.done:
        {
          return done(data as T);
        }
      case NotifierStatus.error:
        {
          return error(message);
        }
    }
  }
}
