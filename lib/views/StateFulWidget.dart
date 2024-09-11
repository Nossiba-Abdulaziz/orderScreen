import 'package:flutter/material.dart';

class DemoStateFulWidget extends StatefulWidget{
  const DemoStateFulWidget({super.key});

  @override
  State<StatefulWidget> createState() {
   return DemoState();
  }

}
class DemoState extends State<DemoStateFulWidget>{
  int x=0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(child: Text("$x",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 50),),
     ),
     floatingActionButton: FloatingActionButton(onPressed: (){
       x++;
       setState(() {

       });
     },
     child: Icon(Icons.add),
     ),

   );
  }



}