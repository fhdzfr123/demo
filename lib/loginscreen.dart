import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool check = false;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_landing.png'),
                  fit: BoxFit.cover
              ),
            ),
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/map_dots.png'),
                        fit: BoxFit.fitWidth
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: height*0.1),
                    child: Image.asset('assets/images/line.png')),
                Padding(
                    padding: EdgeInsets.only(top: height*0.1,left: width*0.22),
                    child: Image.asset('assets/icons/ic_plane.png',width: width*0.22,)),
                Padding(
                    padding: EdgeInsets.only(top: height*0.25,left: width*0.2),
                    child: Image.asset('assets/images/logo_saib.png',width: width*0.6,)),
                Padding(
                  padding: EdgeInsets.only(top: height*0.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: height*0.03,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*0.15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'User Name',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade100)
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*0.15),
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.visibility,color: Colors.grey,),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 3,color: Colors.grey.shade100)
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*0.13),
                        child: Row(
                          children: [
                          Checkbox(
                              value: check,
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(Colors.transparent),
                              side: BorderSide(color: Colors.white),
                              onChanged: (v){
                                setState(() {
                                  check = !check;
                                });
                              },
                          ),
                          Text('Remember Me',style: TextStyle(color: Colors.white,fontSize: 12),)
                        ],),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))), primary: Colors.yellow),
                        child: Container(
                          width: width*0.6,
                          height: height*0.08,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 16,color: Colors.black),
                          ),
                        ),
                        onPressed: () {
                        },
                      ),
                      SizedBox(height: height*0.01,),
                      Text('Forgot Password',style: TextStyle(decoration: TextDecoration.underline,color: Colors.white,fontSize: 12),),
                      SizedBox(height: height*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account ',style: TextStyle(color: Colors.white,fontSize: 12),),
                          Text('Register',style: TextStyle(decoration: TextDecoration.underline,color: Colors.white,fontSize: 12),),
                        ],
                      ),
                      SizedBox(height: height*0.12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width*0.1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)
                            ),
                            child: Center(child: Image.asset('assets/icons/ic_aboutus.png',width: width*0.1,),),
                          ),
                          SizedBox(width: width*0.18,),
                          Container(
                            width: width*0.1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)
                            ),
                            child: Center(child: Image.asset('assets/icons/ic_locator.png',width: width*0.1,),),
                          ),
                          SizedBox(width: width*0.18,),
                          Container(
                            width: width*0.1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)
                            ),
                            child: Center(child: Image.asset('assets/icons/ic_phone.png',width: width*0.1,),),
                          ),
                        ],),
                      SizedBox(height: height*0.05,)
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
