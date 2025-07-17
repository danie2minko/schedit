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
                height: 300,
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
              SizedBox(height: 15,),
          
              //button
              Center(child: Mybuttons(text: 'Send Code', onTap: ()=>{
                Navigator.pushNamed(context, '/verification')
              })),

              Container(height: 150,),

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