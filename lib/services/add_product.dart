
import '../helper/api.dart';
import '../models/productmodel.dart';

class AddProduct{
  Future<productModel> addProduct({required String title,required String price,required String description, required String image, required String category})async{
    Map<String,dynamic> data= await Api().post(url: 'https://fakestoreapi.com/products', body: {
    'title': title,
    'price': price,
    'description': description,
    'image': image,
    'category': category
    });
    return productModel.fromJson(data);
  }
}