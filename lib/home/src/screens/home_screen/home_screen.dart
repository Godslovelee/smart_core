import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/size_config.dart';
import '../../../../provider/base_view.dart';
import '../../../view/home_screen_view_model.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

import '../favourites_screen/favourites_screen.dart';
import '../menu_page/menu_screen.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseView<HomeScreenViewModel>(
        onModelReady: (model) => {
              model.generateRandomNumber(),
            },
        builder: (context, model, child) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: getProportionateScreenHeight(60),
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.black),
                title: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(
                      4,
                    ),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi, James',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(30),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xffdadada),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(45, 45)),
                        ),
                        child: IconButton(
                          splashRadius: 25,
                          icon: const Icon(
                            FontAwesomeIcons.solidUser,
                            color: Colors.redAccent,
                          ),
                          onPressed: () => {},
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(3),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xffdadada),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(45, 45)),
                        ),
                        child: IconButton(
                          splashRadius: 25,
                          icon: const Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.grey,
                            size: 30,
                          ),
                          onPressed: () {
                            // Navigator.of(context).pushNamed(EditProfile.routeName);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Favourites(
                                    model: model,
                                  ),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(
                    getProportionateScreenHeight(
                      35,
                    ),
                  ),
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.white.withOpacity(0.3),
                      indicatorColor: const Color(0xFF464646),
                      tabs: [
                        Tab(
                          child: Text(
                            'Living Room',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Dining',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Kitchen',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ]),
                ),
              ),
              drawer: SizedBox(
                  width: getProportionateScreenWidth(270), child: const Menu()),
              body: TabBarView(
                children: <Widget>[
                  Body(
                    model: model,
                  ),
                  Center(
                    child: Text(
                      'Coming Soon',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  const Center(
                    child: Text('Coming soon'),
                  ),
                ],
              ),
              bottomNavigationBar: CustomBottomNavBar(model: model),
            ),
          );
        });
  }
}
