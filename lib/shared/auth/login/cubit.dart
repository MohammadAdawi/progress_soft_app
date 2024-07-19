import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft_app/app/app_cubit.dart';
import 'package:progress_soft_app/app/models/users_model.dart';
import 'package:progress_soft_app/shared/auth/register/register_screen.dart';
import 'package:progress_soft_app/shared/local/preference_utils/preference_utils.dart';
import 'package:progress_soft_app/src/home/home_screen.dart';
import 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  UsersModel? usersModel;
  void login(BuildContext context) async {
    emit(LoginLoadingState());

    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();

    if (phone.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter all fields")),
      );
      return;
    }

    try {
      CollectionReference userDoc =
          await FirebaseFirestore.instance.collection('auth');
      var response = await userDoc.doc('users').get();
      usersModel = UsersModel.fromJson(response.data() as Map<String, dynamic>);

      if (response.exists) {
        bool passwordcheck = usersModel!.users.any((element) =>
            element.password == password && element.phoneNumber == phone);

        if (passwordcheck) {
          User user = usersModel!.users.firstWhere((element) =>
              element.password == password && element.phoneNumber == phone);
          PreferenceUtils.setString(
            "fullName",
            user.fullName ,
          );
          PreferenceUtils.setString(
            "phoneNumber",
            user.phoneNumber ,
          );
          PreferenceUtils.setString(
            "age",
            user.age.toString() ,
          );
          PreferenceUtils.setString(
            "gender",
            user.gender.toString() ,
          );
          emit(LoginSuccessState());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
  emit(LoginErrorState());

        }
      } else {
        _showRegisterDialog(context);
      emit(LoginErrorState());

      }
    } catch (e) {
      emit(LoginErrorState());

      print("Error checking user: $e");
    }
  }

  void _showRegisterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("User not registered"),
        content: const Text("Would you like to register?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("Register"),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegesterScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
