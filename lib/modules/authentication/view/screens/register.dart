import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tezda_assesment/core/config/app_config.dart';
import 'package:tezda_assesment/core/utils/extensions.dart';
import 'package:tezda_assesment/modules/authentication/viewmodel/auth_viewmodel.dart';

class Register extends ConsumerWidget {
  static const routeName = "register";

  const Register({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authViewModel = ref.read(authViewModelProvider);

    final usernameController = TextEditingController();
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
                  const SizedBox(height: 90),
                  Text("Create a new Account", style: GoogleFonts.poppins(fontSize: 20)),
                  const SizedBox(height: 20),
                  const CircleAvatar(radius: 60),
                  const SizedBox(height: 20),
                  TextField(
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: "Enter your Full name",
                      prefixIcon: const Icon(Icons.person_2, size: 20),
                      hintStyle: GoogleFonts.poppins(fontSize: 12),
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    validator: (val) {
                      if (!val!.isValidEmail) {
                        return 'Please input a valid email';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    validator: (val) {
                      if (!val!.isValidPassword) {
                        return 'Password must be greater than 6';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
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
                        authViewModel.register(
                          context,
                          usernameController.text,
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
                            "Register",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
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
