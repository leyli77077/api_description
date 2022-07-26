import 'package:flutter/material.dart';
import 'package:flutter_shop/application/auth.dart';
import 'package:flutter_shop/pages/auth/registration_page.dart';
import 'package:provider/provider.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => PersonalPageState();
}

class PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Selector<Auth, AuthState>(
      selector: (_, auth) => auth.state,
      builder: (_, state, __) {
        return const RegistrationPage();
      },
    );
  }
}
