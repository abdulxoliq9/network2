
import 'dart:convert';

import 'package:http/http.dart';
import 'package:network2/Post.dart';

class Network{

  static String BASE = 'dummy.restapiexample.com';
  static Map<String,String> headers = Map();

  /* http api */
  static String API_LIST= '/api/v1/employees	';
  static String API_GET= '/api/v1/employee/1';
  static String API_CREATE= '/api/v1/create';
  static String API_UPDATE= '/api/v1/update/';
  static String API_DELETE= '/api/v1/delete/';

  /* http request */

  static Future<String> GET(String api, Map<String,String> params)async{
    var uri = Uri.https(BASE,api,params);
    var response = await get(uri,headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }return '';
  }

  static Future<String> GET2(String api, Map<String,String> params)async{
    var uri = Uri.https(BASE,api,params);
    var response = await get(uri,headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }return '';
  }

  static Future<String> POST(String api, Map<String,String> params)async{
    var uri = Uri.https(BASE,api);
    var response = await post(uri,headers: headers,body:jsonEncode(params));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }return '';
  }

  static Future<String> PUT(String api, Map<String,String> params)async{
    var uri = Uri.https(BASE,api);
    var response = await put(uri,headers: headers,body:jsonEncode(params));
    if(response.statusCode == 200){
      return response.body;
    }return '';
  }

  static Future<String> DEL(String api, Map<String,String> params)async{
    var uri = Uri.https(BASE,api,params);
    var response = await delete(uri,headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }return '';
  }

  /* params */

  static Map<String,String> paramsEmpty(){
    Map<String,String> params = Map();
    return params;}

  static Map<String,String> paramsCreate(Post post){
    Map<String,String> params = Map();
    params.addAll({
      'title':post.name!,
      'body':post.salary!,
      'userId':post.age.toString()
    });
    return params;}

  static Map<String,String> paramsUpdate(Post post){
    Map<String,String> params = Map();
    params.addAll({
      'id2':post.id.toString(),
      'title':post.name!,
      'body':post.salary!,
      'userId':post.age.toString()
    });
    return params;
  }
}