
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/social_layout/cubit/cubit.dart';
import 'package:socialapp/modules/social_layout/cubit/states.dart';

class SocialLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body:Text('Social Layout'),
        );


      },
    );
  }
}
