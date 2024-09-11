import 'package:flutter/material.dart';
import 'package:lastupdateinshop/models/product.dart';
import 'package:lastupdateinshop/viewmodels/products_vm.dart';
import 'package:lastupdateinshop/views/details_screen.dart';

class HomeScreen extends StatefulWidget {

  late Product p;
   HomeScreen({Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  ProductsVM pVM=ProductsVM();
  late List<Product> allProducts;
IconData fav=Icons.favorite;

void initState(){

  allProducts=pVM.loadAllProducts();

  super.initState();
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            child: Badge(child: Icon(Icons.shopping_cart),label: Text("${ProductsVM.cartItems.length}")),
            margin: EdgeInsets.only(top: 10,right: 10),),

        ],
        title: Text("Home Screen"),
      ),
      body:ListView.builder(
          itemCount: allProducts.length,
          itemBuilder: (ctx,index){
            return
              InkWell(
                onTap: (){

                  Navigator.pushNamed(context, "/details",arguments: allProducts[index]);
                 // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DetailsScreen(),settings: RouteSettings(arguments: allProducts[index])));
                },
                child: Card(

                child: Column(children: [
                Stack(
                  clipBehavior: Clip.none,
              children: [

                Image.network(allProducts[index].image),

              /*  Positioned(
                  top: 20, left: 10,
                  child: InkWell(
                    onTap: (){
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.red,
                        child:  Icon(Icons.favorite_outline_rounded,size: 40,) ,
                      );


                    },
                     // child: Icon(Icons.favorite_outline_rounded,size: 40,)


                  ),
                  ),*/

                Positioned(
                  child: IconButton(onPressed: (){

                    allProducts[index].isFav=!allProducts[index].isFav?true : false;
                    setState(() {

                    });
                  },
                      icon: Icon(allProducts[index].isFav?Icons.favorite:Icons.favorite_border,color: Colors.red)),

                ),








                Positioned(
                  left: 260,
                  top: 10,
                  child: Container(
                    child: Center(child: Text("10%",style: TextStyle(color: Colors.white),)),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.red,),
                    height: 50,
                    width: 50,


                  ),
                ),


                ]




                   ),
                             // Image.network("https://storage.googleapis.com/pod_public/1300/168838.jpg"),
                ListTile(

                  subtitle: Text(allProducts[index].brand),
                  title: Text(allProducts[index].name),trailing: Text("${allProducts[index].price}"),)
                            ],),),
              );
          })

    );
  }
}
