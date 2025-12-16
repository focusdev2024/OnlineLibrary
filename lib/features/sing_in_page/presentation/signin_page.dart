import 'package:flutter/material.dart';
import 'package:online_library/features/sing_up_page/presentation/sing_up_page.dart';
import 'package:online_library/l10n/app_localizations.dart';
import 'package:online_library/tools/colors/onlinelibrary_colors.dart';
//import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
//import 'dart:convert';

import '../../../widgets/password_text_field.dart';
import '../../../widgets/phone_number_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //bool _isLoading = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Future<void> _login() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   final String phoneNumber =
  //       _phoneNumberController.text.trim().replaceAll(' ', '');
  //   final String password = _passwordController.text.trim();

  //   final url = 'http://127.0.0.1:8000/login/'; // Replace with your backend URL

  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(<String, String>{
  //         'phone_number': '993' + phoneNumber,
  //         'password': password,
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       // Successfully logged  in
  //       // Navigate to next screen or do whatever you need
  //       final responseData = jsonDecode(response.body);
  //       var refresh = responseData['refresh'];
  //       var access = responseData['access'];
  //       prefs.setString('refresh', refresh);
  //       prefs.setString('access', access);
  //       print(refresh);
  //       print(access);
  //     } else {
  //       // Handle error
  //       // You can show error message to the user
  //       print('Failed to login: ${response.body}');
  //     }
  //   } catch (e) {
  //     // Handle network error
  //     print('Network error: $e');
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorWhite,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage('assets/images/tagamly_sozler001.png')),
              const SizedBox(height: 30),
              PhoneNumberTextField(
                phoneNumberController: _phoneNumberController,
                label: 'Phone number',
              ),
              const SizedBox(height: 10),
              PasswordTextField(passwordController: _passwordController),
              const SizedBox(height: 30),
              // StyleButtonWidget(
              //   buttonColor: AppColors.mainColor,
              //   buttonBorderColor: AppColors.mainWhite,
              //   buttonTextColor: AppColors.mainWhite,
              //   buttonName: AppLocalizations.of(context)!.logIn,
              //   onTap: () {
              //     _login();
              //   },
              // ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.dontHaveAccaunt),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SingUpPage()));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.singUpHere,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
