import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tezda_assesment/modules/authentication/viewmodel/auth_viewmodel.dart';

class ProfileScreen extends ConsumerWidget {
  static const routeName = "profilepage";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(authViewModelProvider);

    // Assuming you have a user object in your AuthViewModel
    final user = authViewModel.user;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Profile",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user?.avatar ?? ''),
              ),
            ),
            ListTile(
              title: Text(
                user?.name ?? '', // Replace with actual user data
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                user?.email ?? '', // Replace with actual user data
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.only(left: 20, right: 20),
                      title: Text(
                        user?.role ?? '',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                    title: Text(
                      user?.id.toString() ?? '',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                    title: Text(
                      user?.email ?? '',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
