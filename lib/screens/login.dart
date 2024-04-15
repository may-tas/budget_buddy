import 'package:budget_buddy/screens/sign_up.dart';
import 'package:budget_buddy/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isLoading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  var authService = AuthService();

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      var data = {'email': _email.text, 'password': _password.text};
      authService.signInWithEmailAndPassword(data, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        title: Text(
          "Budget Buddy",
          style: GoogleFonts.sourceSans3(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //PiggyLogo
                Image.asset(
                  'assets/images/logo.png',
                  height: 250,
                  scale: 0.01,
                  fit: BoxFit.fill,
                ),

                Text(
                  "Hey ! Log In ",
                  style: GoogleFonts.sourceSans3(
                      color: const Color.fromARGB(255, 0, 109, 51),
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: GoogleFonts.sourceSans3(
                        color: Colors.black, fontSize: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    suffixIcon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: hidePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: GoogleFonts.sourceSans3(
                        color: Colors.black, fontSize: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: Icon(hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    _submit();
                  },
                  style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(const Size.fromHeight(50)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 167, 241, 110))),
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          "Log In",
                          style: GoogleFonts.sourceSans3(
                              color: const Color.fromARGB(255, 0, 109, 61),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MySignUp()),
                    );
                  },
                  style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(const Size.fromHeight(50)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 167, 241, 110))),
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          "Sign Up",
                          style: GoogleFonts.sourceSans3(
                              color: const Color.fromARGB(255, 0, 109, 61),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
