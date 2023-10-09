import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:terristore/widgets/Custom_Edit_Text2.dart';

import '../models/productmodel.dart';
import '../services/update_product.dart';
import '../widgets/CustomEditText.dart';
import '../widgets/custom_button.dart';
class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id='updateproduct';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName,desc,image;

  String? price;
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    productModel? product = ModalRoute.of(context)!.settings.arguments as productModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Update Product',style: TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  CustomTextField2(onchanged: (data){
                    productName=data;
                  },
                      inputType: TextInputType.text
                      ,text: 'Product Name', controller:TextEditingController()),
                  SizedBox(height: 10,),
                  CustomTextField2(inputType: TextInputType.text,onchanged: (data){
                    desc=data;
                  },text: 'Description', controller:TextEditingController()),
                  SizedBox(height: 10,),
                  CustomTextField2(inputType: TextInputType.number,onchanged: (data){
                    price=data;
                  },text: 'Price', controller:TextEditingController()),
                  SizedBox(height: 10,),
                  CustomTextField2(inputType: TextInputType.text,onchanged: (data){
                    image=data;
                  },text: 'Image', controller:TextEditingController()),
                  SizedBox(height: 50,),
                  CustomButton(
                      onpressed: () async{
                        isLoading = true;
                        setState(() {});
                        try {
                          await  updateProduct(product);
                          print('success');
                        } catch (e) {
                          print('not success');
                        }
                        isLoading = false;
                        setState(() {});
                      }
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
  Future<void> updateProduct(productModel product)async {
    await UpdateProduct().updateProduct(
        id: product.id,
        title: productName!,
        price: price!,
        description: desc!,
        image: image!,
        category:product.category
    );
    isLoading=false;
  }
}
