import 'package:cv_builder/helpers/route_helper.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  final List<String> _titles = [    'Create a Professional CV',    'Choose a Template',    'Customize Your CV'  ];

  final List<String> _subtitles = [    'Easily create a professional CV with our easy-to-use CV builder',    'Choose from a range of stunning templates that will make your CV stand out',    'Customize your CV with your personal information, work history, and more'  ];

  final List<String> _imagePaths = [    'assets/images/test.jpeg',    'assets/images/test.jpeg',    'assets/images/test.jpeg'  ];

  void _nextPage() {
    _pageController.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void _skip() {
    Navigator.pushReplacementNamed(context, RouteHelper.homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 400,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _titles.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        _imagePaths[index],
                        height: 200,
                        width: 200,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        _titles[index],
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        _subtitles[index],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
                onPageChanged: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < _titles.length; i++)
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: _currentIndex == i
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _currentIndex == _titles.length - 1 ? _skip : _nextPage,
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                _currentIndex == _titles.length - 1 ? 'Get Started' : 'Next',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
