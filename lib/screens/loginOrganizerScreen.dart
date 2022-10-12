import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../users.dart';

class LoginOrganizerScreen extends StatefulWidget {
  const LoginOrganizerScreen({Key? key}) : super(key: key);
  @override
  _LoginOrganizerScreenState createState() => _LoginOrganizerScreenState();
}

class _LoginOrganizerScreenState extends State<LoginOrganizerScreen> {
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(data.name)) {
        return 'User not exists';
      }
      if (mockUsers[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  Future<String?> _signupConfirm(String error, LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[50],
        resizeToAvoidBottomInset: false,
        body: FlutterLogin(
          title: Constants.orgName,
          logo: const AssetImage('assets/images/ecorp.png'),
          logoTag: Constants.logoTag,
          titleTag: Constants.titleTag,
          navigateBackAfterRecovery: true,
          onConfirmRecover: _signupConfirm,
          onConfirmSignup: _signupConfirm,
          loginAfterSignUp: false,
          termsOfService: [
            TermOfService(
                id: 'newsletter',
                mandatory: false,
                text: 'Newsletter subscription'),
            TermOfService(
                id: 'general-term',
                mandatory: true,
                text: 'Term of services',
                linkUrl: 'https://github.com/NearHuscarl/flutter_login'),
          ],
          additionalSignupFields: [
            const UserFormField(
                keyName: 'Username', icon: Icon(FontAwesomeIcons.userLarge)),
            const UserFormField(keyName: 'Name'),
            const UserFormField(keyName: 'Surname'),
            UserFormField(
              keyName: 'phone_number',
              displayName: 'Phone Number',
              userType: LoginUserType.phone,
              fieldValidator: (value) {
                var phoneRegExp = RegExp(
                    '^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}\$');
                if (value != null &&
                    value.length < 7 &&
                    !phoneRegExp.hasMatch(value)) {
                  return "This isn't a valid phone number";
                }
                return null;
              },
            ),
          ],
          userValidator: (value) {
            if (!value!.contains('@') || !value.endsWith('.com')) {
              return "Email must contain '@' and end with '.com'";
            }
            return null;
          },
          passwordValidator: (value) {
            if (value!.isEmpty) {
              return 'Password is empty';
            }
            return null;
          },
          showDebugButtons: false,
          onLogin: (loginData) {
            debugPrint('Login info');
            debugPrint('Name: ${loginData.name}');
            debugPrint('Password: ${loginData.password}');
            Navigator.of(context).pushNamed('/orgMain');
            //return _loginUser(loginData);
          },
          initialAuthMode: AuthMode.login,
          onRecoverPassword: (name) {
            debugPrint('Recover password info');
            debugPrint('Name: $name');
            return _recoverPassword(name);
            // Show new password dialog
          },
        ));
  }
}
