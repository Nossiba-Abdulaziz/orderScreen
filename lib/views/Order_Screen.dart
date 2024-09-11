//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import '../viewmodels/CitiesVM.dart';
import '../viewmodels/UserVM.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  GlobalKey<FormState> frmkey=GlobalKey();
  TextEditingController emailController=TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController password =TextEditingController();
  String? payment="uponReceipt";
  bool isTermAccept=false;
  bool isReadRights=true;
  CitiesVM cvm=CitiesVM();
  String? selectedCity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20,right: 20,left: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
            child: Form(
                key: frmkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

        SizedBox(height: 10,),
                    TextFormField(

                      validator: (x)=> checkName(x),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle,color: Colors.blue,),

                        //hintText: "example : nossiba abdulaziz Bezar",
                        label: Text("Enter your name"),
                        enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (x)=> checkPhoneNumber(x),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android,color: Colors.blue,),
                       // hintText: "example : 777345698",
                        label: Text("Enter your phone"),
                        enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                      ),
                    ),



                    SizedBox(height: 20),
                    Text("select Delivery Time"),
                    SizedBox(height: 10),
                    DropdownButton(
                        //hint: Text("select Delivery Time"),
                        value: selectedCity,
                        items: cvm.loadCities().map((c)=>DropdownMenuItem(child: Text(c.name),value: (c.value))).toList(), onChanged: (x){
                      selectedCity=x;
                      setState(() {

                      });
                    }),


                    SizedBox(height: 16,),



                    /*  Container(height: 40,width: 120,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue),
             child: Center(child: Text("Sign Up",style: TextStyle(color: Colors.white),)),),*/

                    Text("Delivery Way :"),

                    Row(children: [

                      Radio(value: "uponReceipt", groupValue: payment, onChanged: (x){

                        payment=x;
                        setState(() {

                        });

                      }) ,
                      Text("Upon Receipt"),
        ],),

                    SizedBox(height: 10,),
                    Row(children: [

                      Radio(value: "Alomqi", groupValue: payment, onChanged: (x){

                        payment=x;
                        setState(() {

                        });

                      }) ,
                      Text("Alomqi"),
                    ],),


                    SizedBox(height: 10),
                    Row(children: [

                      Radio(value: "Alkurumi", groupValue: payment, onChanged: (x){

                        payment=x;
                        setState(() {

                        });

                      }) ,
                      Text("Alkurumi"),
                    ],),
        SizedBox(height: 10,),
                    TextFormField(
                     maxLines: 3,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(

                       // hintText: "Example : the time of delivery don't extend 12 PM",
                        prefixIcon: Icon(Icons.note),
                        label: Text("Important Note :"),
                        enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                      ),
                    ),
        SizedBox(height: 20,),
                    /*Container(height: 40,width: 120,
                      margin: EdgeInsets.only(left: 100),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue),
                      child: Center(child: Text("Order Now",style: TextStyle(color: Colors.white),)),),*/

                      ]

                     ),








                )






            ),
      ),


        floatingActionButton: FloatingActionButton(onPressed: (){

    if(  frmkey.currentState!.validate()) {

    UserVM uservm=UserVM();
    uservm.register(email: emailController.text, name: username.text, password: password.text);
    emailController.text="";
    username.text="";
    password.text="";
    }
    },

          child: Center(child: Icon(Icons.save))
    ),


    ),


    );


  }
  checkName(String? name){

    if(name==null||name.isEmpty){
      return "Enter your name";
    }
    List<String> correctName=name.split(' ');
    if(correctName.length <= 2){
      return "the name must be tripartite";
    }
    return null;

  }
String? checkPhoneNumber(String? phoneNumber){

    if(phoneNumber==null ||phoneNumber.isEmpty){
      return "don't let it empty";
    }
    try{
      double num=double.parse(phoneNumber);
      return "${num}";
    }catch(e){
      return "Enter valid value";
    }
    if(phoneNumber.length != 9){
      return "must be 9 numbers";
    }

    if(phoneNumber[0]!=7&& !['7','3','1'].contains(phoneNumber[1])){
      return" first number must be 7 and second 1 or 3 or 7";
    }


    for(int i=2;i<phoneNumber.length;i++){
      if(!RegExp(r'^[0-9]$').hasMatch((phoneNumber[i]))){
        return "the value must be numeric";
      }
    }

    return null;
}

  }

