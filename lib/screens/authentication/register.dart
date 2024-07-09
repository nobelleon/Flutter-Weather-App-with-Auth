import 'package:d_button/d_button.dart';
import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/splash/splash_screen.dart';

import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../../config/app_constants.dart';
import '../../view/home/beranda.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String username;
  late String email;
  late String password;

  final TextEditingController edtUsername = TextEditingController();
  final TextEditingController edtEmail = TextEditingController();
  final TextEditingController edtPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //------------------
          // Image Background
          //------------------
          Image.asset(
            AppAssets.bgAuth,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black54,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Column(
                    children: [
                      //-------------
                      // Weather App
                      //-------------
                      Text(
                        AppConstants.appName,
                        style: GoogleFonts.poppins(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color:
                              Colors.white, //Color.fromARGB(255, 88, 231, 98),
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        //----------
                        // Username
                        //----------
                        child: Row(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Material(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            DView.spaceWidth(10),
                            Expanded(
                              child: DInput(
                                controller: edtUsername,
                                fillColor: Colors.white70,
                                radius: BorderRadius.circular(10),
                                hint: 'Username',
                                validator: (input) {
                                  return input == '' ? "Don't empty" : null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      DView.spaceHeight(
                        16,
                      ),
                      IntrinsicHeight(
                        //----------
                        // Email
                        //----------
                        child: Row(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Material(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                child: const Icon(
                                  Icons.email,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            DView.spaceWidth(10),
                            Expanded(
                              child: DInput(
                                controller: edtEmail,
                                fillColor: Colors.white70,
                                radius: BorderRadius.circular(10),
                                hint: 'Email',
                                validator: (input) {
                                  return input == '' ? "Don't empty" : null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      DView.spaceHeight(
                        16,
                      ),
                      IntrinsicHeight(
                        //----------
                        // Password
                        //----------
                        child: Row(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Material(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                child: const Icon(
                                  Icons.key,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            DView.spaceWidth(10),
                            Expanded(
                              child: DInputPassword(
                                controller: edtPassword,
                                fillColor: Colors.white70,
                                radius: BorderRadius.circular(10),
                                hint: 'Password',
                                validator: (input) {
                                  return input == '' ? "Don't empty" : null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      DView.spaceHeight(
                        16,
                      ),
                      IntrinsicHeight(
                        //----------------------
                        // Button Log & Register
                        //-----------------------
                        child: Row(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: DButtonFlat(
                                onClick: () {
                                  Navigator.pop(context);
                                },
                                padding: const EdgeInsets.all(0),
                                radius: 10,
                                mainColor: Colors.white70,
                                child: const Text(
                                  'LOG',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DView.spaceWidth(10),
                            Expanded(
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  alignment: Alignment.centerLeft,
                                ),
                                child: const Text(
                                  "Register",
                                ),
                                onPressed: () {
                                  // _register();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      DView.spaceHeight(
                        16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
