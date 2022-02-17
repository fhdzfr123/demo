import 'package:demo/loginscreen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
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
            Padding(
                padding: EdgeInsets.only(top: height*0.22,left: width*0.78),
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Text('AR',style: TextStyle(color: Colors.black,fontSize: 15),)
                )),
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
              padding: EdgeInsets.only(top: height*0.15),
                child: Image.asset('assets/images/line.png')),
            Padding(
                padding: EdgeInsets.only(top: height*0.15,left: width*0.22),
                child: Image.asset('assets/icons/ic_plane.png',width: width*0.22,)),
            Padding(
                padding: EdgeInsets.only(top: height*0.35,left: width*0.2),
                child: Image.asset('assets/images/logo_saib.png',width: width*0.6,)),
            Padding(
              padding: EdgeInsets.only(top: height*0.45),
              child: Column(
                children: [
                  Text('Welcome',style: TextStyle(color: Colors.white,fontSize: 12),),
                  SizedBox(height: height*0.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                primary: Colors.transparent,
                                side: BorderSide(width: 1.0, color: Colors.white,)),
                            child: Center(child: Image.asset('assets/icons/ic_aboutus.png',width: width*0.1,),),
                        ),
                        Text('About US',style: TextStyle(color: Colors.white,fontSize: 12),)
                    ],),
                      SizedBox(width: width*0.18,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                primary: Colors.transparent,
                                side: BorderSide(width: 1.0, color: Colors.white,)),
                            child: Center(child: Image.asset('assets/icons/ic_locator.png',width: width*0.1,),),
                          ),
                          Text('ATM Locator',style: TextStyle(color: Colors.white,fontSize: 12),)
                        ],),
                      SizedBox(width: width*0.18,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                primary: Colors.transparent,
                                side: BorderSide(width: 1.0, color: Colors.white,)),
                            child: Center(child: Image.asset('assets/icons/ic_phone.png',width: width*0.1,),),
                          ),
                          Text('Contact US',style: TextStyle(color: Colors.white,fontSize: 12),)
                        ],),
                  ],),
                  SizedBox(
                    height: height*0.1,
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                    },
                  ),
                  SizedBox(height: height*0.02,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))), primary: Colors.yellow),
                    child: Container(
                      width: width*0.6,
                      height: height*0.08,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 16,color: Colors.black),
                      ),
                    ),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
