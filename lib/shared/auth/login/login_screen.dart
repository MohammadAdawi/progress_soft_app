import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_soft_app/app/app_cubit.dart';
import 'package:progress_soft_app/shared/auth/register/register_screen.dart';
import 'package:progress_soft_app/shared/local/Validators/validators.dart';
import 'package:progress_soft_app/shared/local/helpers/router/app_router.dart';
import 'package:progress_soft_app/shared/local/theme/theme.dart';
import 'package:progress_soft_app/shared/widgets/buttons/button_1.dart';
import 'package:progress_soft_app/shared/widgets/dialogs/custom_dialog.dart';
import 'package:progress_soft_app/shared/widgets/dialogs/loading_dialog.dart';
import 'package:progress_soft_app/shared/widgets/fields/field_1.dart';

import 'cubit.dart';
import 'states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isButtonEnabled = false;
  var fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Handle system back button press here
          // For example, you can close the app by popping all routes:
          Navigator.of(context).popUntil((route) => route.isFirst);
          return true; // Return true to allow the back button action
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 234, 234, 234),
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: AppTheme.primaryColor,
            toolbarHeight: 40.0.h,
            automaticallyImplyLeading: false,
          ),
          body: BlocProvider(
            create: (context) => LoginCubit(),
            child: BlocConsumer<LoginCubit, LoginStates>(
              listener: (context, state) {
                if (state is LoginLoadingState) {
                  showDialog(
                    context: context,
                    builder: (context) => const LoadingDialog(),
                  );
                  // showDialog with a LoadingDialog (from shared dialogs)
                }
                if (state is LoginSuccessState) {}

                if (state is LoginErrorState) {
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
                            dialogTitle: "Sorry!",
                            isBackButtonEnabled: true,
                            // dialogSubtitle:
                            dialogSubtitle: AppCubit.get(context).systemConfig!.incorrectPasswordMessage,
                          ));
                }
              },
              builder: (context, state) {
                var cubit = LoginCubit.get(context);
                return Form(
                  key: fromkey,
                  child: Stack(
                    children: [
                      Container(
                        height: 300.h,
                        decoration: const BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(22),
                                bottomLeft: Radius.circular(22))),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 18.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.3), // shadow color
                                spreadRadius: 2, // spread radius
                                blurRadius: 5, // blur radius
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 30.h),
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Center(
                                  child: Image.asset(
                                      "assets/images/login_logo.png",
                                      width: 120.w,
                                      height: 120.h),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text("Signin",
                                    style: TextStyle(
                                      fontFamily: "SFArabic",
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.w900,
                                      color: AppTheme.titleColor,
                                    )),
                                Text("Welcome Again",
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color: AppTheme.subtitleColor,
                                    )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text("Phone Number",
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color: AppTheme.hintTextColor,
                                    )),
                                SizedBox(
                                  height: 2.h,
                                ),
                                DefaultFormField(
                                  hintText: "777220243",
                                  controller: cubit.phoneController,
                                  type: TextInputType.name,
                                  validate: (p0) {
                                    return Validators.validateRequiredField(
                                        controllerText: cubit
                                            .phoneController.text
                                            .trim());
                                  },
                                  onChanged: (p0) {
                                    setState(() {
                                      if (cubit.phoneController.text
                                              .trim()
                                              .isNotEmpty &&
                                          cubit.passwordController.text
                                              .trim()
                                              .isNotEmpty) {
                                        isButtonEnabled = true;
                                      } else {
                                        isButtonEnabled = false;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text("Password",
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color: AppTheme.hintTextColor,
                                    )),
                                SizedBox(
                                  height: 2.h,
                                ),
                                DefaultFormField(
                                  hintText: "Aa1@bcDe",
                                  controller: cubit.passwordController,
                                  type: TextInputType.visiblePassword,
                                  obscureText: true,
                                  onChanged: (p0) {
                                    setState(() {
                                      if (cubit.phoneController.text
                                              .trim()
                                              .isNotEmpty &&
                                          cubit.passwordController.text
                                              .trim()
                                              .isNotEmpty) {
                                        isButtonEnabled = true;
                                      } else {
                                        isButtonEnabled = false;
                                      }
                                    });
                                  },
                                  validate: (p0) {
                                    return Validators.validatePassword(
                                        passwordControllerText: cubit
                                            .passwordController.text
                                            .trim(),
                                        context: context);
                                  },
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                DefaultButton(
                                    onPressed: isButtonEnabled
                                        ? () {
                                            if (fromkey.currentState != null &&
                                                fromkey.currentState!
                                                    .validate()) {
                                              // AppRouter.push(
                                              //     screen: const Lay ut());
                                              cubit.login(context);
                                            }
                                          }
                                        : null,
                                    text: "Signin"),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have account?",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    DefaultTextButton(
                                      function: () {
                                        AppRouter.push(
                                            screen: const RegesterScreen());
                                      },
                                      text: "SignUp",
                                    ),
                                  ],
                                ),
                                Center(
                                  child: DefaultTextButton(
                                    function: () {
                                      // AppRouter.push(screen: const Layout());
                                    },
                                    text: "Guest",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
