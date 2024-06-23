import 'package:fantasy_football/service/flutter_toast.dart';
import 'package:fantasy_football/ui/main/home/home_page.dart';
import 'package:fantasy_football/ui/main/login/login_cubit.dart';
import 'package:fantasy_football/ui/main/login/login_state.dart';
import 'package:fantasy_football/ui/main/login/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

//  void login() async {
//     String email = _emailController.text.toString().trim();
//     String password = _passwordController.text.toString().trim();
//     if (email.isNotEmpty && password.isNotEmpty) {
//      LoginRequest login=  LoginRequest(email: email, password: password);
//       var response = await AuthService.login(login);
//       Logger().i("ishlamoqda");
//       Logger().i(response);
//      if(response!=null){
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => const HomePage(),
//          ),
//        );
//      }
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginPageState>(
      bloc: cubit,
      builder: (context, state) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/logo.png',
              ),
              const SizedBox(height: 30),
              const Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                // height: 52,
                child: ElevatedButton(
                  onPressed: () {

                      if(_emailController.text.isNotEmpty&&_passwordController.text.isNotEmpty){
                        cubit.logintoPlatform(
                            _emailController.text, _passwordController.text);
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage(),),);

                      }else{
                        showToast("Empty");
                      }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00B900),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Akkauntingiz yo\'qmi?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      " Registratsiya qiling!",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
