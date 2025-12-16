import 'package:flutter/material.dart';
import 'package:online_library/features/sing_in_page/presentation/signin_page.dart';
import 'package:online_library/features/sing_up_page/presentation/sing_up_page.dart';
import 'package:online_library/l10n/app_localizations.dart';
import 'package:online_library/widgets/style_button_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 238, 240, 1),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage('assets/images/tagamly_sozler001.png')),
              const SizedBox(
                height: 40,
              ),
              Text(AppLocalizations.of(context)!.helloWorld),
              const SizedBox(
                height: 20,
              ),
              Text(AppLocalizations.of(context)!.readWithOutLimits),
              const SizedBox(
                height: 30,
              ),
              StyleButtonWidget(
                buttonColor: const Color.fromRGBO(13, 57, 52, 1),
                buttonBorderColor: Colors.white,
                buttonName: AppLocalizations.of(context)!.logIn,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              StyleButtonWidget(
                buttonColor: Colors.white,
                buttonBorderColor: const Color.fromRGBO(13, 57, 52, 1),
                buttonName: AppLocalizations.of(context)!.createAccaunt,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SingUpPage()));
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
