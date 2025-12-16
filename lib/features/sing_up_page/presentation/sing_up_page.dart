import 'package:flutter/material.dart';
import 'package:online_library/features/sing_in_page/presentation/signin_page.dart';
import 'package:online_library/l10n/app_localizations.dart';
import 'package:online_library/tools/colors/onlinelibrary_colors.dart';
import 'package:online_library/widgets/phone_number_text_field.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final phoneNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorWhite,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage('assets/images/tagamly_sozler001.png')),
                const SizedBox(height: 20),
                PhoneNumberTextField(
                  phoneNumberController: phoneNameController,
                  label: 'Phone number',
                ),
                const SizedBox(
                  height: 30,
                ),
                // StyleButtonWidget(
                //   buttonColor: AppColors.mainColor,
                //   buttonBorderColor: AppColors.mainWhite,
                //   buttonTextColor: AppColors.mainWhite,
                //   buttonName: AppLocalizations.of(context)!.singUp,
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const GetTokenPage()));
                //   },
                // ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.alreadyHaveAccaunt),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.logInHere,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
