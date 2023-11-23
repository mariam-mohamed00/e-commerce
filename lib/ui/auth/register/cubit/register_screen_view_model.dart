import 'package:e_commerce/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_case/register_use_case.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  /// hold data, handle logic

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObscure = true;

  void register() async {
    if (formKey.currentState?.validate() == true) {
      /// logic
      emit(RegisterLoadingState(loadingMessage: 'Loading..'));
      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          confirmationPasswordController.text,
          phoneController.text);
      either.fold((l) {
        emit(RegisterErrorState(errorMessage: l.errorMessage));
      }, (r) {
        emit(RegisterSuccessState(resultEntity: r));
      });
    }
  }
}
