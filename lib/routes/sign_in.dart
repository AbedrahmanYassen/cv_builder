//import 'package:final_ahmed/pages/messages.dart';
import 'package:cv_builder/helpers/route_helper.dart';
import 'package:cv_builder/routes/home.dart';
import 'package:flutter/material.dart';

import '../splash/splash_screen.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dark_sign_in.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
              top: 90,
              left: 40,
              child: Text(
                "Sign in",
                style: TextStyle(color: Colors.white, fontSize: 26),
              )),
          Positioned(
            top: 200,
            left: 40,
            child: Column(
              children: [
                Container(
                    width: 300,
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Color(0xff646781)),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 22),
                    width: 300,
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Color(0xff646781)),
                      ),
                    )),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 22),
                    decoration: const BoxDecoration(
                      color: Color(0xffEC6454),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    width: 300,
                    height: 48,
                    child: const Center(
                      child: Text(
                        'Login  ',
                        textScaleFactor: 1,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 450,
            left: 50,
            child: Text(
              "Forget Password?",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          Positioned(
            top: 470,
            left: 50,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  RouteHelper.manageRoute(
                    const RouteSettings(name: RouteHelper.signUp),
                  ),
                );
              },
              child: const Text(
                "You don't have an account? click here",
                style: TextStyle(color: Colors.orange, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
