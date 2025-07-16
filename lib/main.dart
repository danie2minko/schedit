import 'package:flutter/material.dart';
import 'package:shedit/pages/accountcreated.dart';
import 'package:shedit/pages/forgotpassword.dart';
import 'package:shedit/pages/loginaccount.dart';
import 'package:shedit/pages/pwdchanged.dart';
import 'package:shedit/pages/setnewpwd.dart';
import 'package:shedit/pages/verification.dart';
import 'package:shedit/pages/welcome.dart';
import 'package:shedit/pages/ceateaccount.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize any necessary services or plugins here
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Welcome(),
      routes: {
        '/welcome': (context) => Welcome(),
        '/createaccount': (context) => Ceateaccount(),
        '/loginaccount': (context) => Loginaccount(),
        '/forgotpwd': (context) => Forgotpassword(),
        '/verification':(context) => Verification(),
        '/setnewpwd': (context) => Setnewpwd(),
        '/pwdchanged': (context) => Pwdchanged(),
        '/accountcreated': (context) => Accountcreated(),
      }
      );
  }
}
