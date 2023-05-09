import 'package:e_commerce/features/edit_profile/edit_profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController(FirebaseAuth.instance.currentUser!.uid));
  }
}
