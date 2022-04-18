import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dppr/JsonDataModel.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'dart:convert';

void main(){
  runApp(DPPR_App());
}

class DPPR_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DPPR App',
      theme: ThemeData(
        backgroundColor: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data){
            if(data.hasError){
              return Center(child: Text("${data.error}"));
            }else if(data.hasData) {
              var items =data.data as List<JsonDataModel>;
              return ListView.builder(
                  itemBuilder: (context, index) {
                    var imageURL;
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(child: Container(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].ProdDate.toString(), style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),),),
                                    Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].Line.toString(),)),
                                    Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].Shift.toString(),)),
                                    Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].ShiftTime.toString(),)),
                                    Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].ActOpr.toString(),)),
                                    Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].DtWoPDT.toString(),)),
                                    Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].AllocatedDt.toString(),)),
                                    Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].Downtime.toString(),))

                                  ],
                                ),
                              ))
                            ],
                          )
                      ),

                    );
                  }
              );

            }else{
              return Center (child: CircularProgressIndicator(),);
            }
          },
        )
    );//Scaffold
  }


  Future<List<JsonDataModel>>ReadJsonData() async{

    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/working.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => JsonDataModel.fromJson(e)).toList();

  }
}





