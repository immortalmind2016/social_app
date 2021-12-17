abstract class LoginStates {}

class SocialLoginIntialStates extends LoginStates {}

class SocialLoginLoadingStates extends LoginStates {}

class SocialLoginSuccessStates extends LoginStates {
  final String uId;
  SocialLoginSuccessStates(this.uId);
}

class SocialLoginErrorStates extends LoginStates {
  final String error;
  SocialLoginErrorStates(this.error);
}

class SocialLoginChangePasswordVisibilityState extends LoginStates {}
