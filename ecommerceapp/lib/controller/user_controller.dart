// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerceapp/controller/auth_controller.dart';
import 'package:ecommerceapp/data/repository/user_repository.dart';
import 'package:ecommerceapp/ui/model/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserRepository userRepository;
  UserController({
    required this.userRepository,
  });
  UserModel _user = UserModel(
    email: '',
    firstName: '',
    lastName: '',
    mobile: '',
    photo: '',
  );

  UserModel get user => _user;

  void setUser() async {
    _user = await AuthController.initializeUserCache();
    update();
  }

  void setUserFromModel(UserModel user) {
    _user = user;
  }
}
