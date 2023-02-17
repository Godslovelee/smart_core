import 'package:flutter/material.dart';

import '../../../../../config/size_config.dart';
import '../../home_screen/home_screen.dart';


class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF464646),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Material(
            child: Image.asset('lib/assets/images/splash_img.png'),
            color: Colors.transparent,
          ),
          Text(
            'Sweet & Smart Home',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: Colors.white,
                ),
          ),
          Text(
            'Smart Home can change\nway you live in the future',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: const Color(0xFFBDBDBD),
                ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
            child: Text(
              'Get Started',
              style: Theme.of(context).textTheme.headline2,
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(70),
                vertical: getProportionateScreenHeight(15),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // <-- Radius
              ),
            ),
          )
        ],
      ),
    );
  }
}
