import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp_work/constant/colorapp.dart';

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

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                InkWell(
                  onTap:(){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>CallAudioScreen()));

                  },
                  child: Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Center( child: Text("call audio",style: TextStyle(color: AppColor.white,fontWeight: FontWeight.bold),),),
                  ),
                ),

                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViedeoScreen()));

                  },
                  child: Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(15),

                  ),
                  child: Center( child: Text("call video",style: TextStyle(color: AppColor.white,fontWeight: FontWeight.bold),),),
                  ),
                ),

              ],
            ),
          )
        ],
      ),

    );
  }
}
