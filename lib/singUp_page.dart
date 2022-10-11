import 'dart:ui';

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool animationBegin = true;
  double leftMove = 0.0;
  double rightMove = 0.0;
  Color color = Colors.red;
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  label: const Text("Name"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: const Text("Email"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: password,
                onChanged: (value) {
                  if (value.length > 8) {
                    setState(() {
                      color = Colors.green;
                      animationBegin = false;
                      leftMove = 0.0;
                      rightMove = 0.0;
                    });
                  } else {
                    setState(() {
                      color = Colors.red;
                      animationBegin = true;
                    });
                  }
                },
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  label: const Text("Password"),
                  labelStyle: TextStyle(
                    color: Colors.black.withOpacity(.60)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: color,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: color,
                    ),
                  )
                ),
              ),
              const SizedBox(height: 10),
              AnimatedContainer(
                height: 100,
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.only(
                  left: leftMove,
                  right: rightMove,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Material(
                    color: color,
                    child: InkWell(
                      splashColor:color.withOpacity(.5),
                      onTap: _onclick,
                      child: Container(
                        height: 40,
                        width: 100,
                        child: const Center(
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onHover: (val) {
                        setState(() {
                          if (leftMove == 0 && animationBegin) {
                            Future.delayed(
                              const Duration(milliseconds: 300),
                                  () {
                                leftMove = 150;
                                rightMove = 0;
                                print("left:");
                              },
                            );
                          }
                          if (leftMove == 150 && animationBegin) {
                            Future.delayed(
                              const Duration(milliseconds: 300),
                                  () {
                                print("right:");
                                rightMove = 150;
                                leftMove = 0;
                              },
                            );
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onclick() {
    setState(() {
      if (leftMove == 0 && animationBegin) {
        leftMove = 150;
        rightMove = 0;
        print("left:");
      }
      if (leftMove == 150 && animationBegin) {
        print("right:");
        rightMove = 150;
        leftMove = 0;
      }
    });
  }
}
