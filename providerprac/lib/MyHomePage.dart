import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerprac/provider/favorite.dart';
import 'package:providerprac/provider/favorite_provider.dart';
import 'package:providerprac/provider/myfav.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 // List<int> selecteditem=[];
  @override
  Widget build(BuildContext context) {
    //  final favoriteprovider =Provider.of<favoriteitemprovider>(context);
    print("object");
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
        actions: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Myfavoriteitemscreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder:(context,index){
                  return Consumer<favoriteitemprovider>(builder: (context,value,child){
                    return ListTile(
                      onTap:() {
                        if(value.selecteditems.contains(index)){
                          value.removeItems(index);

                        }else{
                          value.additems(index);
                        }


                      },
                      title: Text("list"+index.toString()),
                      trailing: Icon(value.selecteditems.contains(index)?Icons.favorite :Icons.favorite_outline),
                    );

                  });

                }),
          )
        ],
      ),
    );
  }
}
