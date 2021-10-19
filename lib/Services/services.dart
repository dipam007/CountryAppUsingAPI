import 'package:dio/dio.dart';
class MyServices{

  Future<List> getCountryFromApi() async{
      var res = await Dio().get('http://api.countrylayer.com/v2/all?access_key=6336548059f3d32caeb758f13162f8c2'); //https://restcountries.eu/rest/v2/all
      return res.data;
  }
}
