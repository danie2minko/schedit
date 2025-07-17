import 'package:flutter/material.dart';
import 'package:shedit/components/buttons/button.dart';
import 'package:shedit/components/buttons/mybuttons.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontFamily: 'roboto',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(74, 103, 222, 1),
              ),
              ),
              SizedBox(width: 185,),
              IconButton(onPressed: (){}, 
              icon: Icon(
                Icons.dark_mode_outlined,
                color: Color.fromRGBO(74, 103, 222, 1),)
                )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: Text(
                    'Login or Sign up to continue',
                    style: TextStyle(
                      fontFamily: 'roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
              ),
              
              Center(
                child: Column(
                  children: [
                    
                        
                    // image space
                        Container(
                          height: 300,
                        
                         
                          ),
                   // text
                   Text(
                    'Schedit',
                    style: TextStyle(
                      fontFamily: 'roboto',
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(74, 103, 222, 1),
                    ),
                    ),
                    Text('A Family Scheduling App', style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.bold,fontSize: 18),),
                    Text('For Parents', style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.bold,fontSize: 18),),
                     SizedBox(height: 40,),  
          
                    // bottons
                    Mybuttons(text: 'Create Account', onTap: ()=>{
                      Navigator.pushNamed(context, '/createaccount')
                    },
                    ),
                    SizedBox(height: 5,),
                    Button(text: 'Already have an account', onTap: () => {
                      Navigator.pushNamed(context, '/loginaccount')
                    },),
                    SizedBox(height: 10,),
                        
                    GestureDetector(
                      child: Text('Continue as a guest?', style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
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