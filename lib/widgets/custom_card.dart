
import 'package:flutter/material.dart';

import '../models/productmodel.dart';
import '../screens/update_product_page.dart';
class CustomCard extends StatelessWidget {
   CustomCard({super.key,required this.product});
productModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
      },
      child: Stack(
          clipBehavior: Clip.none,
          children:[
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 40,
                      color: Colors.grey.withOpacity(.2),
                      spreadRadius:0,
                      offset: Offset(10,10),
                    )
                  ]
              ),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title.toString().substring(0,16),style: TextStyle(color: Colors.grey,fontSize: 14),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$''${product.price.toString()}',style: TextStyle(color: Colors.black,fontSize: 16),),
                          IconButton(onPressed: (){

                          }, icon: Icon(Icons.favorite,color: Colors.orange),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(child: Image.network(product.image!,height: 100,width: 100,),right: 32,bottom: 95,),
          ]
      ),
    );
  }
}
