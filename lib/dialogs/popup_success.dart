import 'package:flutter/material.dart';
import 'package:smart_core_mobile/dialogs/popup_state.dart';

class PopupSuccess extends PopupState {
  const PopupSuccess({
    Key? key,
    required String popupTitle,
    String? popupSubtitle,
    List<Widget>? popupActions,
  }) : super(
          key: key,
          popupIcon: Icons.check_rounded,
          popupIconColor: const Color(0xFF27AE60),
          popupTitle: popupTitle,
          popupSubtitle: popupSubtitle,
          popupActions: popupActions,
        );
}
