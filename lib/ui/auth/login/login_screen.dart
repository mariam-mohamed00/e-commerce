import 'package:e_commerce/domain/di.dart';
import 'package:e_commerce/ui/auth/login/cubit/login_screen_view_model.dart';
import 'package:e_commerce/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerce/ui/auth/register/register_screen.dart';
import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:e_commerce/ui/utils/shared_preference_utils.dart';
import 'package:e_commerce/ui/utils/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/home_screen/widget/home_screen_view.dart';
import '../../utils/dialog_utils.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'Waiting');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              title: 'Error', posActionName: 'Ok');
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, 'Register Successfully',
              title: 'Success', posActionName: 'Ok');
          SharedPreferenceUtils.saveData(
              key: 'Token', value: state.resultEntity.token);
          Navigator.of(context).pushReplacementNamed(HomeScreenView.routeName);
        }
        // Navigator.of(context).pushReplacementNamed(HomeScreenView.routeName);
      },
      child: Scaffold(
        body: Container(
          color: MyTheme.primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
                  child: Image.asset('assets/images/route_img.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 24.h),
                        child: Text(
                          'Welcome Back To Route',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: MyTheme.whiteColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.h),
                        child: Text(
                          'Please sign in with your email',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: MyTheme.whiteColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              TextFieldItem(
                                fieldName: 'E-mail address',
                                hintText: 'enter your email address',
                                controller: viewModel.emailController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your email address';
                                  }
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);
                                  if (!emailValid) {
                                    return 'invalid email';
                                  }
                                  return null;
                                },
                                KeyboardType: TextInputType.emailAddress,
                              ),
                              TextFieldItem(
                                fieldName: 'Password',
                                hintText: 'enter your password',
                                controller: viewModel.passwordController,
                                KeyboardType: TextInputType.visiblePassword,
                                isObscure: viewModel.isObscure,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value.trim().length < 6 ||
                                      value.trim().length > 30) {
                                    return 'password should be >6 & <30';
                                  }
                                  return null;
                                },
                                suffixIcon: InkWell(
                                  child: viewModel.isObscure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 80.h, bottom: 20.h),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: MyTheme.whiteColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.r)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 165.w, vertical: 20.h)),
                                  onPressed: () {
                                    viewModel.login();
                                    // Navigator.of(context).pushReplacementNamed(
                                    //     HomeScreenView.routeName);
                                  },
                                  child: Text(
                                    'Login',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            fontSize: 20,
                                            color: MyTheme.primaryColor),
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(RegisterScreen.routeName);
                                  },
                                  child: Text(
                                    "Don't have an account? Create Account",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: MyTheme.whiteColor),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
