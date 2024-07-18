import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tezda_assesment/core/config/app_config.dart';
import 'package:tezda_assesment/core/routes/app_pages.dart';
import 'package:tezda_assesment/modules/authentication/viewmodel/auth_viewmodel.dart';

class Login extends ConsumerWidget {
  static const routeName = "login";

  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authViewModel = ref.read(authViewModelProvider);

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Text(
                    style: GoogleFonts.majorMonoDisplay(fontSize: 35),
                    AppConfig.appName,
                  ),
                  const SizedBox(height: 120),
                  const CircleAvatar(radius: 60),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: "Enter your email",
                      prefixIcon: const Icon(Icons.email, size: 20),
                      hintStyle: GoogleFonts.poppins(fontSize: 12),
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please input a value';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: "Enter your password",
                      prefixIcon: const Icon(Icons.lock, size: 20),
                      hintStyle: GoogleFonts.poppins(fontSize: 12),
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: InkWell(
                      onTap: () {
                        authViewModel.login(
                          context,
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.deepPurple[400],
                        ),
                        child: Center(
                          child: Text(
                            "Log In",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    child: Text(
                      "Don't have Account? Register",
                      style: GoogleFonts.poppins(),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, register);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
