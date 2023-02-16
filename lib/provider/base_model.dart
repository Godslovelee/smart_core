import 'package:flutter/material.dart';
import 'package:smart_core_mobile/core/injection/injection.dart';
import 'package:smart_core_mobile/enum/view_state.dart';
import 'package:smart_core_mobile/routes/navigation.dart';

class BaseModel extends ChangeNotifier {
  final navigationService = getIt<NavigationService>();
  ViewState _state = ViewState.idle;

  ViewState get state => _state;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
