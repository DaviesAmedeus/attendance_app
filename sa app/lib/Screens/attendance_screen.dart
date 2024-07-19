import 'package:flutter/material.dart';
import 'package:sa_app/api/api_services.dart';

ApiServices apiServices = ApiServices();

class AttendancePage extends StatefulWidget {
  String? username;
  AttendancePage({this.username});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  bool isLoading = true;
  List attendanceData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List data = await apiServices.fetchAttendance(
        api: '/api/api/student/${widget.username}/attendance/');
    if(data !=null){
      setState(() {
        attendanceData = data;
        isLoading =false;
      });
    } else{
      isLoading =true;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Table')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Course')),
            DataColumn(label: Text('Student')),
          ],
          rows: attendanceData
              .map(
                (data) => DataRow(cells: [
              DataCell(Text(data['id'].toString())),
              DataCell(Text(data['course'])),
              DataCell(Text(data['student'])),
            ]),
          )
              .toList(),
        ),
      ),
    );
  }
}


