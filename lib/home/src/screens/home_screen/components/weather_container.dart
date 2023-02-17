import 'package:flutter/material.dart';

import '../../../../../config/size_config.dart';
import '../../../../view/home_screen_view_model.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({Key? key, required this.model}) : super(key: key);

  final HomeScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(6),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(90),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '28°C',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'Cloudy',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Text(
                      '16 Feb 2023',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      'Mainz, Germany',
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          'lib/assets/images/weather/0.png',
          height: getProportionateScreenHeight(110),
          width: getProportionateScreenWidth(140),
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
