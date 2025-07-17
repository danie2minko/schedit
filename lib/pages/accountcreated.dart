import 'package:flutter/material.dart';
import 'package:shedit/components/buttons/mybuttons.dart';

class Accountcreated extends StatefulWidget {
  const Accountcreated({super.key});

  @override
  State<Accountcreated> createState() => _AccountcreatedState();
}

class _AccountcreatedState extends State<Accountcreated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 230),
              child: IconButton(
                onPressed: () => {},
                icon: Icon(Icons.dark_mode_outlined, color: Color.fromRGBO(74, 103, 222, 1)),
              ),
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
              'Account created!',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(74, 103, 222, 1),
              ),
            ),
            Text(
              'Welcome to Schedit',
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
                    child: Image.asset('assets/images/winners.png'),
                    ),
                  //text
                  Text('Your account has been created ',
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