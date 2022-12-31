import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<void> internetConnectionService({
  AsyncCallback? onInternetAvaiable,
  AsyncCallback? onInternetUnavailable,
}) async {
  bool isInternetAvailable = await InternetConnectionChecker().hasConnection;
  if (isInternetAvailable) {
    if (onInternetAvaiable != null) {
      await onInternetAvaiable();
    }
  } else {
    if (onInternetUnavailable != null) {
      await onInternetUnavailable();
    }
  }
}
