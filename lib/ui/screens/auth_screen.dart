import 'package:bloc_final/bloc/confirm_bloc/confirm_bloc.dart';
import 'package:bloc_final/ui/colors/app_colors.dart';
import 'package:bloc_final/ui/fonts/app_fonts.dart';
import 'package:bloc_final/ui/widgets/custom_button.dart';
import 'package:bloc_final/ui/widgets/custom_textfield.dart';
import 'package:bloc_final/ui/widgets/gradient_background.dart';
import 'package:bloc_final/ui/widgets/gradient_circle.dart';
import 'package:bloc_final/ui/widgets/gradient_foreground.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const GradientBackground(),
          Positioned(
            top: MediaQuery.of(context).size.height / 10,
            child: const GradientCircle(size: 215),
          ),
          Positioned(
            right: 0,
            bottom: MediaQuery.of(context).size.height / 10,
            child: const GradientCircle(size: 287),
          ),
          Center(
            child: GradientForeground(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: AppFonts.w600s25.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  CustomTextField(
                    controller: controller,
                    title: 'Code',
                  ),
                  BlocListener<ConfirmBloc, ConfirmState>(
                    listener: (context, state) {
                      if (state is ConfirmSuccess) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(state.model.message ?? ''),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.remove),
                              ),
                            ],
                          ),
                        );
                      }
                      if (state is ConfirmSuccess) {
                        showBottomSheet(
                          context: context,
                          builder: (context) => SizedBox(
                            width: double.infinity,
                            height: 500,
                            child: Column(
                              children: [
                                Text(state.model.message ?? ''),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    child: CustomButton(
                      title: 'Authenticate',
                      onPressed: () {
                        BlocProvider.of<ConfirmBloc>(context).add(
                          ConfirmCodeEvent(code: controller.text),
                        );
                      },
                    ),
                  ),
                  RichText(
                    textScaleFactor: 1,
                    text: TextSpan(
                      text: 'Are you a new user? ',
                      style: AppFonts.w600s15,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          style: AppFonts.w600s15.copyWith(
                            color: AppColors.secondary,
                          ),
                          onEnter: (event) {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
