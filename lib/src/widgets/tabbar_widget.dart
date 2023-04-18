import 'package:flutter/material.dart';
import 'package:alerts_app/constants.dart';

class TabBarAuthWidget extends StatelessWidget {
  const TabBarAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelPadding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            indicatorColor: const Color(0xff4842ff),
            indicatorWeight: 2.0,
            tabs: const [
              Tab(text: 'Sign In'),
              Tab(text: 'Sign Up'),
            ],
          ),

          Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                        child: TextFormField(
                          obscureText: false,
                          decoration: authFormFieldStyle().copyWith(
                            labelText: 'Email Address',
                            hintText: 'Enter your email...',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                            labelText: 'Email Address',
                            hintText: 'Enter your email...',
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your email...',
                            prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}