
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/login_screen/cubit/states.dart';

class SocialLoginCubit extends Cubit<LoginStates>{
  SocialLoginCubit():super(SocialLoginIntialStates());
  static SocialLoginCubit get(context)=>BlocProvider.of(context);

  void userLogin({
    @required String email,
    @required String password,
  })
  {
    emit(SocialLoginLoadingStates());
    FirebaseAuth.instance.signInWithEmailAndPassword
      (email: email,
        password: password).then((value)
    {
      print('EMAAAIIIIL'+value.user.email);
      print('UIDDDDDDDDD'+value.user.uid);

      emit(SocialLoginSuccessStates(value.user.uid));

    }
    ).catchError((error)
    {
      emit(SocialLoginErrorStates(error.toString()));

    });


  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true ;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined :  Icons.visibility_off_outlined;
    emit(SocialLoginChangePasswordVisibilityState());


  }
}