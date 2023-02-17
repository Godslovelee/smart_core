import 'package:flutter/material.dart';

import 'components/body.dart';

class LoginScreen  extends StatelessWidget {
	static String routeName = '/login-screen';
	const LoginScreen({Key? key}) : super(key: key);

	@override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset:false,
	    body: LoginView(),
    );
  }
}
