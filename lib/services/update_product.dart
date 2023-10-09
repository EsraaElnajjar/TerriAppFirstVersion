
import '../helper/api.dart';
import '../models/productmodel.dart';

class UpdateProduct{
  Future<productModel> updateProduct({required String title,required String price,
    required String description, required String image,
    required int id,
    required String category})async{
    print('product id = $id');
    Map<String,dynamic> data=
    await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category
    });
    return productModel.fromJson(data);
  }
}