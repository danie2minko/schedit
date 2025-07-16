import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shedit/components/buttons/mybuttons.dart';
import 'package:shedit/components/textfield.dart';

class Ceateaccount extends StatefulWidget {
  const Ceateaccount({super.key});

  @override
  State<Ceateaccount> createState() => _CeateaccountState();
}

class _CeateaccountState extends State<Ceateaccount> {
  //controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<String?> signUp({required String email, required String password}) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    return null; // Succès
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      return 'Le mot de passe est trop faible.';
    } else if (e.code == 'email-already-in-use') {
      return 'Un compte existe déjà pour cet e-mail.';
    } else if (e.code == 'invalid-email') {
      return 'L\'adresse e-mail n\'est pas valide.';
    }
    else if (e.code == 'email-already-in-use') {
      return 'Un compte existe déjà pour cet e-mail.';
    } else if (e.code == 'invalid-email') {
      return 'L\'adresse e-mail n\'est pas valide.';
    }
    return 'Une erreur est survenue lors de l\'inscription.';
  } catch (e) {
    return 'Une erreur inconnue est survenue.';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(width: 230),
            IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.dark_mode_outlined,
                color: Color.fromRGBO(74, 103, 222, 1),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(74, 103, 222, 1),
                ),
              ),
              Text(
                'Sign up to continue',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
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
                hintText: 'Enter email adress',
                controller: _emailController,
              ),
              SizedBox(height: 15),
              Text('Password', style: TextStyle(fontSize: 18)),
              Textfield(
                hintText: 'Create password',
                controller: _passwordController,
              ),
              SizedBox(height: 15),
              Text('Confirm Password', style: TextStyle(fontSize: 18)),
              Textfield(
                hintText: 'Re-enter password',
                controller: _confirmPasswordController,
              ),
              SizedBox(height: 10),

              //check box
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    activeColor: Color.fromRGBO(74, 103, 222, 1),
                  ),
                  Text(
                    'I agree with privacy policy',
                    style: TextStyle(fontFamily: 'roboto', fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // create account button
              Center(
                child: Mybuttons(
                  text: 'Sign Up',
                  onTap: () => signUp(email: _emailController.text, password: _passwordController.text).then((error) {
                    if (error == null) {
                      Navigator.pushNamed(context, '/accountcreated');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error)),
                      );
                    }
                  }),
                ),
              ),

              SizedBox(height: 10),

              // or sign up with
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                      child: Text(
                        'or sign up with',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
              ),

              // social media buttons
              Container(height: 150),

              Padding(
                padding: EdgeInsetsGeometry.only(left: 60),
                child: Row(
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.pushNamed(context, '/loginaccount'),
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 18,
                          color: Color.fromRGBO(74, 103, 222, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
