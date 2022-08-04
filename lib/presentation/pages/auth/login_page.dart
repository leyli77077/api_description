import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/application/auth.dart';
import 'package:flutter_shop/core/constants/theme_helper.dart';
import 'package:flutter_shop/core/l10n.dart';
import 'package:flutter_shop/presentation/dialogs/error_snackbar.dart';
import 'package:flutter_shop/domain/form/login_form.dart';
import 'package:flutter_shop/presentation/widgets/header_widget.dart';

class LoginPage extends StatefulWidget {
  final LoginForm? form;
  final String? error;
  final String? time;
  const LoginPage({
    Key? key,
    this.form,
    this.error,
    this.time,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double headerHeight = 150;
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  String? error;

  bool validate() {
    final formKey = _formKey.currentState;
    return formKey!.validate();
  }

  void submit() {
    if (validate()) {
      Auth().add(LoginEvent(
        form: LoginForm(
          phone: int.parse(phoneController.text),
        ),
      ));
    }
  }

  @override
  void initState() {
    phoneController.text = widget.form?.phone.toString() ?? '';
    if (widget.error != null) {
      try {
        error =
            '${widget.time} s. ${jsonDecode(widget.error!)['error'].toString().trs}';
      } catch (e) {
        error = widget.error.toString().trs;
      }
    } else {
      error = null;
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future(() {
      if (error != null) {
        Future(() {
          errorSnackBar(context, [error!.trs]);
        });
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
              child: Column(
                children: [
                  const Text(
                    'Signin into your account',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: phoneController,
                            autofocus: true,
                            textInputAction: TextInputAction.done,
                            decoration: ThemeHelper().textInputDecoration(
                              lableText: "Mobile Number",
                              hintText: "Enter your mobile number",
                              errorText: error?.trs,
                            ),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"))
                            ],
                            validator: (val) {
                              if (val!.isNotEmpty &&
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                            onFieldSubmitted: (text) {
                              submit();
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                'Get otp'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              submit();
                              //After successful login we will redirect to profile page. Let's create profile page now
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          //child: Text('Don\'t have an account? Create'),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                    text: 'Don\'t have an account? '),
                                TextSpan(
                                  text: 'Create',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Auth.instance.add(OpenRegisterEvent());
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         const RegistrationPage(),
                                      //   ),
                                      // );
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
