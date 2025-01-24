import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled/utils/popups/full_screen_loader.dart';
import 'package:untitled/utils/popups/loaders.dart';
import '../../../utils/constants/PImages.dart';

class SubmitProofController extends GetxController {
  var billsImage = Rx<File?>(null); // Reactive variable for the image

  final ImagePicker _picker = ImagePicker();

  // Pick image from gallery
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      billsImage.value = File(pickedFile.path);  // Update the image
    }
  }

  // Upload image to Firebase Storage
  Future<void> uploadImage() async {
    if (billsImage.value == null) {
      print('No image selected.');
      return;
    }

    try {
      // Show loading indicator
      PFullScreenLoader.openLoadingDialog('Processing...', PImages.processData);

      // Get a reference to Firebase Storage
      FirebaseStorage storage = FirebaseStorage.instance;

      // Create a reference to the storage path where the image will be stored
      Reference ref = storage.ref().child("uploads/payment_proofs/${DateTime.now().millisecondsSinceEpoch}.jpg");

      // Upload the image to Firebase Storage
      UploadTask uploadTask = ref.putFile(billsImage.value!);

      // Wait for the upload to complete
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      print('Image uploaded successfully: $downloadUrl');

      // Success message
      PLoaders.successSnackBar(
          title: 'Success!',
          message: 'Your POP has been submitted successfully.');

      // Close the loading indicator
      PFullScreenLoader.stopLoading();

      // You can save the download URL to Firestore or use it as needed
    } catch (e) {
      print('Error uploading image: $e');

      // Show error message
      PLoaders.errorSnackBar(
          title: 'Error', message: 'Failed to upload image: $e');
      PFullScreenLoader.stopLoading();
    }
  }
}
