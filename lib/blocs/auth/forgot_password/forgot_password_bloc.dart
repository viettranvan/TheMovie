
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_movie/services/services.dart';
import 'package:the_movie/validation/validation.dart';
import 'package:the_movie/values/values.dart';

import '../../blocs.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthService authService;

  ForgotPasswordBloc({required this.authService}) : super(ForgotPasswordInitial()) {
    on<SendEmailRequest>(_onSendEmailRequest);
  }

  Future _onSendEmailRequest(
      SendEmailRequest event, Emitter<ForgotPasswordState> emit) async {
    try {
      if(event.email.isEmpty){
        emit(SendEmailFailure(errorMessage: 'Email is required!'));
      }else if(!Validation().validatorEmail(event.email)){
        emit(SendEmailFailure(errorMessage: 'Incorrect email format!'));
      }else{

        var obj = await authService.sendPasswordResetEmail(event.email);
        if(obj.runtimeType == FirebaseAuthException){
          emit(SendEmailFailure(errorMessage: checkFirebaseAuthExceptionError(obj)));
        }else{
          emit(SendEmailSuccess());
        }
      }
    } catch (e) {
      debugPrint('error: $e');
    }
  }
  @override
  void onChange(Change<ForgotPasswordState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

}
