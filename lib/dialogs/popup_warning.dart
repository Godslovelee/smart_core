import 'package:flutter/material.dart';
import 'package:smart_core_mobile/dialogs/popup_state.dart';

class PopupWarning extends PopupState {
  const PopupWarning({
    Key? key,
    required String popupTitle,
    String? popupSubtitle,
    List<Widget>? popupActions,
  }) : super(
          key: key,
          popupIcon: Icons.priority_high_rounded,
          popupIconColor: const Color(0xFFFFD912),
          popupTitle: popupTitle,
          popupSubtitle: popupSubtitle,
          popupActions: popupActions,
        );
}
