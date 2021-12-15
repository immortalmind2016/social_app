abstract class RegisterStates {}

class SocialRegisterIntialStates extends RegisterStates{}

class SocialRegisterLoadingStates extends RegisterStates{}

class SocialRegisterSuccessStates extends RegisterStates{

  // final SocialLoginModel loginModel ;

  // SocialRegisterSuccessStates(this.loginModel);

}

class SocialRegisterErrorStates extends RegisterStates{

  final String error;

  SocialRegisterErrorStates(this.error);

}
class SocialRegisterChangePasswordVisibilityState extends RegisterStates{}
class SocialCreateUserLoadingStates extends RegisterStates{}
class SocialCreateUserSuccessStates extends RegisterStates{}
class SocialCreateUserErrorStates extends RegisterStates{
  final String error;
  SocialCreateUserErrorStates(this.error);
}