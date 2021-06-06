import 'package:country_app_api/model/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDetails extends StatelessWidget {
  final Country country;

  const CountryDetails({Key key, this.country}) : super(key: key);

  SingleChildScrollView _detail(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width*0.8,
              alignment: Alignment.center,
              child: Text("Country: ${country.name}", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold, letterSpacing: 2.0),),
              decoration: BoxDecoration(
                  color: Colors.blueGrey[400],
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width*0.9,
              alignment: Alignment.center,
              child: Text("Capital: ${country.capital}", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold, letterSpacing: 2.0),),
              decoration: BoxDecoration(
                  color: Colors.blueGrey[400],
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width*0.9,
              alignment: Alignment.center,
              child: Text("Region: ${country.region}", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold, letterSpacing: 2.0),),
              decoration: BoxDecoration(
                  color: Colors.blueGrey[400],
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width*0.9,
              alignment: Alignment.center,
              child: Text("SubRegion: ${country.subregion}", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold, letterSpacing: 2.0),),
              decoration: BoxDecoration(
                  color: Colors.blueGrey[400],
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width*0.9,
              alignment: Alignment.center,
              child: Text("Population: ${country.population}", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold, letterSpacing: 2.0),),
              decoration: BoxDecoration(
                  color: Colors.blueGrey[400],
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width*0.9,
              alignment: Alignment.center,
              child: Text("Code2: ${country.alpha2Code}", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold, letterSpacing: 2.0),),
              decoration: BoxDecoration(
                  color: Colors.blueGrey[400],
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width*0.9,
              alignment: Alignment.center,
              child: Text("Code3: ${country.alpha3Code}", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold, letterSpacing: 2.0),),
              decoration: BoxDecoration(
                  color: Colors.blueGrey[400],
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              child: SvgPicture.network(
                country.flag,
                placeholderBuilder: (context) => Icon(Icons.flag),
                fit: BoxFit.cover,
                height: 140,
                width: 240,
              ),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))
            ),
          ),
          SizedBox(height: 15,),
          Expanded(child: _detail(context))
        ],
      ),
    );
  }
}
