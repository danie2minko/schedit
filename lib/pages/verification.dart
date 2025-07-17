import 'package:flutter/material.dart';
import 'package:shedit/components/buttons/mybuttons.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {

  // Controllers for the verification code input fields
  final List<TextEditingController> _codeControllers = List.generate(4, (_) => TextEditingController());


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
              'Verification',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(74, 103, 222, 1),
              ),
            ),
            Text(
              'Enter the code to continue',
              style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //image
                   Container(
                    height: 300,
                   ),
                  //text
                   Text("We sent a code to ",
                   textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 18,
                     )
                      ),
                      Text("yourmail@outlook.com ",
                      textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                     )
                      ),
                      SizedBox(height: 30),

                  //textformfield
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                   child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: List.generate(4, (index) {
                    return Container(
                      width: 60,
                      height: 70,
                      child: TextFormField(
                        controller: _codeControllers[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 40),
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
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
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value.length == 1 && index < 3) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    );
                                   }),
                                 ),
                 ),
              
                  //button
                  SizedBox(height: 10),
                  Mybuttons(text: 'Continue', onTap: ()=>{
                    Navigator.pushNamed(context, '/setnewpwd')
                  }),

                  SizedBox(height: 20),

                  Padding(
                padding: EdgeInsetsGeometry.only(left: 60),
                  child: Row(
                    children: [
                      Text('Did not receive a code?',style: TextStyle(fontFamily: 'roboto',fontSize: 18, color: Colors.black),),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/loginaccount')
                        },
                        child: Text('Send again',
                          style: TextStyle(fontFamily: 'roboto',fontSize: 18, 
                          color: Color.fromRGBO(74, 103, 222, 1)),
                          )
                          )
                    ],
                  ),
                ),

                Container(height: 80,),

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
            )
          ],
        ),
      ),
    );
  }
}