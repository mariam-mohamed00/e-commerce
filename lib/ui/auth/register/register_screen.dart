import 'package:e_commerce/domain/di.dart';
import 'package:e_commerce/ui/auth/register/cubit/register_screen_view_model.dart';
import 'package:e_commerce/ui/auth/register/cubit/register_states.dart';
import 'package:e_commerce/ui/home/home_screen/widget/home_screen_view.dart';
import 'package:e_commerce/ui/utils/dialog_utils.dart';
import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:e_commerce/ui/utils/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'Register Screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'Waiting');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              title: 'Error', posActionName: 'Ok');
          print(state.errorMessage);
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, 'Register Successfully',
              title: 'Success', posActionName: 'Ok');
        }
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
                        padding: EdgeInsets.only(top: 1.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              TextFieldItem(
                                fieldName: 'Full Name',
                                hintText: 'enter your name',
                                controller: viewModel.nameController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                fieldName: 'Mobile Number',
                                hintText: 'enter your mobile no.',
                                controller: viewModel.phoneController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your mobile number';
                                  }
                                  return null;
                                },
                                KeyboardType: TextInputType.phone,
                              ),
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
                              TextFieldItem(
                                fieldName: 'Password',
                                hintText: 'enter your password',
                                controller:
                                    viewModel.confirmationPasswordController,
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
                                    EdgeInsets.only(top: 24.h, bottom: 20.h),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: MyTheme.whiteColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.r)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 160.w, vertical: 20.h)),
                                  onPressed: () {
                                    viewModel.register();
                                    Navigator.of(context).pushReplacementNamed(
                                        HomeScreenView.routeName);
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            fontSize: 20,
                                            color: MyTheme.primaryColor),
                                  ),
                                ),
                              ),
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
