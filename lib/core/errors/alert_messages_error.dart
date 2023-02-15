import 'package:flutter/material.dart';

class AlertMessagesTrigger {
  //! set Alert value
  Future<void> setAlertValue({
    String name = 'AlertMessageRouteNames.AlertMessageWidget',
    String? message,
    GlobalKey<NavigatorState>? navKey,
    bool hasError = true,
    bool checkPop = true,
    Function? function,
  }) async {
    if (navKey!.currentState!.canPop() && checkPop) {
      navKey.currentState!.pop();
    }
    navKey.currentState!.pushNamed(
      name,
      arguments: [
        message,
        hasError,
        if (hasError) '' else '',
      ],
    );
    for (var i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1)).then((value) {
        if (i == 4) {
          if (navKey.currentState!.canPop()) {
            navKey.currentState!.pop();
          }
          if (function != null) {
            function();
          }
        }
      });
    }
  }
}
