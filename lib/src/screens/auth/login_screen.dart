import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:alerts_app/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      color: Colors.green[100],
                    ),
                  ),
                  
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 40.0,
                          sigmaY: 40.0,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text("Sign In", style: loginTitleStyle()),
                              Text("Bienvenidos a Alert App", style: loginTitleStyle().copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              )),

                              SizedBox(height: MediaQuery.of(context).size.height * 0.20),
                              Text("Bienvenido de vuelta", style: loginTitleStyle().copyWith(
                                fontSize: 26,
                              )),

                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: TextField(
                                  decoration: authFormFieldStyle().copyWith(
                                    labelText: 'Email Address',
                                    hintText: 'Enter your email...',
                                    prefixIcon: const Icon(Icons.email_outlined),
                                  ),
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: TextField(
                                  decoration: authFormFieldStyle().copyWith(
                                    labelText: 'Password',
                                    hintText: 'Enter your password...',
                                    prefixIcon: const Icon(Icons.lock_outline),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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