import 'package:flutter/material.dart';
import '../../../application/auth/service.dart';
import 'initial_page.dart';
import 'login_page.dart';
import 'otp_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';
import 'package:provider/provider.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => PersonalPageState();
}

class PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height,
      child: Selector<AuthService, AuthState>(
        selector: (_, auth) => auth.state,
        builder: (_, state, __) {
          if (state is NotVerifiedState) {
            return const InitialPage();
          } else if (state is LoginFormState) {
            return LoginPage(
              error: state.error,
              form: state.form,
              time: state.time,
            );
          } else if (state is RegisterFormState) {
            return RegistrationPage(
              errors: state.errors,
              form: state.form,
            );
          } else if (state is VerifiedState) {
            return ProfilePage(
              state: state,
            );
          } else if (state is OtpFormState) {
            return OtpPage(
              form: state.form,
              error: state.error,
            );
          } else if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const InitialPage();
        },
      ),
    );
  }
}
