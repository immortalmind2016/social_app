class SocialUserModel {
  String email;
  String name;
  String phone;
  String uId;
  SocialUserModel({this.email , this.name , this.phone,this.uId});

  SocialUserModel.fromJson(Map <String ,dynamic> json ){
    email = json['email'];
    name  = json ['name'];
    phone = json['phone'];
    uId   = json['uId'];
  }
  Map <String, dynamic> toMap(){
    return {
      'email':email,
      'name' :name,
      'phone':phone,
      'uId'  : uId,
    };

}
}