import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/login_screen/cubit/cubit.dart';
import 'package:socialapp/modules/login_screen/cubit/states.dart';
import 'package:socialapp/modules/register_screen/register_screen.dart';
import 'package:socialapp/shared/components/components.dart';
class  LoginScreen extends StatelessWidget {
  // const  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit,LoginStates>(
        listener:(context,state){
           if(state is SocialLoginErrorStates){
             showToast(
                 text: state.error,
                 state: ToastStates.ERROR);
           }
          if(state is SocialLoginSuccessStates)
           {
            // CacheHelper.saveData(
            // key   :'uId',
            //    value :state.uId,
            // ).then((value)
            //  {
            //    navigateAndFinish(context, SocialLayout());
            //
            //
            // });

           }
        } ,
        builder: (context,stata){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar:AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key : formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOGIN',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                            color:Colors.black,
                          ),
                        ),
                        Text('Login now to communicate with friends ',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color:Colors.grey,
                          ),

                        ),
                        SizedBox(
                          height:30.0,

                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String value){
                              if(value.isEmpty){
                                return 'please entrer your email address';
                              }
                            },
                            label: 'Email address',
                            prefix: Icons.email_outlined,
                            onSubmit: (value){
                               if(formKey.currentState.validate()){
                                 SocialLoginCubit.get(context).userLogin(
                                   email: emailController.text,
                                   password: passwordController.text,
                                 );
                               }
                            }
                        ),
                        SizedBox(
                          height:15.0,

                        ),
                        defaultFormField(
                          isPassword: SocialLoginCubit.get(context).isPassword,

                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: SocialLoginCubit.get(context).suffix,
                          suffixPressed: (){
                            SocialLoginCubit.get(context).changePasswordVisibility();
                          },
                          validate: (String value){
                            if(value.isEmpty){
                              return 'Password is too short ';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height:30.0,

                        ),
                        ConditionalBuilder(
                          condition:true ,// state is! SocialLoginLoadingStates,
                          builder: (context)=> defaultButton(
                            function: (){
                              if(formKey.currentState.validate()){
                                SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }

                            },
                            text: 'Login',
                            isUpperCase: true,
                          ),
                          fallback: (context)=>Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height:15.0,

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account?',
                            ),
                            defaultTextButton(
                              function: (){
                                navigateAndFinish(context, RegisterScreen(),);

                              },
                              text: 'register',
                            ),
                          ],
                        ),

                      ],

                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
