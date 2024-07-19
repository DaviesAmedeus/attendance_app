import 'package:flutter/material.dart';
import 'package:sa_app/api/api_services.dart';

ApiServices apiServices = ApiServices();

class MarksPage extends StatefulWidget {
  String? username;
  MarksPage({this.username});

  @override
  State<MarksPage> createState() => _MarksPageState();
}

class _MarksPageState extends State<MarksPage> {
  bool isLoading = true;
  List attendanceData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List data = await apiServices.fetchMarks(
        api: '/api/api/student/${widget.username}/marks/');
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
      appBar: AppBar(title: Text('Marks')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Marks')),
              DataColumn(label: Text('Studentcourse')),
            ],
            rows: attendanceData
                .map(
                  (data) => DataRow(cells: [
                DataCell(Text(data['name'])),
                DataCell(Text(data['marks1'].toString())),
                DataCell(Text(data['studentcourse'].toString())),
              ]),
            )
                .toList(),
          ),
        ),
      ),
    );
  }
}


