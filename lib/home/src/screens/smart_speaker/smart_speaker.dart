
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../../config/size_config.dart';
import '../../../../provider/base_view.dart';
import '../../../view/smart_speaker_view_model.dart';
import 'components/body.dart';
import 'components/expandable_bottom_sheet.dart';

class SmartSpeaker extends StatelessWidget {
  static String routeName = 'smart-speaker';
  const SmartSpeaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SmartSpeakerViewModel>(
        onModelReady: (model) => {},
        builder: (context, model, child) {
          return Material(
            child: SlidingUpPanel(
              minHeight: getProportionateScreenHeight(70),
              controller: model.pc,
              backdropEnabled: true,
              boxShadow: const [],
              body: Scaffold(
                backgroundColor: const Color(0xFFF2F2F2),
                body: Body(
                  model: model,
                ),
              ),
              panel: ExpandableBottomSheet(model: model),
            ),
          );
        });
  }
}
