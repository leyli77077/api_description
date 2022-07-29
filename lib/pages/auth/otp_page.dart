import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/application/auth.dart';
import 'package:flutter_shop/constants/theme_helper.dart';
import 'package:flutter_shop/core/l10n.dart';
import 'package:flutter_shop/dialogs/error_snackbar.dart';
import 'package:flutter_shop/models/form/otp_form.dart';
import 'package:flutter_shop/widgets/header_widget.dart';

class OtpPage extends StatefulWidget {
  final OtpForm form;
  final String? error;
  const OtpPage({
    Key? key,
    required this.form,
    this.error,
  }) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  double headerHeight = 150;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController();

  bool validate() {
    final formKey = _formKey.currentState;
    return formKey!.validate();
  }

  void submit() {
    if (validate()) {
      Auth().add(WithOtpEvent(
        phone: widget.form.phone,
        otp: int.parse(textController.text),
        rememberMe: true,
      ));
    }
  }

  @override
  void initState() {
    textController.text =
        widget.form.otp != null ? widget.form.otp.toString() : '';
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (widget.error != null) {
      Future(() {
        errorSnackBar(context, [widget.error!.trs]);
      });
    }
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
                    'We send you one time password enter it to signin',
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
                            controller: textController,
                            autofocus: true,
                            textInputAction: TextInputAction.done,
                            decoration: ThemeHelper().textInputDecoration(
                              lableText: "OTP",
                              hintText: "Enter one time password",
                              errorText: widget.error?.trs,
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"))
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'otp_is_required'.trs;
                              } else if (value.length != 5) {
                                return 'otp_number_length'.trs;
                              } else {
                                return null;
                              }
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
                                'Sign In'.toUpperCase(),
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
