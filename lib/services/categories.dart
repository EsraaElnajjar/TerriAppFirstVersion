
import '../helper/api.dart';
import '../models/productmodel.dart';

class Categories{
  Future<List<productModel>> getCategoriesProducts({required String categoryName})async {
    List<dynamic> data=await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<productModel> productsList=[];
    for(int i=0;i<data.length;i++){
      productsList.add(
        productModel.fromJson(data[i]),
      );
    }
    return productsList;
}
}