import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorite_provider.dart';
class Myfavoriteitemscreen extends StatefulWidget {
  const Myfavoriteitemscreen({super.key});

  @override
  State<Myfavoriteitemscreen> createState() => _MyfavoriteitemscreenState();
}

class _MyfavoriteitemscreenState extends State<Myfavoriteitemscreen> {
  @override
  Widget build(BuildContext context) {
      final favoriteprovider =Provider.of<favoriteitemprovider>(context);
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
                itemCount: favoriteprovider.selecteditems.length,
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

