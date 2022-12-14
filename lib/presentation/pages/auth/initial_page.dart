import 'package:flutter/material.dart';
import '../../../application/auth/service.dart';
import '../../../core/constants/theme_helper.dart';
import '../../widgets/header_widget.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  double headerHeight = 250;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: headerHeight,
          child: HeaderWidget(
            headerHeight,
            false,
            Icons.login_rounded,
          ), //let's create a common header widget
        ),
        SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            margin: const EdgeInsets.fromLTRB(
              20,
              10,
              20,
              10,
            ), // This will be the login form
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text(
                          "Register".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () {
                        AuthService.instance.add(OpenRegisterEvent());
                      },
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text(
                          'Sign In'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        AuthService.instance.add(OpenLoginEvent());
                        //After successful login we will redirect to profile page. Let's create profile page now
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
