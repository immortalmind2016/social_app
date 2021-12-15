import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/BlocObserver.dart';
import 'package:socialapp/modules/login_screen/login_screen.dart';
import 'package:socialapp/shared/style/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    theme:ThemeData(
    primarySwatch: defaultColor,
    appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.white,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    ),
    ),
    )
    );
  }
}


