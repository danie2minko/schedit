import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shedit/components/buttons/mybuttons.dart';
import 'package:shedit/components/textfield.dart';


class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {

  //controller
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'L\'email est requis';
    }
    if (!isValidEmail(value)) {
      return 'Veuillez entrer une adresse email valide';
    }
    return null;
  }

  Future<String?> Resetpwd({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.trim(),
      );
      return null; // Succès
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return 'L\'adresse e-mail n\'est pas valide.';
        default:
          return 'Une erreur est survenue lors de l\'inscription.';
      }
    } catch (e) {
      return 'Une erreur inconnue est survenue.';
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            
            
            Padding(
              padding: EdgeInsets.only(left: 230),
              child: IconButton(onPressed: ()=>{}, 
              icon: Icon(Icons.dark_mode_outlined, color: Color.fromRGBO(74, 103, 222, 1),
              )
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20,vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password?',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(74, 103, 222, 1),
                ),
              ),
              Text(
                'No worries, We got you.',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20,),
          
              //image
              Container(
                //color: Color.fromRGBO(74, 103, 222, 1),
                height: 400,
                child: Image.asset('assets/images/forgot-password.png'),
              ),
          
              Row(
                  children: [
                    Text(
                      'Email Adress',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 135),
                    GestureDetector(
                      onTap: () => {},
                      child: Text(
                        'Mobile Number?',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromRGBO(74, 103, 222, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              Textfield(
                hintText: 'Enter email address',
                controller: _emailController,
                obscureText: false,),
              SizedBox(height: 20,),
          
              //button
              Center(child: Mybuttons(text: 'Send Code', onTap: ()=>{
                Navigator.pushNamed(context, '/verification')
              })),

              Container(height: 100,),

              Padding(
                padding: EdgeInsetsGeometry.only(left: 120),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back),
                    GestureDetector(
                      onTap: () => {
                        Navigator.pushNamed(context, '/loginaccount')
                      },
                      child: Text('Back to Login'))
                  ],
                ),
              )
          
              
            ],
          ),
        ),
      ),
    );
  }
}