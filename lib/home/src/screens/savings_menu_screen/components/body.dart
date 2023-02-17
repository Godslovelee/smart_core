
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_core_mobile/home/src/screens/savings_menu_screen/components/savings_widget.dart';

import '../../../../../config/size_config.dart';

class SavingScreenView extends StatelessWidget {
  const SavingScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(10),
          bottom: getProportionateScreenHeight(15),
        ),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7, right: 7),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Text(
                          'Savings',
                          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                            'assets/icons/svg/savings_filled.svg'
                             ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),

                  const Savings(title: 'Weekly savings',savings: 12),
                  const Savings(title: 'Monthly savings',savings: 39),
                ],
              ),
            ),
          ],
        )
    );
  }
}
