
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/social_layout/cubit/cubit.dart';
import 'package:socialapp/modules/social_layout/cubit/states.dart';
import 'package:socialapp/shared/components/components.dart';

class SocialLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'News Feed',
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
          body:ConditionalBuilder(
            condition: SocialCubit.get(context).model != null,
            builder: (context){
              var model = SocialCubit.get(context).model;
              return Column(
                children: [
                if(!FirebaseAuth.instance.currentUser.emailVerified)
                    Container(
                    color:Colors.amber.withOpacity(.6),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                          ),
                          SizedBox(width: 15.0,),
                          Expanded(
                            child: Text(
                              'please verify your email',
                            ),
                          ),
                          SizedBox(width: 20.0,),
                          defaultTextButton(

                            function: (){
                              FirebaseAuth
                                  .instance
                                  .currentUser
                                  .sendEmailVerification().then((value) {

                              }).catchError((error){
                                showToast(text: 'check your mail ', state: ToastStates.SUCCESS);
                              });
                            },
                            text: 'Send ',

                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );


      },
    );
  }
}
