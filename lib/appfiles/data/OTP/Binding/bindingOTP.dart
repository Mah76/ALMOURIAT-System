import 'package:get/get.dart';
import '../controllers/controllersOTP.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}
