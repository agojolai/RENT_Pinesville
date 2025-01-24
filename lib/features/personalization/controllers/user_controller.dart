import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/utils/popups/loaders.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../authentication/models/user_model.dart';


class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel?> user = UserModel.empty().obs;

  final userRepo = Get.put(UserRepository());


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

//FETCH USER METHOD
  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepo.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

/*
  //save User Record from any registration provider
Future<void> saveUserRecord(UserCredential? userCredentials) async {
  try {
    if (userCredentials != null) {
      //Convert Name into First and Last Name
      final nameParts = UserModel.nameParts(
          userCredentials.user!.displayName ?? '');

      //Map Data
      final user = UserModel(
        id: userCredentials.user!.uid,
        firstName: nameParts[0],
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
        email: userCredentials.user!.email ?? '',
        phoneNo: userCredentials.user!.phoneNumber ?? '',
      /*  moveInDate: userCredentials.user!.moveInDate ?? '',
        unitNo: userCredentials.user!.unitNo ?? '',
        profilePic: userCredentials.user!.profilePic ?? '',*/
      );

      await userRepo.saveUserRecord(user);
    }
    } catch (e){
    PLoaders.warningSnackBar(title: 'Data not saved.',
        message: 'Something is wrong while saving your info. You can re-save your data in your Profile.',
    );
  }
}*/

  uploadUserProfilePicture() async {
    try {
      print('undergo button');
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        //Upload Image
        final imageUrl = await userRepo.uploadImage(
            'Users/Images/Profile', image);
        print('awaited user repo');

        //update user image record
        Map<String, dynamic> json = {'ProfilePic': imageUrl};

        await userRepo.updateSingleField(json);

        print('uploaded to json');

        // Update the user model with the new image URL

       // user.value.profilePic = imageUrl;
       // fetchUserRecord();
        PLoaders.successSnackBar(
            title: 'Nice!', message: 'Profile Picture uploaded.');
      }
    } catch (e) {
      PLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
