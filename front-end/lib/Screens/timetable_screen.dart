import 'package:flutter/material.dart';

class TimeTableScreen extends StatefulWidget {
  // String? username, name;
  //
  // HomePage2Screen({this.username, this.name});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
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
              Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 16.0, left: 16.0),
                  child: Center(
                    child: Row(
                      children: [
                        InkWell(
                          child: const Icon(Icons.arrow_back),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Image.asset(
                          'images/attendance.jpg',
                          scale: 5,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'John Doe Attendance',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ///BODY PART
              Center(
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 16.0, right: 16.0),
                    child: Column(
                      children: [
                        DataTable(columns: [
                          DataColumn(
                            label: Text('ID',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.red),),
                          ),
                          DataColumn(
                            label: Text('NAME',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.red),),
                          ),
                          DataColumn(
                            label: Text('AGE',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.red),),
                          ),
                        ], rows: [
                          DataRow(
                            cells: [
                              DataCell(
                                Text('0001'),
                              ),
                              DataCell(
                                Text('Ofori'),
                              ),
                              DataCell(
                                Text('16'),
                              ),
                            ],
                          ),


                        ])
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
