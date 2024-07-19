import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sa_app/api/api_services.dart';

import '../components/snackbar.dart';
import '../constants/constants.dart';
import '../models/subjects_model.dart';
import 'package:sa_app/models/modules_model.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

List<Module>? student_subjects;

@override
void initState() {
  fetchStudentSubjects();
  //listenNotifications();
  super.initState();
}


fetchStudentSubjects() async {
  var res = await ApiServices().programModulesGetRequest(
      'api/student-courses/', context: context);
  if (res != null) {
    var body = json.decode(res.body);
    print('-------PRINTING BODY OF FETCHING GROUP DATA--------');
    print(body);
    print('---------------------------------------------------');

    var theModules = body;
    List<Module> _module_items = [];

    for (var field in theModules) {
      Module module = Module(
          field['id'].toString(),
          field['student'].toString(),
          field['course'].toString()
      );

      _module_items.add(module);
    }

    print('---------------MY CREATED GROUP ITEMS--------------------');
    print(_module_items.length);
    print('------------------------------------------------');

    setState(() {
      student_subjects = _module_items;
    });
  } else {
    showSnack('No network', context);
    return [];
  }
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 15, right: 15),
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  child: Icon(Icons.assignment),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      "Student",
                      style: GoogleFonts.notoSerif(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor),
                    ),
                    Text(
                      "Attandance",
                      style: GoogleFonts.notoSerif(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Your Modules",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kBlackColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            modulesComponent()
          ],
        ),
      ),
    ));
  }

  modulesComponent(){
  if (student_subjects == null){
    return const Center(
      child: Text('No network or connection'),
    );
  }else if(student_subjects !=null && student_subjects?.length == 0){
    return const Center(
      child: Text('No Subjects yet!'),
    );
  }else{
   return ListView.builder(
       physics: const BouncingScrollPhysics(),
       shrinkWrap: true,
       itemCount: student_subjects!.length,
       itemBuilder: (context, index) {
         int reverseIndex = student_subjects!.length -1 - index;
         return InkWell(
           onTap: () {
             _pop_up_Dialog(context);
           },
           child: Card(
             color: Colors.blue[50],
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(
                   10.0), // Adjust the radius as needed
             ),
             child: Container(
               width: double.infinity,
               padding: const EdgeInsets.all(12),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(26)),
               child: Row(children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         CircleAvatar(
                           radius: 15,
                           child: Icon(
                             Icons.library_books,
                             size: 19,
                           ),
                         ),
                         SizedBox(
                           width: 10,
                         ),
                         Column(
                           crossAxisAlignment:
                           CrossAxisAlignment.start,
                           children: [
                             Text(
                               student_subjects![index].course!,
                               style: const TextStyle(
                                 color: kBlackColor,
                                 fontSize: 19.0,
                                 fontWeight: FontWeight.bold,
                               ),
                               maxLines: 1,
                               overflow: TextOverflow.ellipsis,
                             ),
                             // Text(
                             //   student_subjects![index].course!,
                             //   style: const TextStyle(
                             //     color: Colors.black45,
                             //     fontSize: 12.0,
                             //   ),
                             // ),
                           ],
                         ),
                       ],
                     ),
                   ],
                 ),
               ]),
             ),
           ),
         );
       });
  }
  }

  ///Our Pop Dialog
  _pop_up_Dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            content: Form(
              child: Column(
                children: [
                  const SizedBox(
                    height: 2,
                  ),

                  // OurMaterialButton(
                  //     label: 'Join',
                  //     onPressed: () {
                  //       _joinGroup_API();
                  //       fetchJoinGroupData();
                  //       setState(() {
                  //         _scrollController.animateTo(
                  //           0.0,
                  //           duration: const Duration(milliseconds: 300),
                  //           curve: Curves.easeInOut,
                  //         );
                  //       });
                  //       Navigator.pop(context);
                  //     }),
                  MaterialButton(
                    elevation: 5,
                    color: Colors.teal,
                    height: 50,
                    minWidth: 500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      showSnack(context, 'You have signed in this class');
                    },
                    child: const Text(
                      'Sign Attendance',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    elevation: 5,
                    color: Colors.teal,
                    height: 50,
                    minWidth: 500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () {

                    },
                    child: const Text(
                      'Class History',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  _feed_back_Dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            content: Form(
              child: Column(
                children: [
                  const SizedBox(
                    height: 2,
                  ),

                  // OurMaterialButton(
                  //     label: 'Join',
                  //     onPressed: () {
                  //       _joinGroup_API();
                  //       fetchJoinGroupData();
                  //       setState(() {
                  //         _scrollController.animateTo(
                  //           0.0,
                  //           duration: const Duration(milliseconds: 300),
                  //           curve: Curves.easeInOut,
                  //         );
                  //       });
                  //       Navigator.pop(context);
                  //     }),
                  MaterialButton(
                    elevation: 5,
                    color: Colors.teal,
                    height: 50,
                    minWidth: 500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () {

                      setState(() {
                        Navigator.pop(context);
                      });
                      showSnack(context, 'You Signed in for this lesson!');


                    },
                    child: const Text(
                      'Sign Attendance',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    elevation: 5,
                    color: Colors.teal,
                    height: 50,
                    minWidth: 500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () {},
                    child: const Text(
                      'Class History',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
