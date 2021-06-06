import 'package:country_app_api/Screens/Country_Details.dart';
import 'package:country_app_api/Services/services.dart';
import 'package:country_app_api/model/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List> countryData;

  List searchCountryList = [];
  List sortCountryList = [];
  List mainList = [];
  final _searchController = TextEditingController();

  Color btn1Clr = Colors.blue;
  Color btn2Clr = Colors.grey[400];
  String mySearchType = 'name';

  @override
  void initState(){
    countryData = MyServices().getCountryFromApi();
    countryData.then((data){
      setState(() {
        mainList = data;
      });
    });
    super.initState();
  }

  searchData(String str) {
    var strExist = str.length!=0 ? true : false;

    if (strExist) {
      List filterData = [];

      for (var i = 0; i < mainList.length; i++) {
        String text = mainList[i][mySearchType].toString().toLowerCase();
        if (text.contains(str.toLowerCase())) {
          filterData.add(mainList[i]);
        }
      }
      setState(() {
        searchCountryList = filterData;
      });
    } else {
      setState(() {
        searchCountryList = [];
      });
    }
  }

  Widget _searchCountryWidget(BuildContext context, int index){
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        onTap: (){
          Country myCountry = Country(
            flag: searchCountryList[index]['flag'].toString(),
            name: searchCountryList[index]['name'].toString(),
            capital: searchCountryList[index]['capital'].toString(),
            region: searchCountryList[index]['region'].toString(),
            subregion: searchCountryList[index]['subregion'].toString(),
            population: searchCountryList[index]['population'].toString(),
            alpha2Code: searchCountryList[index]['alpha2Code'].toString(),
            alpha3Code: searchCountryList[index]['alpha3Code'].toString(),
            // borders: ,
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) => CountryDetails(country: myCountry,)));
        },
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.blueGrey[200],
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: [
                  Container(
                      width: 60,
                      child: SvgPicture.network(
                        searchCountryList[index]['flag'],
                        placeholderBuilder: (context) => Icon(Icons.flag),
                        fit: BoxFit.cover,
                        height: 40.0,
                        width: 60.0,
                      )
                  ),
                  SizedBox(width: 12,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 200,
                          child: Text("${searchCountryList[index]['name']}",overflow: TextOverflow.ellipsis,)
                      ),
                      Text("Capital: ${searchCountryList[index]['capital']}"),
                    ],
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
  Widget _mainCountryWidget(BuildContext context, int index){
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        onTap: (){
          Country myCountry = Country(
            flag: mainList[index]['flag'].toString(),
            name: mainList[index]['name'].toString(),
            capital: mainList[index]['capital'].toString(),
            region: mainList[index]['region'].toString(),
            subregion: mainList[index]['subregion'].toString(),
            population: mainList[index]['population'].toString(),
            alpha2Code: mainList[index]['alpha2Code'].toString(),
            alpha3Code: mainList[index]['alpha3Code'].toString(),
            // borders: ,
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) => CountryDetails(country: myCountry,)));
        },
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.blueGrey[200],
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: [
                  Container(
                      width: 60,
                      child: SvgPicture.network(
                        mainList[index]['flag'],
                        placeholderBuilder: (context) => Icon(Icons.flag),
                        fit: BoxFit.cover,
                        height: 40.0,
                        width: 60.0,
                      )
                  ),
                  SizedBox(width: 12,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 200,
                          child: Text("${mainList[index]['name']}",overflow: TextOverflow.ellipsis,)
                      ),
                      Text("Capital: ${mainList[index]['capital']}"),
                    ],
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country App", style: TextStyle(letterSpacing: 2.0, fontWeight: FontWeight.w600, fontSize: 22, wordSpacing: 4.0),),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: TextFormField(
                controller: _searchController,
                decoration:InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: _searchController.text.length==0 ?
                          IconButton(
                              icon: Icon(Icons.send),
                              onPressed: (){},
                          )
                        : IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: (){
                              setState(() {
                                _searchController.text = '';
                                searchData( _searchController.text);
                              });
                            },
                          )
                ),
                onChanged: (val){
                  setState(() {
                    searchData(val);
                  });
                },
              ),
            ),
            SizedBox(height: 12,),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      child: Text("SEARCH BY:", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),)
                  ),
                  SizedBox(height: 8,),
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            if(btn1Clr == Colors.grey[400]){
                              mySearchType = 'name';
                              btn1Clr = Colors.blue;
                              btn2Clr = Colors.grey[400];
                              searchData( _searchController.text);
                            }
                            else{
                              mySearchType = 'name';
                              // btn1Clr = Colors.grey[400];
                              _searchController.text = '';
                              searchData( _searchController.text);
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 10),
                          child: Text("By Country Name", style: TextStyle(color: Colors.white),),
                          decoration: BoxDecoration(
                              color: btn1Clr,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            if(btn2Clr == Colors.grey[400]){
                              mySearchType = 'capital';
                              btn2Clr = Colors.blue;
                              btn1Clr = Colors.grey[400];
                              searchData( _searchController.text);
                            }
                            else{
                              mySearchType = 'name';
                              btn2Clr = Colors.grey[400];
                              btn1Clr = Colors.blue;
                              _searchController.text = '';
                              searchData( _searchController.text);
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("By Country Capital", style: TextStyle(color: Colors.white),),
                          decoration: BoxDecoration(
                              color: btn2Clr,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            mainList.length!=0 ?Expanded(
              child: (searchCountryList.length != 0 || _searchController.text.length>0)
                  ? ListView.builder(
                  itemCount: searchCountryList.length,
                  itemBuilder: (context, index){
                    return _searchCountryWidget(context, index);
                  }
              )
              : ListView.builder(
                  itemCount: mainList.length,
                  itemBuilder: (context, index){
                    return _mainCountryWidget(context, index);
                  }
              )
            ) : Center(child: CircularProgressIndicator(),)
          ],
        ),
      )
    );
  }
}

