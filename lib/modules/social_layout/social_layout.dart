
import 'package:conditional_builder/conditional_builder.dart';
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
            ),
          ),
          body:ConditionalBuilder(
            condition: SocialCubit.get(context).model != null,
            builder: (context){
              var model = SocialCubit.get(context).model;
              return Column(
                children: [
                if(!model.isEmailVerified)
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

                            function: (){},
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
