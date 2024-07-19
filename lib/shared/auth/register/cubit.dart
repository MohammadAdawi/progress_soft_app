
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft_app/shared/auth/register/otp_screen.dart';
import 'package:progress_soft_app/shared/auth/login/login_screen.dart';
import 'package:progress_soft_app/shared/auth/register/states.dart';
import 'model.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitState());
  static SignUpCubit get(context) => BlocProvider.of(context);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  int age = 18;
  String gender = 'Male';
  var fromkey = GlobalKey<FormState>();
  SignUpModel? signUpModel;
 void register(BuildContext context) async {
    String name =nameController.text.trim();
    String phone =phoneController.text.trim();
    String password =passwordController.text.trim();
    String confirmPassword =confirmPasswordController.text.trim();

    if (name.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty || password != confirmPassword) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter all fields and ensure passwords match")),
      );
      return;
    }

    // Send OTP
    try {
      String formattedNumber = '';
  if (phone.length != 9) {}else {
     formattedNumber = '+962 ${phone.substring(0, 4)} ${phone.substring(4, 7)} ${phone.substring(7, 9)}';
  }
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: formattedNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Verification failed: ${e.message}")),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                verificationId: verificationId,
                onVerified: () async {
                  // Save user on Firebase Auth and Firestore
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: phone + "@example.com", // Use phone number as email
                    password: password,
                  );

                  await FirebaseFirestore.instance.collection('users').doc(phone).set({
                    'name': name,
                    'phone': phone,
                    'age':age,
                    'gender':gender,
                    'password': password, // Store hashed password in a real app
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Registration successful")),
                  );
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print("Error sending OTP: $e");
    }
  }
 }
