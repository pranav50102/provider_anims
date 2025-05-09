import 'package:anim34/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/user.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _globalKey = GlobalKey<FormState>();
  bool isChecked = false;
  // ischecked = ischecked == null ?true :false ;
  bool isTap = false;
  final User user = User(name: '', num: '', email: '', password: '',islogged: false)  ;
  bool isMatch = false;

  @override
  
  Widget build(BuildContext context) {
    final Ausers = ref.watch(userNotifierProvider);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
          backgroundColor: Colors.grey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/moon.jpg'),
              fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 80,horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                                Icons.person,
                              size: 34,
                            ),
                            Text(
                              '  Register',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                letterSpacing: 1.0,
                              ),
                            ),
                            SizedBox()
                          ],
                        ),
                      ),
                        SizedBox(
                          height: 22,
                        ),
                        Form(
                          key: _globalKey,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(20),
                                    ],
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person_2_outlined),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      labelText: 'Full Name',
                                      hintText: 'Enter Full Name',
                                    ),

                                    onTap: (){
                                      setState(() {
                                        isTap = false;
                                      });
                                    },
                                    validator: (value){
                                      String  k = value.toString();
                                      List<int> ar =  k.codeUnits;
                                      for(int i=0;i<ar.length;i++){
                                        if(!((ar[i]>64 && ar[i]<91 )||(ar[i]>96 && ar[i]<123)||ar[i]==32)){
                                            return 'Name should only contain letters';
                                        }
                                      }
                                      if(k == ''){
                                        return 'Name cant be empty';
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(12),
                                    ],
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.mobile_friendly_outlined),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      labelText: 'Mobile Number',
                                      hintText: 'Enter Mobile Number',
                                    ),
                                    onTap: (){
                                      setState(() {
                                        isTap = false;
                                      });
                                    },
                                    validator: (value){
                                      String  l = value.toString();
                                      List<int> ar1 =  l.codeUnits;
                                      for(int i=0;i<ar1.length;i++){
                                        if(!(ar1[i]>=48 && ar1[i]<58)){
                                          return 'Mobile Number should only contain Numbers';
                                        }
                                      }
                                      if(l == ''){
                                        return 'Mobile Number cant be empty';
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(20),
                                    ],
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      labelText: 'Email',
                                      hintText: 'Enter Email',

                                    ),
                                    validator: (value){
                                      String  m = value.toString();
                                      List<int> ar3 =  m.codeUnits;
                                      if(value == ''){
                                        return 'Email cant be empty';
                                      }
                                      else if(!(ar3.contains(64) && ar3.contains(46))){
                                        return 'Enter valid Email';
                                      }
                                      else{
                                        for(int i=0;i<ar3.length;i++){
                                          if(!((ar3[i]>64 && ar3[i]<91 )||(ar3[i]>96 && ar3[i]<123)||(ar3[i]>32 && ar3[i]<48)||ar3[i] == 64 ||ar3[i] == 46)){
                                            return 'Enter valid Email';
                                          }
                                        }
                                      }
                                     },

                                    onTap: (){
                                      setState(() {
                                        isTap = false;
                                      });
                                    },

                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10),
                                        ],
                                        obscureText: true,
                                        // controller: _Controller,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.key),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(),
                                          labelText: 'Password',
                                          hintText: 'Enter Password',
                                        ),
                                        onTap: (){
                                          setState(() {
                                            isTap = true;
                                          });
                                        },
                                        validator: (value){
                                          String n = value.toString();
                                          List <int> ar4= n.codeUnits;
                                          int c1 =0;
                                          int c2 =0;
                                          int c3 =0;
                                          for(int i=0;i<ar4.length;i++){
                                            if((ar4[i]>64 && ar4[i]<91)){
                                              c1 +=1;
                                            }
                                            else if((ar4[i]>96 && ar4[i]<123)){
                                              c2 +=1;
                                            }
                                            else if((ar4[i]>=48 && ar4[i]<58)){
                                              c3 +=1;
                                            }

                                          }
                                          if( ar4.length < 8 || c1 == 0 || c2 == 0 ||c3 == 0){
                                                return 'Invalid password';
                                          }
                                          else if(value == ''){
                                            return 'Password cant be Empty';
                                          }

                                        },

                                      ),
                                      // if(isTap)
                                      //   FlutterPwValidator(
                                      //   // key: _globalKey,
                                      //   controller: _Controller,
                                      //   minLength: 8,
                                      //   uppercaseCharCount: 1,
                                      //   lowercaseCharCount: 1,
                                      //   numericCharCount: 1,
                                      //   specialCharCount: 1,
                                      //   normalCharCount: 1,
                                      //   width: 400,
                                      //   height: 200,
                                      //   defaultColor: Colors.grey,
                                      //   onSuccess: () {
                                      //     isMatch = true;
                                      //   },
                                      //   onFail: () {
                                      //      isMatch = false;
                                      //   },
                                      // ),

                                    ],

                                  ),


                                ),
                              ],
                            ),
                        ),
                
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (val){
                        setState(() {
                          if(isChecked == false) {
                            isChecked = true;
                          }
                          else{
                            isChecked = false;
                          }
                        });
                      },
                
                    ),
                    Column(
                      children: [
                        Text(
                          'By Creating Account i agree to the Terms ',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'and Conditions & Privacy Policy ',
                          softWrap: true,
                        ),
                      ],
                    ),
                        ],
                      ),
                      SizedBox(height: 20,),
                
                      SizedBox(
                        height: 60,
                        width: 330,
                        child: ElevatedButton(
                            onPressed: (){
                                 _globalKey.currentState!.validate();
                                 if( _globalKey.currentState!.validate() && isChecked){
                                   user.islogged = true;
                                   ref.read(userNotifierProvider.notifier)
                                   .addUser(user);
                                   Navigator.pushReplacementNamed(context, '/', arguments: {
                                     'isLog' : true,
                                   });                           }
                            },
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                SizedBox(width: 85,),
                                Icon(Icons.person_2,
                                color: Colors.white,
                                ),
                                Text(
                                  ' Signup',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                                    side: BorderSide(color: Colors.grey),
                
                          ),
                
                
                        ),
                        ),
                      SizedBox(height: 40,),
                      SizedBox(
                        height: 60,
                        width: 330,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, '/loginm');
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                SizedBox(width: 27,),
                                Icon(Icons.domain_verification,
                                  color: Colors.black,
                                ),
                                Text(
                                  ' Already have an Account?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            side: BorderSide(color: Colors.grey),
                
                          ),
                
                
                        ),
                      ),
                
                
                        ],
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }
}
