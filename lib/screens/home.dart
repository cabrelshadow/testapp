import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'call/Vidoe_call.dart';
import 'call/audio_call.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(
       centerTitle: true,
       title: Text("block screen shot"),
     ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CallAudioScreen()));
                  }, child: Text("audio call")),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViedeoScreen()));
                }, child: Text("video call")),
              ],
            ),
          )
        ],
      ),

    );
  }
}
