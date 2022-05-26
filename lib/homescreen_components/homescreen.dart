
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../layout/Speciality_screen.dart';
import '../../layout/doctors_screen.dart';
import '../layout/Analysis.dart';
import '../layout/Radiolgy_Screen.dart';
class homescrren extends StatefulWidget {
  const homescrren({Key? key}) : super(key: key);


  @override
  State<homescrren> createState() => _homescrrenState();
}

class _homescrrenState extends State<homescrren> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          const SizedBox(height: 40,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: const [
                        Text('Hello',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text('Ahmed bakr',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ],
                    ),

                   Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Image(
                      image: AssetImage(
                        'assets/image/noun-profile-709597.png',
                      ),
                      height: 55,
                      width: 55,
                    ),
                  ),
                ],
            ),
             ),
               Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,
               ),
              child: Container(
                height: 120,

                child:   ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) => buildStoryItem(),


                ),
              ),
            ),
            const SizedBox(height: 5),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 5),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [

                   const Padding(
                     padding: EdgeInsets.all(12.0),
                     child: Text('Appointment Today',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 17,
                         color: Color.fromRGBO(1, 205, 170,1),
                       ),
                     ),
                   ),

                   TextButton(onPressed: () {}, child:
                   Text('See All',
                     style: TextStyle(
                       color: Colors.yellow[600],
                     ),

                   ),
                   ),
                 ],
               ),
             ),

          ],
        ),

          const SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              height: 110,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(1, 205, 170,90),
                borderRadius: BorderRadius.circular(13),
              ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 20,),
                        const CircleAvatar(
                          radius: 25.0,
                          backgroundImage:  NetworkImage('https://www.allaboutbirds.org/guide/assets/photo/303618951-480px.jpg'),
                        ),
                        const SizedBox(width: 15,),
                        Column(
                          children: const [

                        Text('Dr.Salma Emad',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        ),
                        Text('Dentel Specialis',
                          style: TextStyle(
                            color: Colors.white,
                          ),),
      ],
                        ),

                      ],
                    ),
                    const SizedBox(height: 14,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(1, 205, 170,50),

                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children:  [
                                 Row(
                                   children: [
                                     Icon(
                                      Icons.calendar_month_outlined,
                                ),

                               Text('Monday,May 5',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                                   ],
                                 ),
                              Row(
                                children: [
                                  Icon(Icons.access_time),

                              Text('11:00AM-12:00AM',
                                style: TextStyle(
                                  color: Colors.white,
                                ),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
      ],
    ),
    );
  }

  Widget buildStoryItem()=>  Row(

    children: [
      SizedBox(
        width: 92.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
            InkWell(
              borderRadius: BorderRadius.circular(22),
              splashColor: Colors.black ,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Doctor_screen()),
            ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(1, 205, 170 ,190),
                    ),
                    child: const Image(
                      image: AssetImage(
                        'assets/image/noun-doctor-987749.png',
                      ),
                      height: 72,
                      width: 72,
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 5.0,
                    end: 3.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Doctors',
              style:  TextStyle(
                fontSize: 11
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),

      SizedBox(
        width: 92.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(22),
                  splashColor: Colors.black ,

                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SpecialityScreen()),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:  Color.fromRGBO(1, 205, 170 ,190),
                    ),
                    child: const Image(
                      image: AssetImage(
                        'assets/image/noun-report-987711.png',
                      ),
                      height: 72,
                      width: 72,
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 5.0,
                    end: 3.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Speciality',
              style:  TextStyle(
                  fontSize: 11
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
      SizedBox(
        width: 92.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(22),
                  splashColor: Colors.black ,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Analysis_screen()),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:  Color.fromRGBO(1, 205, 170 ,190),
                    ),
                    child: const Image(
                      image: AssetImage(
                        'assets/image/noun-test-tube-987718.png',
                      ),
                      height: 72,
                      width: 72,
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 5.0,
                    end: 3.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Analysis',
              style: TextStyle(
                  fontSize: 11
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
      SizedBox(
        width: 92,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(22),
                  splashColor: Colors.black ,
                  onTap: () => Navigator.push(
                   context,
                    MaterialPageRoute(builder: (context) => RadiolgyScreen()),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(1, 205, 170 ,190),
                    ),
                    child: const Image(
                      image: AssetImage(
                        'assets/image/noun-x-ray-4792268.png',
                      ),
                      height: 72,
                      width: 72,
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 5.0,
                    end: 3.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Radiolgy',
              style: TextStyle(
                  fontSize: 11
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    ],
  );
}
