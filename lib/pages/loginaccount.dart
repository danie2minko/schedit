import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shedit/components/buttons/mybuttons.dart';
import 'package:shedit/components/textfield.dart';

class Loginaccount extends StatefulWidget {
  const Loginaccount({super.key});

  @override
  State<Loginaccount> createState() => _LoginaccountState();
}

class _LoginaccountState extends State<Loginaccount> {

  //controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<String?> signIn({required String email, required String password}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    return null; 
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'Aucun utilisateur trouvé pour cet e-mail.';
    } else if (e.code == 'wrong-password') {
      return 'Mot de passe incorrect.';
    } else if (e.code == 'invalid-email') {
      return 'L\'adresse e-mail n\'est pas valide.';
    } else if (e.code == 'invalid-credential') {
      return 'Les identifiants fournis sont incorrects.';
    }
    return 'Une erreur est survenue lors de la connexion.';
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
            IconButton(
              onPressed: ()=>{}, 
              icon: Icon(Icons.arrow_back, color: Color.fromRGBO(74, 103, 222, 1),
              )
              ),
            SizedBox(width: 20,),
            IconButton(onPressed: ()=>{}, 
            icon: Icon(Icons.dark_mode_outlined, color: Color.fromRGBO(74, 103, 222, 1),
            )
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(74, 103, 222, 1),
              ),
            ),
            Text(
              'Login to continue',
              style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20,),
            
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
              controller: _emailController,),
            SizedBox(height: 15,),
            Text('Password', style: TextStyle(fontSize: 18)),
            Textfield(
              hintText: 'Enter password',
              controller: _passwordController,),
            Padding(
              padding: EdgeInsets.only(left: 225),
              child: GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(context, '/forgotpwd')
                },
                child: Text('Forgot Password?', 
                style: TextStyle(fontFamily: 'roboto', fontSize: 16, color: Color.fromRGBO(74, 103, 222, 1)
                ),
                //textAlign: TextAlign.end,
                ),
              ),
            ),
            SizedBox(height: 10,),

            // check box
            Row(  
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                  activeColor: Color.fromRGBO(74, 103, 222, 1),
                ),
                Text(
                  'Remember me',
                  style: TextStyle(fontFamily: 'roboto', fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 10,),

            // login button
            Center(child: Mybuttons(text: 'Login', 
            onTap: ()=>signIn(email: _emailController.text, password: _passwordController.text).then((error) {
              if (error == null) {
                Navigator.pushNamed(context, '/welcome');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error)),
                      );
              }
            }
            )
            ),
            ),
            
            SizedBox(height: 10,),

            // or sign up with
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey,)),
                    Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                    child: Text('or sign up with', style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 16,
                      color: Colors.grey,),
                    )
                    ),
                    Expanded(child: Divider(color: Colors.grey,)),
                  ],
                ),
                ),

            // social media buttons
            Container(height: 150,),

            Padding(
                padding: EdgeInsetsGeometry.only(left: 60),
                  child: Row(
                    children: [
                      Text('Do not have an account?',style: TextStyle(fontFamily: 'roboto',fontSize: 18, color: Colors.black),),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/loginaccount')
                        },
                        child: Text('Sign Up',
                          style: TextStyle(fontFamily: 'roboto',fontSize: 18, 
                          color: Color.fromRGBO(74, 103, 222, 1)),
                          )
                          )
                    ],
                  ),
                )
      
      
          ],
        ),
      ),
    );
  }
}