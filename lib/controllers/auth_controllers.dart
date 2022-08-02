import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktoks/constants.dart';
import 'package:tiktoks/models/users.dart' as model;
import 'package:tiktoks/views/screens/auth/login_screen.dart';
import 'package:tiktoks/views/screens/home_screen.dart';

class AuthControllers extends GetxController {
  static AuthControllers instance = Get.find();
  Rx<File> _pickedImage;
  Rx<User> _user;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User>(firebaseAuth.currentUser);
    _user.bindStream(
      firebaseAuth.authStateChanges(),
    );
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(
        () => HomeScreen(),
      );
    }
  }

  File get Profilephoto => _pickedImage.value;
  void pickImage() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('You have picked an image', 'Image picked is successfull');
    }
    _pickedImage = Rx<File>(
      File(pickedImage.path),
    );
  }

  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('ProfilePics')
        .child(firebaseAuth.currentUser.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  void registerUser(
      String email, String password, String username, File image) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
          email: email,
          profilePhoto: downloadUrl,
          uid: cred.user.uid,
          name: username,
        );
        await firestore
            .collection('users')
            .doc(cred.user.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
          'There is an error',
          'please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'There is an error',
        e.toString(),
      );
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        print("Success");
      } else {
        Get.snackbar(
          'There was an error',
          'Enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'There was an error',
        e.toString(),
      );
    }
  }
}



// class AuthControllers extends GetxController {
//   void registerUser(
//       String username, String email, String password, File image) async {
//     try {
//       if (username.isNotEmpty &&
//           email.isNotEmpty &&
//           password.isNotEmpty &&
//           image != null) {
//         UserCredential credential = await firebaseAuth
//             .createUserWithEmailAndPassword(email: email, password: password);
//       }
//     } catch (e) {
//       Get.snackbar(
//         'There is an error',
//         e.toString(),
//       );
//     }
//   }
// }

// Future<String> _uploadToStorage(File image) async {
//     Reference ref = firebaseStorage
//         .ref()
//         .child('profilePics')
//         .child(firebaseAuth.currentUser.uid);

//     UploadTask uploadTask = ref.putFile(image);
//     TaskSnapshot snap = await uploadTask;
//     String downloadUrl = await snap.ref.getDownloadURL();
//   }