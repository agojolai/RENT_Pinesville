import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:untitled/features/authentication/screens/login/login.dart';
import 'package:untitled/utils/navigation_menu.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  final firebaseStore = FirebaseFirestore.instance;

  //get authenticated user data
  User? get authUser => _auth.currentUser;

  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    print("authuser");
    if (user != null) {
        Get.offAll(() => NavigationMenu());

    }
    else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => LoginScreen());
    }
  }

  /*-----------------------DUMMY APPROVE TENANT------------------------*/
  Future<void> approvePendingUser(String email) async {
    try {
      // 1. Find the user in the pendingTenants collection
      final pendingSnapshot = await firebaseStore
          .collection('pendingTenants')
          .where('Email', isEqualTo: email)
          .limit(1)
          .get();

      if (pendingSnapshot.docs.isEmpty) {
        print("❌ User not found in pending tenants.");
        return;
      }

      final pendingDoc = pendingSnapshot.docs.first;
      final userData = pendingDoc.data();

      // 2. Extract the UID from the document ID (assuming it's the UID)
      final uid = pendingDoc.id;

      // 3. Copy the data to the Users collection using UID as doc ID
      await firebaseStore.collection('Users').doc(uid).set({
        ...userData
       // 'id': uid, // Ensure 'id' field exists in user model
      });

      // 4. Delete from pendingTenants
      await firebaseStore.collection('pendingTenants').doc(uid).delete();

      // 5. Simulate sending a confirmation email
      print('✅ User approved and moved to Users collection.');
      print('📧 Simulated email sent to: $email');
    } on FirebaseAuthException catch (e) {
      throw PFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const PFormatException();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      print("Error approving user: $e");
    }
  }


/*-----------------------Email and Password Sign In------------------------*/

//Email auth LogIN
  Future<UserCredential> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw PFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const PFormatException();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

//Email auth SignUp
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw PFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const PFormatException();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

// Forget Password
  Future<void> forgetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw PFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const PFormatException();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

//log out
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw PFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const PFormatException();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
