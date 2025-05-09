import 'package:anim34/shared/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserNotifierProvider extends Notifier<Set<User>> {
  bool isthere = false;
  @override
  Set<User> build() {
    return {
      User(name: 'pranav',num: '36454',email: 'pranav@ab.cd', password: '123456',islogged: false),
    };
  }
  void addUser(User user){
    if (!state.contains(user)){
      state = {...state, user};
    }
  }
  bool loginUser(String s){

    // state.forEach((element){
    //   if(element.name.equals(s) && element.islogged == true){
    //     isthere = true;
    //   }
    // });
    return isthere;
  }
}


final userNotifierProvider = NotifierProvider<UserNotifierProvider,Set<User>>((){
  return UserNotifierProvider();
});