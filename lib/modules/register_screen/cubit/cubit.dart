
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/register_screen/cubit/status.dart';

class SocialRegisterCubit extends Cubit<RegisterStates>{
  SocialRegisterCubit():super(SocialRegisterIntialStates());
  static SocialRegisterCubit get(context)=>BlocProvider.of(context);
  // SocialLoginModel loginModel;
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true ;

  void userRegister({
    @required String email,
    @required String password,
    @required String name,
    @required String phone,


  })
  {
    emit(SocialRegisterLoadingStates());
    // FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: email,
    //     password: password).then((value) {
    //   print(value.user.email);
    //   print(value.user.uid);
    //   userCreate(
    //     uId: value.user.uid,
    //     phone: phone,
    //     email: email,
    //     name:name,
    //
    //   );
    //   // emit(SocialRegisterSuccessStates());
    // }
    // ).catchError((error){
    //   print(error.toString());
    //   emit(SocialRegisterErrorStates(error.toString()));
    //
    //
    // });
    IconData suffix = Icons.visibility_outlined;
    bool isPassword = true ;
    void changePasswordVisibility(){
      isPassword = !isPassword;
      suffix = isPassword ? Icons.visibility_outlined :  Icons.visibility_off_outlined;
      //  emit(SocialRegisterChangePasswordVisibilityState());


    }
  }
//for firebase store

  // void userCreate({
  //   @required String email,
  //   @required String name,
  //   @required String phone,
  //   @required String uId,
  //
  // })
  // {
  //   // SocialUserModel model = SocialUserModel(
  //   //   email:email,
  //   //   name:name,
  //   //   phone: phone,
  //   //   uId:uId,
  //   //   isEmailVerified:false,
  //   // );
  //   FirebaseFirestore.instance.collection('users')
  //       .doc(uId)
  //       .set(model.toMap()).then((value) {
  //     emit(SocialCreateUserSuccessStates());
  //   }).catchError((error){
  //     emit(SocialCreateUserErrorStates(error.toString()));
  //
  //
  //   });
  //
  // }
}
