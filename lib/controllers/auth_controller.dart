import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/constants.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _firebaseUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Rx<UserModel?> loggedInUser = Rx<UserModel?>(null);
  RxBool isLoggedIn = false.obs;

  Rx<User?> get user => _firebaseUser;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser = Rx<User?>(auth.currentUser);
    _firebaseUser.bindStream(auth.userChanges());
    ever(_firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      isLoggedIn.value = false;
      loggedInUser.value = null;
    } else {
      isLoggedIn.value = true;
      _loadUserFromFirestore(user.uid);
    }
  }

  void signUp(String email, String password, String username) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        UserModel newUser = UserModel(
          uid: user.uid,
          email: user.email!,
          username: username,
          lastSignIn: DateTime.now(),
        );
        await _saveUserToFirestore(newUser);
        loggedInUser.value = newUser;
        navigationController.navigateTo(NavigationEvent.home);
      }
    } catch (e) {
      Get.snackbar('Error creating account', e.toString());
    }
  }

  void signIn(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        await _loadUserFromFirestore(user.uid);
        navigationController.navigateTo(NavigationEvent.home);
      }
    } catch (e) {
      Get.snackbar('Error signing in', e.toString());
    }
  }

  void signOut() async {
    await auth.signOut();
    loggedInUser.value = null;
    isLoggedIn.value = false;
  }

  Future<void> _saveUserToFirestore(UserModel userModel) async {
    final userDoc = firestore.collection('users').doc(userModel.uid);
    await userDoc.set(userModel.toMap(), SetOptions(merge: true));
  }

  Future<void> _loadUserFromFirestore(String uid) async {
    final userDoc = await firestore.collection('users').doc(uid).get();
    if (userDoc.exists) {
      loggedInUser.value = UserModel.fromMap(userDoc.data()!);
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    if (loggedInUser.value != null) {
      return loggedInUser.value!.toMap();
    }
    return null;
  }
}

class UserModel {
  final String uid;
  final String email;
  final String username;
  final DateTime lastSignIn;

  UserModel({
    required this.uid,
    required this.email,
    required this.username,
    required this.lastSignIn,
  });

  // Convert Firestore data to UserModel
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      username: data['username'],
      lastSignIn: (data['last_sign_in'] as Timestamp).toDate(),
    );
  }

  // Convert UserModel to Firestore data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'last_sign_in': lastSignIn,
    };
  }
}
