import 'package:chatapp/SP/constants.dart';
import 'package:chatapp/helper/helper_func.dart';
import 'package:chatapp/pages/auth/login.dart';
import 'package:chatapp/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: Constants.apiKey, 
      appId: Constants.appId, 
      messagingSenderId: Constants.messaingSenderId, 
      projectId: Constants.projectId)
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: intermediateScreen(),
    );
  }
}


class intermediateScreen extends StatefulWidget {
  const intermediateScreen({super.key});

  @override
  State<intermediateScreen> createState() => _intermediateScreenState();
}

class _intermediateScreenState extends State<intermediateScreen> {
  bool _isSignedIn = false;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }
  void getUserLoggedInStatus() async{
    await HelperFunc.getUserLoggedInStatus().then((value) {
      if (value!=null){
       _isSignedIn = value; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor:Color.fromRGBO(18, 18, 18, 1),

      duration: 2000,
    nextScreen: _isSignedIn ? const HomePage() : const LogInPage(), 
      splash: Container(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/icon.jpeg'),
                      fit:BoxFit.contain)),
                ),),
                Expanded(
                  child: Container(
                    child: Text('By Hartati Viriya S',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                  ))
            ],
          ),
        ),
      ),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 200,
    );
  }
}

