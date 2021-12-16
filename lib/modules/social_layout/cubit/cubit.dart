import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/models/social_user_model.dart';
import 'package:socialapp/modules/social_layout/cubit/states.dart';
import 'package:socialapp/shared/components/constants.dart';

class SocialCubit extends Cubit <SocialStates>{
  SocialCubit() : super(SocialIntialState());
  static SocialCubit get(context) => BlocProvider.of(context);
  SocialUserModel model;
  void getUserData (){
      emit(SocialGetUserLoadingState());
      FirebaseFirestore
          .instance
          .collection('Users')
          .doc(uId)
          .get()
          .then((value) {
            print(value.data());
            model = SocialUserModel.fromJson(value.data());
            emit(SocialGetUserSuccessState());
      })
          .catchError((error){
            print(error.toString());
        emit(SocialGetUserErrorState(error.toString()));

      });
  }
}