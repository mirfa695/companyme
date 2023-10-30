import 'dart:convert';
import 'package:companyme/model_class/class%20Files.dart';
import 'package:companyme/model_class/class_login.dart';
import 'package:companyme/utilities/network_failures.dart';
import 'package:http/http.dart' as http;
class ApiServices{
  Future<LoginData> loginApi(String name,String password)async{
    final response=await http.post(Uri.parse('https://www.petroinfotech.com/PetroHSE/api/Admin/ValidateLogin'),
    headers: {'Content-Type': 'application/json; charset=UTF-8',},
      body: jsonEncode({
        'userName':name,
        'password':password,
        "authType": "FORMS",
        "ipAddress": ""
      })
    );
    if(response.statusCode==200){
      var decodeData=jsonDecode(response.body);
      LoginData data=LoginData.fromJson(decodeData);
      return data;
    }else{
      throw 'error';
      NetworkFailures.errorHandling(response.statusCode);}
  }
  Future <List<Files>>getData(String id)async{
    final response=await http.get(Uri.parse('https://www.petroinfotech.com/PetroHSE/api/Dashboard/GetHomePage?companyCode=1&userId=$id'));
    if(response.statusCode==200){
      final Map<String, dynamic> decodeData=json.decode(response.body);
      var datas=decodeData["dtAbstract"].map<Files>((data){
        return Files.fromJson(data);
      }).toList();
      return datas;
    }
    else{throw 'Error';}
  }
}