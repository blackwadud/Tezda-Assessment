import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tezda_assesment/core/config/app_config.dart';
import 'package:tezda_assesment/modules/authentication/viewmodel/auth_viewmodel.dart';

class SplashScreen extends ConsumerWidget {
  static const routeName = "splashscreen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final authViewModel = ref.read(authViewModelProvider); 
    authViewModel.currentUser(context);
    return Scaffold(
      body: Center(
        child: Bounce(
          child: Text(
            style: GoogleFonts.majorMonoDisplay(
              fontSize: 35,
            ),
            AppConfig.appName,
          ),
        ),
      ),
    );
  }
}
