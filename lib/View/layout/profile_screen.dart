import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [

              Stack(
                children:
                [
                  Container(
                  width:double.infinity,
                  height: 150,
                  decoration:  BoxDecoration(
                    color:  Color.fromRGBO(1, 205, 170,70),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),


                    child: Padding(
                      padding: const EdgeInsets.only(top: 40,),
                      child: Align(
                        alignment: Alignment.topCenter,
                      child: Text('Profile',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ),

                ),
                   Padding(
                     padding: const EdgeInsets.only(top: 75,),
                     child: Center(
                       child: const Image(
                        image: AssetImage(
                          'assets/image/Ellipse 18.png',
                        ),
                        height: 150,
                        width: 150,
                  ),
                     ),
                   ),
        ],
              ),
              SizedBox(height: 5,),
              Text('Name : test',
                style: TextStyle(
                  color: const Color.fromRGBO(1, 91, 76,70),
                ),
              ),
              SizedBox(height: 5,),
              Text('Age : 23',
                style: TextStyle(
                  color: const Color.fromRGBO(1, 91, 76,70),
                ),
              ),
              SizedBox(height: 5,),
              Text('E-mail : bakr@gmail.com',
                style: TextStyle(
                  color: const Color.fromRGBO(1, 91, 76,70),
                ),
              ),
              SizedBox(height: 5,),
              Text('Phone : 0110000000',
                style: TextStyle(
                  color: const Color.fromRGBO(1, 91, 76,70),
                ),
              ),
              SizedBox(height: 10,),
              Text('Report',
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromRGBO(1, 91, 76,50),
                fontWeight: FontWeight.bold,
              ),),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(

                  maxLines: 20,
                  readOnly: true,
                  decoration: InputDecoration(
                  fillColor: Colors.white, filled: true,
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  ),

                ),
              ),
        ],
    ),
      ),
    );
  }
}