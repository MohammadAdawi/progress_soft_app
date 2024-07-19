import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:progress_soft_app/shared/auth/register/otp_screen.dart';
import 'package:progress_soft_app/shared/auth/login/login_screen.dart';
import 'package:progress_soft_app/shared/auth/register/cubit.dart';
import 'package:progress_soft_app/shared/auth/register/states.dart';
import 'package:progress_soft_app/shared/local/Validators/validators.dart';
import 'package:progress_soft_app/shared/local/helpers/router/app_router.dart';
import 'package:progress_soft_app/shared/widgets/buttons/button_1.dart';
import 'package:progress_soft_app/shared/widgets/dialogs/custom_dialog.dart';
import 'package:progress_soft_app/shared/widgets/dialogs/loading_dialog.dart';
import 'package:progress_soft_app/shared/widgets/fields/field_1.dart';

import '../../../../../shared/local/theme/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteTextColor,
      appBar: AppBar(
        backgroundColor: AppTheme.whiteTextColor,
        toolbarHeight: 40.0,
        title: const Text(
          "Register",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            weight: 8.w,
            color: AppTheme.primaryColor,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: BlocProvider(
          create: (context) => SignUpCubit(),
          child: BlocConsumer<SignUpCubit, SignUpStates>(
              listener: (context, state) {
            if (state is SignUpLoadingState) {
              showDialog(
                context: context,
                builder: (context) => const LoadingDialog(),
              );
              // showDialog with a LoadingDialog (from shared dialogs)
            }

            if (state is SignUpErrorState) {
              AppRouter.pop();
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  isOptionDialog: false,
                  singleButtonOnPressed: () => AppRouter.pop(),
                  singleButtonText: "ok",
                  topWidget: const Icon(
                    Icons.warning_amber_outlined,
                    size: 40,
                    color: AppTheme.primaryColor,
                  ),
                  dialogTitle:"something went wrong",
                  isBackButtonEnabled: true,
                  // dialogSubtitle:
                  dialogSubtitle: state.errorMessage,
                ),
              );

            }
          }, builder: (context, state) {
            var cubit = SignUpCubit.get(context);
            return Form(
              key: cubit.fromkey,
              child: GestureDetector(
                onTap: () {
                  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             "Mobile Number",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            DefaultFormField(
                              controller: cubit.phoneController,
                              type: TextInputType.phone,
                              hintText: "Mobile Number",
                              validate: (p0) {
                                 Validators.validatePhoneNumber(phoneNumberController: cubit.phoneController.text, context: context);
                              },
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "User name",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            DefaultFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(RegExp(
                                      r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF]'))
                                ],
                                controller: cubit.nameController,
                                type: TextInputType.name,
                                validate: (value) {
                                  return Validators.validateRequiredField(
                                      controllerText:
                                          cubit.nameController.text);
                                },
                                hintText: "User name")
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            DefaultFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(RegExp(
                                      r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF]'))
                                ],
                                obscureText: true,
                                controller: cubit.passwordController,
                                type: TextInputType.name,
                                validate: (value) {
                                  return Validators.validatePassword(
                                      passwordControllerText:
                                          cubit.passwordController.text,
                                      context: context);
                                },
                                hintText: "Password"),
                            Text(
                              "Password",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            DefaultFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(RegExp(
                                      r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF]'))
                                ],
                                obscureText: true,
                                controller: cubit.confirmPasswordController,
                                type: TextInputType.name,
                                validate: (value) {
                                  return Validators.validatePassword(
                                      passwordControllerText:
                                          cubit.confirmPasswordController.text,
                                      context: context);
                                },
                                hintText: "Password"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DropdownButton<int>(
                              value: cubit.age,
                              onChanged: (int? newValue) {
                                setState(() {
                                  cubit.age = newValue!;
                                });
                              },
                              items: List.generate(100, (index) => index + 1)
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                            ),
                            DropdownButton<String>(
                              value: cubit.gender,
                              onChanged: (String? newValue) {
                                setState(() {
                                  cubit.gender = newValue!;
                                });
                              },
                              items: <String>['Male', 'Female', 'Other']
                                  .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        DefaultButton(
                            onPressed: () {
                              if( cubit.fromkey.currentState!
                                                    .validate()){ cubit.register(context);}
                             
                            },
                            text: "Register"),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
