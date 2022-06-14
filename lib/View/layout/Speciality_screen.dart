import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:nabdat/View//layoutComponents/bones.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpecialityScreen extends StatefulWidget {
  @override
  State<SpecialityScreen> createState() => _SpecialityScreenState();
}

class _SpecialityScreenState extends State<SpecialityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: Color.fromRGBO(1, 205, 170, 70),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
          child: Center(
            child: Text(
              'Speciality',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //inverted selection button bar
            AnimatedButtonBar(
              backgroundColor: Color.fromRGBO(1, 205, 170, 190),
              foregroundColor: Color.fromRGBO(1, 205, 170, 120),
              radius: 25.0,
              padding: const EdgeInsets.all(16.0),
              invertedSelection: false,
              children: [
                ButtonBarEntry(
                  onTap: () => () {},
                  child: Text(
                    'All',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ButtonBarEntry(
                    onTap: () => setState(() {}),
                    child: Text(
                      'Avaliable Today',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                ButtonBarEntry(
                  onTap: () => print('Third item tapped'),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(115, 50),
                      maximumSize: const Size(115, 50),
                      primary: Color.fromRGBO(1, 205, 170, 120),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text("Bones"),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BonesScreen()),
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(115, 50),
                      maximumSize: const Size(115, 50),
                      primary: Color.fromRGBO(1, 205, 170, 120),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      "Considerration",
                      style: TextStyle(
                        fontSize: 12.5,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(115, 50),
                      maximumSize: const Size(115, 50),
                      primary: Color.fromRGBO(1, 205, 170, 120),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text("Skin Desies"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
