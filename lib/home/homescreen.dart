import 'package:flutter/material.dart';
class homescrren extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          SizedBox(height: 40,),
             Row(

              children: [
                SizedBox(width: 15,),
                  Column(
                    children: [
                      Text('Hello'),
                      Text('Ahmed bakr',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ],
                  ),
                    SizedBox(width: 255,),
                    CircleAvatar(

                      radius: 25.0,
                      backgroundImage:  NetworkImage('https://www.allaboutbirds.org/guide/assets/photo/303618951-480px.jpg'),
                  ),
              ],
            ),
             SizedBox(height: 20,),
             SingleChildScrollView(
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 100,
                child:   ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index)  => SizedBox(width: 15,),

                ),
              ),
            ),
            SizedBox(height: 5),
             Row(
               children: [
                 SizedBox(width: 12,),
                 Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Text('Appointment Today',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 16,
                     ),
                   ),
                 ),
                 SizedBox(width: 160,),
                 TextButton(onPressed: () {}, child:
                 Text('See All'),
                 ),
               ],
             ),

          ],
        ),
      ),
          SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              height: 110,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),

                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage:  NetworkImage('https://www.allaboutbirds.org/guide/assets/photo/303618951-480px.jpg'),
                        ),
                        SizedBox(width: 15,),
                        Column(
                          children: [

                        Text('Dr.Salma Emad'),
                        Text('Dentel Specialis'),
      ],
                        ),

                      ],
                    ),
                    SizedBox(height: 14,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],

                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 13,),
                            Icon(
                              Icons.calendar_month_outlined,
                            ),
                            SizedBox(width: 5,),
                            Text('Monday,May 5'),
                            SizedBox(width: 90,),
                            Icon(Icons.access_time),
                            Text('11:00AM-12:00AM'),
                          ],
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
      Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
            InkWell(
            onTap: () => print("image clicked"),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage
                      (
                        'https://www.allaboutbirds.org/guide/assets/photo/303618951-480px.jpg'
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 5.0,
                    end: 3.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('Doctors',
              style: TextStyle(
                fontSize: 11
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
  InkWell(
  onTap: () => print("image clicked"),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage
                      (
                        'https://www.allaboutbirds.org/guide/assets/photo/303618951-480px.jpg'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 5.0,
                    end: 3.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('Specialist',
              style: TextStyle(
                  fontSize: 11
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
  InkWell(
  onTap: () => print("image clicked"),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage
                      (
                        'https://www.allaboutbirds.org/guide/assets/photo/303618951-480px.jpg'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 5.0,
                    end: 3.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('Radiology',
              style: TextStyle(
                  fontSize: 11
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
  InkWell(
  onTap: () => print("image clicked"),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage
                      (
                        'https://www.allaboutbirds.org/guide/assets/photo/303618951-480px.jpg'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 5.0,
                    end: 3.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('Specialist',
              style: TextStyle(
                  fontSize: 11
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
  InkWell(
  onTap: () => print("image clicked"),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage
                      (
                        'https://www.allaboutbirds.org/guide/assets/photo/303618951-480px.jpg'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 5.0,
                    end: 3.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('Specialist',
              style: TextStyle(
                  fontSize: 11
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
  InkWell(
  onTap: () => print("image clicked"),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage
                      (
                        'https://www.allaboutbirds.org/guide/assets/photo/303618951-480px.jpg'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 5.0,
                    end: 3.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('Specialist',
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
