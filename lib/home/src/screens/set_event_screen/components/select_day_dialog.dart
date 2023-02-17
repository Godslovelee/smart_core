
import 'package:flutter/material.dart';

import '../../../../../dialogs/dialog_widgets/popup_filled_button.dart';
import '../../../../../dialogs/popup_warning.dart';

class SelectDayDialog extends StatelessWidget {
  const SelectDayDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupWarning(
      popupTitle: 'Please Select a Day!',
      popupSubtitle: 'Select by tapping on a day',
      popupActions: <Widget>[
        PopupFilledButton(
          onPressed: () => Navigator.pop(context),
          text: 'Ok',
        ),
      ],
    );
  }
}
