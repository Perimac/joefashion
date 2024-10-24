import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joefashion/common/services/storage.dart';
import 'package:joefashion/common/utils/kcolors.dart';
import 'package:joefashion/const/resource.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _navigator();
    super.initState();
  }

  _navigator() async{
    await Future.delayed(const Duration(milliseconds: 3000), (){
      //We check if the user is visiting the app for the first time using
      // the get_storage package.
      if(Storage().getBool('firstOpen') == null){
        //Go to the Onboarding Screen
        GoRouter.of(context).go('/onboarding');
      }else{
        // Go to the HomePage
         GoRouter.of(context).go('/home');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.ASSETS_IMAGES_SPLASHSCREEN_PNG),
          ),
        ),
      ),
    );
  }
}
