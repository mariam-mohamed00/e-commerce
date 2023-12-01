import 'package:e_commerce/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_case/login_use_case.dart';

class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;
  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());

  /// hold data, handle logic

  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  bool isObscure = true;

  void login() async {
    if (formKey.currentState?.validate() == true) {
      /// logic
      emit(LoginLoadingState(loadingMessage: 'Loading..'));
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold((l) {
        emit(LoginErrorState(errorMessage: l.errorMessage));
      }, (r) {
        // Navigator.of(context).pushReplacementNamed(
        //     HomeScreenView.routeName);
        emit(LoginSuccessState(resultEntity: r));
      });
    }
  }
}
