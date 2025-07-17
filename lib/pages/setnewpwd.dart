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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: Color.fromRGBO(74, 103, 222, 1)),
            ),
            SizedBox(width: 20),
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
                  obscureText: true,),
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
                  obscureText: true,),
              
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