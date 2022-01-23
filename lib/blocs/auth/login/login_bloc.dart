import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_movie/models/models.dart';
import 'package:the_movie/services/auth.dart';
import 'package:the_movie/validation/validation.dart';
import 'package:the_movie/values/values.dart';

import '../../blocs.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;

  LoginBloc({required this.authService}) : super(LoginInitial()) {
    on<SendLoginRequest>(_onSendLoginRequest);
  }

  Future _onSendLoginRequest(
      SendLoginRequest event, Emitter<LoginState> emit) async {
    try {
      String check = checkValidate(event.email, event.password);

      if (check.isNotEmpty) {
          emit(LoginFailure(errorMessage: check));
        emit(LoginFailure(errorMessage: check));
      } else {
        FirebaseAuth _auth = FirebaseAuth.instance;
        var authenticationObj = await authService.signInWithEmailAndPassword(
            event.email, event.password);
        bool emailVerified = _auth.currentUser?.emailVerified ?? false;

        if (authenticationObj.runtimeType == Authentication) {
          if(emailVerified){
            emit(LoginSuccess(authentication: authenticationObj));
          }else{
            emit(EmailIsNotVerify());
            // emit(LoginFailure(errorMessage: 'Your account is not verified yet please check your email!'));
          }
        } else if (authenticationObj.runtimeType == FirebaseAuthException) {
          emit(LoginFailure(
              errorMessage:
                  checkFirebaseAuthExceptionError(authenticationObj)));
        }
      }
    } catch (e) {
      debugPrint('error: $e');
    }
  }

  // Future _onSendLoginRequest(
  //     SendLoginRequest event, Emitter<LoginState> emit) async {
  //   emit(LoginLoading());
  //   print('emit loading');
  //   try {
  //     if (event.email.isEmpty && event.password.isEmpty) {
  //       emit(
  //         LoginFailure(errorMessage: 'Email is required\nPassword is required'),
  //       );
  //     } else if (event.email.isEmpty && event.password.isNotEmpty) {
  //       emit(LoginFailure(errorMessage: 'Email is required'));
  //     } else if (event.email.isNotEmpty && event.password.isEmpty) {
  //       emit(LoginFailure(errorMessage: 'Password is required'));
  //     } else {
  //       if(!Validation().validatorEmail(event.email)){
  //         emit(LoginFailure(errorMessage: 'Incorrect email format'));
  //       }else if(event.password.isEmpty || event.password.length < 6){
  //         emit(LoginFailure(errorMessage: 'Password at least 6 characters'));
  //       }else{
  //         var authenticationObj = await authService.signInWithEmailAndPassword(
  //             event.email, event.password);
  //         if(authenticationObj.runtimeType == Authentication){
  //           emit(LoginSuccess(authentication: authenticationObj));
  //         }else if(authenticationObj.runtimeType == FirebaseAuthException){
  //           emit(LoginFailure(errorMessage: checkFirebaseAuthExceptionError(authenticationObj)));
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     debugPrint('error: $e');
  //   }
  // }

  String checkValidate(String email, String password) {
    String result = '';

    if (email.isEmpty && password.isEmpty) {
      result = 'Email is required\nPassword is required';
    }

    if (email.isEmpty && password.isNotEmpty) {
      result = 'Email is required';
    }

    if (email.isNotEmpty && password.isEmpty) {
      result = 'Password is required';
    }

    if (email.isNotEmpty && password.isNotEmpty) {
      if (!Validation().validatorEmail(email)) {
        result = 'Incorrect email format';
      } else if (password.length < 6) {
        result = 'Password at least 6 characters';
      }
    }

    return result;
  }


}
