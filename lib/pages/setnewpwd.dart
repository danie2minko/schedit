import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shedit/components/buttons/mybuttons.dart';
import 'package:shedit/components/textfield.dart';

class Setnewpwd extends StatefulWidget {
  const Setnewpwd({super.key});

  @override
  State<Setnewpwd> createState() => _SetnewpwdState();
}

class _SetnewpwdState extends State<Setnewpwd> {

  //controllers
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose (){
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? validateNewPassword(String? value) {
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
    if (value != _newPasswordController.text) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }

  Future<void> updatePassword(String newPassword) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await user.updatePassword(newPassword);
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
              icon: Icon(Icons.dark_mode_outlined, color: Color.fromRGBO(74, 103, 222, 1)),
            ),
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
              'Set New Password',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(74, 103, 222, 1),
              ),
            ),
            Text(
              'Create an unique password',
              style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 //image
                 Container(
                  height: 300,
                  child: Image.asset('assets/images/confirmation.png'),
                 ),

                //textformfield
                Text('New Password',
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Textfield(
                  hintText: 'Create new password',
                  controller: _newPasswordController,
                  obscureText: true,
                  ),
                SizedBox(height: 20,),
                Text('Confirm Password',
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Textfield(
                  hintText: 'Re-enter password',
                  controller: _confirmPasswordController,
                  obscureText: true,
                ),
              
                //button
                SizedBox(height: 20),
                Center(child: Mybuttons(text: 'Reset Password', onTap: ()=>{
                  Navigator.pushNamed(context, '/pwdchanged')
                })),

                SizedBox(height: 40),
                 Center(
                   child: GestureDetector(
                          onTap: () => {
                            Navigator.pushNamed(context, '/loginaccount')
                          },
                          child: Text('Reset Password later?',
                            style: TextStyle(fontFamily: 'roboto',fontSize: 18, 
                            color: Color.fromRGBO(74, 103, 222, 1)),
                            )
                            ),
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