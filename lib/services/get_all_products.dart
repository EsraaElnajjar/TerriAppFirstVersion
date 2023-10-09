
import '../helper/api.dart';
import '../models/productmodel.dart';

class GetAllProducts{
  Future<List<productModel>> getAllProducts()async{
    List<dynamic> data=await Api().get(url: "https://fakestoreapi.com/products");
                List<productModel> productsList=[];
                for(int i=0;i<data.length;i++){
                  productsList.add(
                    productModel.fromJson(data[i]),
                  );
                }
                return productsList;
  }
}