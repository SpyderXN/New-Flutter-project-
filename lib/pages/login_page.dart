import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).colorScheme.background,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login_image.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Enter Username", labelText: "Username"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password should be at least 6";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          moveToHome(context);
                        },
                        style: TextButton.styleFrom(
                            minimumSize: const Size(150, 40),
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
