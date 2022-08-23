import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/application/auth/service.dart';
import 'package:flutter_shop/core/constants/header_widget.dart';
import 'package:flutter_shop/core/constants/theme_helper.dart';
import 'package:flutter_shop/core/l10n.dart';
import 'package:flutter_shop/presentation/dialogs/error_snackbar.dart';
import 'package:flutter_shop/domain/form/register_form.dart';

class RegistrationPage extends StatefulWidget {
  final RegisterForm? form;
  final Map<String, List<String>>? errors;
  const RegistrationPage({Key? key, this.form, this.errors}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  List<String> errors = [];

  bool validate() {
    final formKey = _formKey.currentState;
    return formKey!.validate();
  }

  void submit() {
    if (validate()) {
      AuthService().add(RegisterEvent(
        form: RegisterForm(
          firstName: nameController.text,
          lastName: surnameController.text,
          phone: int.parse(phoneController.text),
          email: emailController.text,
          address: addressController.text,
        ),
      ));
    }
  }

  @override
  void initState() {
    nameController.text = widget.form?.firstName ?? '';
    surnameController.text = widget.form?.lastName ?? '';
    phoneController.text = widget.form?.phone.toString() ?? '';
    emailController.text = widget.form?.email ?? '';
    addressController.text = widget.form?.address ?? '';
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (widget.errors != null) {
      for (var key in widget.errors!.keys) {
        if ([
          'firstname',
          'lastname',
          'phone',
          'email',
          'address',
        ].contains(key)) {
          errors.addAll(widget.errors![key]!.toList());
        }
      }
    }
    if (errors.isNotEmpty) {
      Future(() {
        errorSnackBar(context, errors);
      });
    }
    super.didChangeDependencies();
  }

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
                          controller: nameController,
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          decoration: ThemeHelper().textInputDecoration(
                            lableText: 'First Name',
                            hintText: 'Enter your first name',
                            errorText: widget.errors?['firstname']
                                ?.map((e) => e.trs)
                                .toList()
                                .join(', '),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                          controller: surnameController,
                          textInputAction: TextInputAction.next,
                          decoration: ThemeHelper().textInputDecoration(
                            lableText: 'Last Name',
                            hintText: 'Enter your last name',
                            errorText: widget.errors?['lastname']
                                ?.map((e) => e.trs)
                                .toList()
                                .join(', '),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          decoration: ThemeHelper().textInputDecoration(
                            lableText: "E-mail address",
                            hintText: "Enter your email",
                            errorText: widget.errors?['email']
                                ?.map((e) => e.trs)
                                .toList()
                                .join(', '),
                          ),
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
                          controller: phoneController,
                          textInputAction: TextInputAction.next,
                          decoration: ThemeHelper().textInputDecoration(
                            lableText: "Mobile Number",
                            hintText: "Enter your mobile number",
                            errorText: widget.errors?['phone']
                                ?.map((e) => e.trs)
                                .toList()
                                .join(', '),
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))
                          ],
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
                          controller: addressController,
                          textInputAction: TextInputAction.done,
                          decoration: ThemeHelper().textInputDecoration(
                            lableText: "Address",
                            hintText: "Enter your address",
                            errorText: widget.errors?['address']
                                ?.map((e) => e.trs)
                                .toList()
                                .join(', '),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your address";
                            }
                            return null;
                          },
                          onFieldSubmitted: (String text) {
                            submit();
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
                            submit();
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
                                    AuthService.instance.add(OpenLoginEvent());
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
        ],
      ),
    );
  }
}
