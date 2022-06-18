import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _bioController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/svgs/ic_instagram.svg',
                color: primaryColor,
                height: 64.0,
              ),
              const SizedBox(
                height: 48.0,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1655374631048-1416d81cd20a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=498&q=80'),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              CustomTextField(
                controller: _usernameController,
                hintText: 'Enter your username',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 16.0,
              ),
              CustomTextField(
                controller: _emailController,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16.0,
              ),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
                isObscured: true,
              ),
              const SizedBox(
                height: 16.0,
              ),
              CustomTextField(
                controller: _bioController,
                hintText: 'Enter your biography',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 24.0,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: const Text(
                    'Register',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  width: 150.0,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF7E38AF),
                        Color(0xFFF70207),
                        Color(0xFFF7C601),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(
                    width: 4.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}