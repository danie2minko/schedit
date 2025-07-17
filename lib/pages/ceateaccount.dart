import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shedit/components/buttons/mybuttons.dart';


class Ceateaccount extends StatefulWidget {
  const Ceateaccount({super.key});

  @override
  State<Ceateaccount> createState() => _CeateaccountState();
}

class _CeateaccountState extends State<Ceateaccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool isLoading = false;
  bool _agreedToPolicy = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est requis';
    }
    if (value.length < 6) {
      return 'Le mot de passe doit contenir au moins 6 caractères';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La confirmation du mot de passe est requise';
    }
    if (value != _passwordController.text) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }

  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return null; 
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          return 'Le mot de passe est trop faible.';
        case 'email-already-in-use':
          return 'Un compte existe déjà pour cet e-mail.';
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
          child: Form(
            key: _formKey,
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
                  hintText: 'Create password',
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


              SizedBox(height: 25),
              Text('Confirm Password', style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  hintText: 'Re-enter password',
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
                validator: validateConfirmPassword,
              ),


              SizedBox(height: 10),

              //check box
              Row(
                children: [
                  Checkbox(
                    value: _agreedToPolicy,
                    onChanged: (value) {
                      setState(() {
                        _agreedToPolicy = value ?? false;
                      });
                    },
                    activeColor: Color.fromRGBO(74, 103, 222, 1),
                  ),
                  Text(
                    'I agree with privacy policy',
                    style: TextStyle(fontFamily: 'roboto', fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 15),

              // create account button ou loading
              Center(
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Color.fromRGBO(74, 103, 222, 1),
                      )
                    : Mybuttons(
                        text: 'Sign Up',
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          if (!_agreedToPolicy) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(''),
                              ),
                            );
                            return;
                          }

                          setState(() {
                            isLoading = true;
                          });

                          final email = _emailController.text.trim();
                          final password = _passwordController.text.trim();

                          try {
                            final error = await signUp(
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(error)),
                              );
                            }
                          } catch (e) {
                            if (!mounted) return;

                            setState(() {
                              isLoading = false;
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Une erreur est survenue')),
                            );
                          }
                        }
                        ,
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
                        'or sign in with',
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
               //SizedBox(height: 20),


              // social media buttons
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 40),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 55,
                        width: 70,
                        child: Image.asset('assets/images/google.png'),
                      ),
                  
                    SizedBox(width: 20,),
                     Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 55,
                        width: 70,
                      ),
                    
                    SizedBox(width: 20,),
                     Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 55,
                        width: 70,
                      ),
                  ],
                ),
              ),
             SizedBox(height: 40,),
              
              //other option
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
    ));
  }
}