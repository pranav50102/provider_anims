import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';


class Loginm extends StatefulWidget {
  const Loginm({super.key});

  @override
  State<Loginm> createState() => _LoginmState();
}

class _LoginmState extends State<Loginm> {
  final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                            '  Login',
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
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.key),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                    hintText: 'Enter Password',
                                  ),

                                  validator: (value){
                                     if(value == ''){
                                      return 'Password cant be Empty';
                                    }
                                  },

                                ),

                              ],

                            ),


                          ),
                        ],
                      ),
                    ),


                    SizedBox(height: 20,),

                    SizedBox(
                      height: 60,
                      width: 330,
                      child: ElevatedButton(
                        onPressed: (){
                          _globalKey.currentState!.validate();
                          if(_globalKey.currentState!.validate()){

                          }
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
                                ' Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
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
                          Navigator.pushReplacementNamed(context, '/login');
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
                                ' Dont have an Account?',
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
