/*
import 'dart:ffi';

import 'package:course1/modules/archived_tasks/new_archived_tasks.dart';
import 'package:course1/modules/done_tasks/don_tasks_screen.dart';
import 'package:course1/modules/homescreen_components/community.dart';
import 'package:course1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget {

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}
class _HomeLayoutState extends State<HomeLayout> {
 int curentindex = 0;

 List<Widget> screens =
     [
       newTaskScreen(),
       newDoneScreen(),
       newArchivedScreen(),

     ];

 List<String> titles =
 [
  'new tasks',
  'done tasks',
  'archived tasks',
];

 Database? database;
 var scaffoldKey = GlobalKey<ScaffoldState>();
 bool isBottomSheetShown = false;
 IconData fabIcon =  Icons.edit;
void initState() {
  super.initState();
  createDatabase();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar (
          title: Text (
            titles[curentindex],
          ),
      ),

      body: screens[curentindex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheetShown) {
            Navigator.pop(context);
            isBottomSheetShown = false;
            setState(() {
              fabIcon = Icons.edit;
            });
          } else {
            scaffoldKey.currentState?.showBottomSheet((context) =>

                Column(
                  children: [
                    defaultformfiled
                      (
                        controller: controller,
                        type: type,
                        validate: validate,
                        label: label,
                        prefix: prefix
                    )
                  ],
                ),
            );
            isBottomSheetShown = true;
            setState(() {
              fabIcon = Icons.add;
            });
          };

        },

       child: Icon(
         fabIcon
       ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: curentindex,
        onTap: (index) {
         setState(() {
           curentindex = index;
         });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline,
            ),
            label: 'done',
          ),
           BottomNavigationBarItem(
             icon: Icon(
             Icons.archive_outlined,
            ),
            label: 'archive',
           ),
        ],
      ),
    );
  }
  Future <String> getname()
   async
  {
    return 'ahmed';
}



void createDatabase() async
{
  database = await openDatabase(

    'todo.db',
        version: 1,
        onCreate: (dataBase ,version) {
         print('dataBase created');
         dataBase.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT,status TEXT )').then((value)
         {
           print('table created');
         }
         ).catchError((error){
           print('error table created ${error.toString()}');
         });
         },
        onOpen: (dataBase) {

        print('database opend');
        },
  );
}
 void insertToDatabase()
{
database?.transaction((txn)
async {
txn.rawInsert('INSERT INTO tasks(title, date , time ,status) VALUES("first task","02","12","new") '
)
    .then((value) {
print('$value instert succed');
}).catchError((error) {
  print('error instert${error.toString()}');

});

});
}
}
*/