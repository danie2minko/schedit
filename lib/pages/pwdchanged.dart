import 'package:flutter/material.dart';
import 'package:shedit/components/buttons/mybuttons.dart';

class Pwdchanged extends StatefulWidget {
  const Pwdchanged({super.key});

  @override
  State<Pwdchanged> createState() => _PwdchangedState();
}

class _PwdchangedState extends State<Pwdchanged> {
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
              'Password Changed!',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(74, 103, 222, 1),
              ),
            ),
            Text(
              'No hussle anymore',
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
                    Container(height: 300,
                    child: Image.asset('assets/images/happy-news.png'),
                    ),
                  //text
                  Text('Your password has been changed ',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text('Successfully!',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  //button
                  SizedBox(height: 20),
                  Mybuttons(text: 'Continue', onTap: ()=>{})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}