
import 'package:flutter/material.dart';

import '../../../../../config/size_config.dart';
import '../../../../view/smart_tv_view_model.dart';
import 'intensity_slider.dart';
import 'mood_toggle_buttons.dart';


class Body extends StatelessWidget {
  final SmartTvViewModel model;
  const Body({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Padding(
            padding: EdgeInsets.only(
              top: getProportionateScreenHeight(50),
            ),
            child: Image.asset(
              'lib/assets/images/tv.png',
              height: getProportionateScreenHeight(450),
              width: getProportionateScreenWidth(260),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenHeight(7),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(19),
                      top: getProportionateScreenHeight(7),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(40),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back_outlined)),
                        Stack(
                          children: [
                            Text(
                              'Living\nRoom',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                fontSize: 45,
                                color: const Color(0xFFBDBDBD)
                                    .withOpacity(0.5),
                              ),
                            ),
                            Text(
                              'Smart\nTv',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(26),
                        ),
                        Text(
                          'Power',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(4),
                        ),
                        Switch.adaptive(
                          inactiveThumbColor: const Color(0xFFE4E4E4),
                          inactiveTrackColor: Colors.white,
                          activeColor: Colors.white,
                          activeTrackColor: const Color(0xFF464646),
                          value: model.isTvOff,
                          onChanged: (value) {
                            model.tvSwitch(value);
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(90),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MoodToggleButtons(model: model),
            Intensity(model: model),
          ],
        ),
      ],
    );
  }
}
