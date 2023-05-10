import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../routes/size_config.dart';
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Enjoy our distinguished services!",
      "image": "assets/images/splash_1.jpeg"
    },
    {
      "text":
          "We help people to make cv in unique way ",
      "image": "assets/images/cv2.jpeg"
    },
    {
      "text": "Welcome!",
      "image": "assets/images/cv3.jpeg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 2),
                    SizedBox(
                        width: double.infinity,
                        height: getProportionateScreenHeight(56),
                        child: Container(
                          child:ElevatedButton(
                            style: const ButtonStyle(
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)))),
                              backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepOrangeAccent),

                            ),
                            child: const Text('Continue',style: TextStyle(fontSize: 16) ),
                            onPressed: () {
                              // ...
                            },
                          ),
                        )),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 20),
      height: 6,
      width: currentPage == index ? 30 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
