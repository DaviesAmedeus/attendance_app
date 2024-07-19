import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiServices{

  final String url = 'http://10.0.2.2:8000';

 Future<List> fetchAttendance({api, context}) async {
   var fullUrl = url + api;
   final response =  await http.get(Uri.parse(fullUrl), headers: _setHeaders());

   if (response.statusCode == 200) {
     List jsonResponse = jsonDecode(response.body).toList();
     print('>>>>>DATA: ${jsonResponse}<<<<<<');
     return jsonResponse;
   } else {
     throw Exception('Failed to load data');
   }


 }

  Future<List> fetchMarks({api, context}) async {
    var fullUrl = url + api;
    final response =  await http.get(Uri.parse(fullUrl), headers: _setHeaders());

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body).toList();
      print('>>>>>DATA: ${jsonResponse}<<<<<<');
      return jsonResponse;
    } else {
      throw Exception('Failed to load data');
    }


  }



  ///function used to fetch user data
  usernameLoginRequest({api, context}) async{
    var fullUrl = url + api;

    print('FULL URL: $fullUrl');


    try{
      var response =  await http.get(Uri.parse(fullUrl), headers: _setHeaders());
      return response;
    }catch(error){
      print('>>>>>>>Error occurred while fetching DATA in: $error <<<<<<<<<<');
      return null;
    }



  }

  ///function used to login
  loginRequest({api, data, context}) async{
    var fullUrl = url + api;
    String body = jsonEncode(data);

    print('FULL URL: $fullUrl');

    try{
      var response = await http.post(Uri.parse(fullUrl),
        headers: _setHeaders(),
        body: body
      );


      return response;



    }catch(e){
      print('SOMETHING WENT WRONG!>>> $e');
    }



  }


  ///function used to get Program modules
  programModulesGetRequest(apiUrl, {context}) async{
    var fullUrl = url + apiUrl;

        try{
          var resp =  await http.get(Uri.parse(fullUrl), headers: _setHeaders());
          return evaluatedResponse(resp, context);
        }catch(error){
          print('>>>>>>>Error occurred while fetching DATA in: $error <<<<<<<<<<');
          return null;
        }




  }




  /// function with RESPONSE of the request
  evaluatedResponse(http.Response response, context) {

    if(response.statusCode == 200){

      print('--------------------YOUR REQUEST IS OKAY------------------------\n \n \n');
      print('${response.statusCode} CODE OK');
      print('\n \n \n-----------------------------------------------------------------');


      print('--------------------FETCHED DATA FROM------------------------\n \n \n');
      print('${response.body} \n \n \n  END OF DATA BODY');
      print('\n \n \n-----------------------------------------------------------------');



      return response;
    }

  }



  _setHeaders()=> {
    'Content-Type': 'application/json',
    'Vary': 'Accept'

  };
}

