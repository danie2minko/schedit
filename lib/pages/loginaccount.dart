import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shedit/components/buttons/mybuttons.dart';


class Loginaccount extends StatefulWidget {
  const Loginaccount({super.key});

  @override
  State<Loginaccount> createState() => _LoginaccountState();
}

class _LoginaccountState extends State<Loginaccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'L\'email est requis';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Veuillez entrer une adresse email valide';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est requis';
    }
    return null;
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color.fromRGBO(74, 103, 222, 1),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.dark_mode_outlined),
            color: Color.fromRGBO(74, 103, 222, 1),
            onPressed: () {
              
              setState(() {
               
              });
            },
          ),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Form(
          key: _formKey,
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
              SizedBox(height: 35),

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


              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter email address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                       color: Theme.of(context).colorScheme.error,
                       width: 2,
                        ),
                      ),
                   enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 2), 
                    ),

                  focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5),
                     borderSide: BorderSide(
                     color: Color.fromRGBO(74, 103, 222, 1),
                      width: 2,
                  ),
                ),
                hintStyle: TextStyle(
                 color: Colors.grey.shade300,
                  fontFamily: 'poppins',
               ),
                ),
                validator: validateEmail,
                keyboardType: TextInputType.emailAddress,
              ),


              SizedBox(height: 25),
              Text('Password', style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                       color: Theme.of(context).colorScheme.error,
                       width: 2,
                        ),
                      ),
                   enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 2), 
                    ),

                  focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5),
                     borderSide: BorderSide(
                     color: Color.fromRGBO(74, 103, 222, 1),
                      width: 2,
                  ),
                ),
                hintStyle: TextStyle(
                 color: Colors.grey.shade300,
                  fontFamily: 'poppins',
               ),
                ),
                obscureText: true,
                validator: validatePassword,
              ),
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
              SizedBox(height: 10),

              // check box
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                    activeColor: Color.fromRGBO(74, 103, 222, 1),
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(fontFamily: 'roboto', fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 15),

              // login button
              Center(
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Color.fromRGBO(74, 103, 222, 1),
                      )
                    : Mybuttons(
                        text: 'Login',
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          setState(() {
                            isLoading = true;
                          });

                          final email = _emailController.text.trim();
                          final password = _passwordController.text.trim();

                          try {
                            final error = await signIn(
                              email: email,
                              password: password,
                            );

                            if (!mounted) return;

                            setState(() {
                              isLoading = false;
                            });

                            if (error == null) {
                              Navigator.pushNamed(context, '/accountcreated');
                            } else {
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(error)));
                            }
                          } catch (e) {
                            if (!mounted) return;

                            setState(() {
                              isLoading = false;
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Une erreur est survenue'),
                              ),
                            );
                          }
                        },
                      ),
              ),

              SizedBox(height: 15),

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
              // social media buttons
            Center(
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        // image
                          Container(width: 100,),
                        //text
                        Text('Continue with Google', style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        // image
                          Container(width: 100,),
                        //text
                        Text('Continue with Apple', style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        // image
                          Container(width: 100,
                          child: Image.asset('assets/images/facebook.png',height: 20, width: 20,),
                          ),
                        //text
                        Text('Continue with Facebook', style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),

             Padding(
                padding: EdgeInsetsGeometry.only(left: 60),
                  child: Row(
                    children: [
                      Text('Do not have an account?',style: TextStyle(fontFamily: 'roboto',fontSize: 18, color: Colors.black),),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/createaccount')
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
      ),
    );
  }
}