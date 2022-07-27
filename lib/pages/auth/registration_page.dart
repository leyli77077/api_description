import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/application/auth.dart';
import 'package:flutter_shop/constants/header_widget.dart';
import 'package:flutter_shop/constants/theme_helper.dart';
import 'profile_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          const SizedBox(
            height: 150,
            child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            alignment: Alignment.center,
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 120,
                      ),
                      Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                          decoration: ThemeHelper().textInputDecoration(
                              'First Name', 'Enter your first name'),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                          decoration: ThemeHelper().textInputDecoration(
                              'Last Name', 'Enter your last name'),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                          decoration: ThemeHelper().textInputDecoration(
                              "E-mail address", "Enter your email"),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val!.isNotEmpty &&
                                !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                    .hasMatch(val)) {
                              return "Enter a valid email address";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                          decoration: ThemeHelper().textInputDecoration(
                              "Mobile Number", "Enter your mobile number"),
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            if (val!.isNotEmpty &&
                                !RegExp(r"^(\d+)*$").hasMatch(val)) {
                              return "Enter a valid phone number";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                          decoration: ThemeHelper().textInputDecoration(
                              "Address", "Enter your address"),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your address";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
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
                            if (_formKey.currentState!.validate()) {
                              // Navigator.of(context).pushAndRemoveUntil(
                              //   MaterialPageRoute(
                              //       builder: (context) => const ProfilePage()),
                              //   (Route<dynamic> route) => false,
                              // );
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        //child: Text('Don\'t have an account? Create'),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: 'Do you have an account? '),
                              TextSpan(
                                text: 'Login',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Auth.instance.add(OpenLoginEvent());
                                  },
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      // const Text(
                      //   "Or create account using social media",
                      //   style: TextStyle(color: Colors.grey),
                      // ),
                      // const SizedBox(height: 25.0),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     GestureDetector(
                      //       child: FaIcon(
                      //         FontAwesomeIcons.googlePlus,
                      //         size: 35,
                      //         color: HexColor("#EC2D2F"),
                      //       ),
                      //       onTap: () {
                      //         setState(() {
                      //           showDialog(
                      //             context: context,
                      //             builder: (BuildContext context) {
                      //               return ThemeHelper().alartDialog(
                      //                   "Google Plus",
                      //                   "You tap on GooglePlus social icon.",
                      //                   context);
                      //             },
                      //           );
                      //         });
                      //       },
                      //     ),
                      //     const SizedBox(
                      //       width: 30.0,
                      //     ),
                      //     GestureDetector(
                      //       child: Container(
                      //         padding: const EdgeInsets.all(0),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(100),
                      //           border: Border.all(
                      //               width: 5, color: HexColor("#40ABF0")),
                      //           color: HexColor("#40ABF0"),
                      //         ),
                      //         child: FaIcon(
                      //           FontAwesomeIcons.twitter,
                      //           size: 23,
                      //           color: HexColor("#FFFFFF"),
                      //         ),
                      //       ),
                      //       onTap: () {
                      //         setState(() {
                      //           showDialog(
                      //             context: context,
                      //             builder: (BuildContext context) {
                      //               return ThemeHelper().alartDialog(
                      //                   "Twitter",
                      //                   "You tap on Twitter social icon.",
                      //                   context);
                      //             },
                      //           );
                      //         });
                      //       },
                      //     ),
                      //     const SizedBox(
                      //       width: 30.0,
                      //     ),
                      //     GestureDetector(
                      //       child: FaIcon(
                      //         FontAwesomeIcons.facebook,
                      //         size: 35,
                      //         color: HexColor("#3E529C"),
                      //       ),
                      //       onTap: () {
                      //         setState(
                      //           () {
                      //             showDialog(
                      //               context: context,
                      //               builder: (BuildContext context) {
                      //                 return ThemeHelper().alartDialog(
                      //                     "Facebook",
                      //                     "You tap on Facebook social icon.",
                      //                     context);
                      //               },
                      //             );
                      //           },
                      //         );
                      //       },
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
