
import 'package:flutter/material.dart';
import 'package:smart_core_mobile/home/src/screens/home_screen/home_screen.dart';

import '../../../../../config/size_config.dart';

class LoginView extends StatelessWidget {
	const LoginView({Key? key}) : super(key: key);

	@override
  Widget build(BuildContext context) {

    return Column(
	        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
	        children: [
	        	Image.asset('lib/assets/images/login.png',
				        height: getProportionateScreenHeight(300),
	        	width: double.infinity,
	        	fit: BoxFit.fill,),

		        Positioned(
			        bottom: getProportionateScreenHeight(20),
			        left: getProportionateScreenWidth(20),
			        child: Column(

				        crossAxisAlignment: CrossAxisAlignment.start,

				      children: [
				      	Text('SMART',style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black, fontSize: 33),),
					      Text('HOME', style:  Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 64),)
				      ],
		        )),
	        ],
        ),
	          const Padding(
	            padding: EdgeInsets.all(20.0),
	            child: Text('sign into \nmange your device & accessory',style: TextStyle(fontSize: 18),),
	          ),


	          Padding(
		          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
		          child: TextField(

			          decoration: InputDecoration(
				          contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
				          border: OutlineInputBorder(borderRadius: BorderRadius.circular(70.0),),
				          hintText: 'Email',
				          suffixIcon: const Icon(Icons.email, color: Colors.black,)
			          ),),
	          ),

	          SizedBox(height: getProportionateScreenHeight(20)),
	          Padding(
		          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
		          child: TextField(

			          decoration: InputDecoration(
				          contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
				          border: OutlineInputBorder(borderRadius: BorderRadius.circular(70.0),),
				          hintText: 'Password',
				          suffixIcon: const Icon(Icons.lock, color: Colors.black,)
			          ),),
	          ),
	          SizedBox(height: getProportionateScreenHeight(20)),
	          Padding(
	            padding: const EdgeInsets.only(left: 20.0, right: 20),
	            child: GestureDetector(
		            onTap: (){
			            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

		            },
	              child: Container(
		          width: double.infinity,
		          padding: const EdgeInsets.all(16.0),
		          decoration:BoxDecoration(
			          color: const Color(0xFF464646),
			          borderRadius:BorderRadius.circular(70.0), ),
		          child: const Text('Get Started', style: TextStyle(color: Colors.white),),alignment: Alignment.center,),
	            ),
	          ),
	          SizedBox(height: getProportionateScreenHeight(10)),

	          const Center(child: Text('Don\'t have an account yet?'))




      ],
    );
  }
}
