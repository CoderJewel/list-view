import 'package:flutter/material.dart';
import 'package:listview/datum/dummydatas.dart';

void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HState createState() => HState();
}

class HState extends State<HomePage>{
  var mdata = productList;
  var nonfilterdata;

  searchProduct(text){
    var valueexist = text.length > 0? true:false;
    if(valueexist){
      var filterdata =[];
      for(var i = 0; i<mdata.length;i++){
        if(mdata[i]['name'].contains[text]){
          filterdata.add(mdata);
        }
      }
      setState(() {
        this.mdata = filterdata;
      });
    }else{
      setState(() {
        this.mdata ;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 70,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search Name',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  //obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  //maxLength: 10,
                  textInputAction: TextInputAction.go,
                  onChanged: (text){
                    setState(() {
                      searchProduct(text);
                      print(text);
                    });
                  },
                ),
              ),
            Container(
              height: 600,
              child: ListView.builder(
                itemCount: mdata.length,
                itemBuilder: (ctx,ind){
                  return Card(
                    elevation: 2,
                  color: Colors.teal,
                  shadowColor: Colors.teal,
                  child: ListTile(
                  leading: CircleAvatar(
                  child: Text(mdata[ind]['name'][0]),
                  ),
                  title: Text(mdata[ind]['name']),
                  subtitle: Text(mdata[ind]['number'].toString()),
                    onTap: (){},
                  ),
                  );

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}