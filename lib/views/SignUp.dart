import 'package:flutter/material.dart';
import 'package:lastupdateinshop/viewmodels/CitiesVM.dart';
import 'package:lastupdateinshop/viewmodels/UserVM.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController=TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController password =TextEditingController();
  CitiesVM cvm=CitiesVM();
  String? selectedCity;

  GlobalKey<FormState> frmkey=GlobalKey();
  String? gender="male";
  bool isTermAccept=false;
  bool isReadRights=true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: frmkey,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)
                , image: DecorationImage(image: AssetImage("assets/images/user.png"))),
              ),
            ),

            SizedBox(height: 50),

            TextFormField(
            validator: (x)=> x!= null && x.isNotEmpty? null : "this Field is required",
keyboardType: TextInputType.name,
           decoration: InputDecoration(
             prefixIcon: Icon(Icons.account_circle),
             hintText: "example : nossibaabdulaziz",
             label: Text("Enter your name"),
             enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
           ),
            ),
SizedBox(height: 20),
            TextFormField(
              validator: (x)=> x!= null && x.isNotEmpty? null : "this Field is required",
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "example : nossiba@gmail.com",
                label: Text("Enter your email"),
                enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
              ),
            ),

            SizedBox(height: 20),
            TextFormField(
              validator: (x)=> x!= null && x.isNotEmpty? null : "this Field is required",
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "example : 566788jjikk",
                label: Text("Enter your password"),
                enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
              ),
            ),




SizedBox(height: 20,),

            Row(children: [

             Radio(value: "male", groupValue: gender, onChanged: (x){

               gender=x;
               setState(() {

               });

             }) ,
              Text("Male"),


              Radio(value: "Female", groupValue: gender, onChanged: (x){

                gender=x;
                setState(() {

                });

              }) ,
              Text("Female"),

            ],),

            SizedBox(height: 16,),

            Row(

              children: [

                Checkbox(value: isTermAccept, onChanged: (x){
                  isTermAccept=x!;
                  setState(() {

                  });
                }),
                Text("Accept Terms and Conditions"),
              ],

            ),


            Row(

              children: [

                Checkbox(value: isReadRights, onChanged: (x){
                  isReadRights=x!;
                  setState(() {

                  });
                }),
                Text("Accept Terms and Conditions"),
              ],

            ),
DropdownButton(
    hint: Text("select your city"),
    value: selectedCity,
    items: cvm.loadCities().map((c)=>DropdownMenuItem(child: Text(c.name),value: (c.value))).toList(), onChanged: (x){
  selectedCity=x;
            setState(() {

            });
      }),

            SizedBox(height: 20,),
          /*  Container(height: 40,width: 120,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue),
           child: Center(child: Text("Sign Up",style: TextStyle(color: Colors.white),)),),*/
          ],

        ))),
      floatingActionButton: FloatingActionButton(onPressed: (){

      if(  frmkey.currentState!.validate()) {

        UserVM uservm=UserVM();
        uservm.register(email: emailController.text, name: username.text, password: password.text);
        emailController.text="";
        username.text="";
        password.text="";
      }
      },
      child: Icon(Icons.save),
      ),
    ));


  }
  checkText(String? x){
    x!= null && x.isNotEmpty? null : "this Field is required";
  }
}
