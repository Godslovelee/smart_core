import 'package:flutter/material.dart';

import 'dialog_widgets/popup_alert_dialog.dart';
import 'dialog_widgets/popup_list_tile.dart';

class PopupForm extends StatelessWidget {
  const PopupForm({
    Key? key,
    required this.popupTitle,
    this.popupSubtitle,
    required this.popupFormContent,
    this.popupFormActions,
  }) : super(key: key);

  final String popupTitle;
  final String? popupSubtitle;
  final List<Widget> popupFormContent;
  final List<Widget>? popupFormActions;

  @override
  Widget build(BuildContext context) {
    return PopupAlertDialog(
      popupTopWidget: PopupListTile(
        popupTitle: popupTitle,
        popupSubtitle: popupSubtitle,
      ),
      popupContent: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: popupFormContent,
        ),
      ),
      popupActions: popupFormActions,
    );
  }
}