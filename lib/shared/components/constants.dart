
import 'package:socialapp/modules/login_screen/login_screen.dart';
import 'package:socialapp/shared/components/components.dart';
//import 'package:socialapp/shared/network/local/cache_helper.dart';

// void signOut(context){
//   // CacheHelper.removeData(key: 'token').then((value)
//   // {
//   //   if (value){
//   //     navigateAndFinish(context, LoginScreen());
//   //   }
//   // });
// }
void printFullText (String text){
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match)=> print(match.group(0)));
}
String token = '';
String uId = '';