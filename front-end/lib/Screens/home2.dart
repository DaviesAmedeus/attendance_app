import 'package:flutter/material.dart';
import 'package:sa_app/Screens/marks_screen.dart';
import 'package:sa_app/Screens/timetable_screen.dart';

import 'attendance_screen.dart';


class HomePage2Screen extends StatefulWidget {
  String? username, name;

  HomePage2Screen({this.username, this.name});

  @override
  State<HomePage2Screen> createState() => _HomePage2ScreenState();
}

class _HomePage2ScreenState extends State<HomePage2Screen> {


  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(

              child: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(child: Icon(Icons.person, size: 50.0,),
                        radius: 35,),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('name: ${widget.name}'),
                           Text('Username: ${widget.username}'),

                        ],)
                      ],

                    ),
                  ),
                  Center(
                    child:Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        ///Attendance, Marks and Timetable cards
                          InkWell(
                            child: Card(
                              color: Colors.grey[200],
                              margin: EdgeInsets.all(8.0),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Center(
                                  child: Row(
                                    children: [
                                       Image.asset('images/attendance.jpg',
                                       scale: 4,),
                                      SizedBox(height: 7,),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Attendance',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            Text(
                                              'View the attendance status for each of your courses.'

                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AttendancePage(username: widget.username,)));
                            },
                          ),
                          InkWell(
                            child: Card(
                              color: Colors.grey[200],
                              margin: EdgeInsets.all(8.0),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Image.asset('images/marks.jpg',
                                        scale: 9.5,),
                                      SizedBox(width: 8,),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Marks',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            Text(
                                                'View the marks obtained for each of your courses. '

                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MarksPage(username: widget.username,)));

                            },
                          ),
                          InkWell(
                            child: Card(
                              color: Colors.grey[200],
                              margin: EdgeInsets.all(8.0),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Image.asset('images/timetable.png',
                                        scale: 4,),
                                      SizedBox(width: 7,),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'TimeTable',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            Text(
                                                'View the timetable in a tabular form. '

                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){},
                          ),


                        ],
                      ),
                    ),

                  ),
                ],
              ),


            ),
          ),
        ));
  }
}


