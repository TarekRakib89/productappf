import 'package:ecommerceapp/data/api/apiclient.dart';
import 'package:get/get.dart';

class UserRepository extends GetxService {
  final ApiClient apiClient;
  UserRepository({
    required this.apiClient,
  });
}
