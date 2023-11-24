// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerceapp/data/api/apiclient.dart';
import 'package:ecommerceapp/utiles/AppConstants.dart';
import 'package:get/get.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;
  ProductRepo({
    required this.apiClient,
  });

  Future<Response> getProductList() async {
    return await apiClient.getData(AppConstants.PRODUCT_URI);
  }
}
