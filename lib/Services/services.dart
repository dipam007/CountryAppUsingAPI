import 'package:dio/dio.dart';
class MyServices{

  Future<List> getCountryFromApi() async{
      var res = await Dio().get('https://restcountries.eu/rest/v2/all');
      return res.data;
  }
}