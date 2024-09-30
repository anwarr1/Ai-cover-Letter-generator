import 'package:cover_letter_generator/model/User.dart';
import 'package:cover_letter_generator/provider/authProvider.dart';
import 'package:cover_letter_generator/screens/Home.dart';
import 'package:cover_letter_generator/services/Auth.dart';
import 'package:cover_letter_generator/utils/Ui/form_helper.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  late AuthService authService;
  @override
  void initState() {
    authService = AuthService();

    super.initState();
  }

  bool isSignup = false;
  final _formKey = GlobalKey<FormState>();
  final User user =
      User(id: 0, firstName: '', lastName: '', email: '', password: '');

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (isSignup)
            rowForm(
              width: width,
              firstColumn: InputUI(
                width: width * 0.4,
                hint:
                    FormHelper.isInputRequired("First Name", isRequired: false),
                onChanged: (value) {
                  user.firstName = value;
                },
              ),
              SecondColumn: InputUI(
                width: width * 0.4,
                hint:
                    FormHelper.isInputRequired("Last Name", isRequired: false),
                onChanged: (value) {
                  user.lastName = value;
                },
              ),
            ),
          SizedBox(height: height * 0.02),
          InputUI(
            width: width * 0.8,
            hint: FormHelper.isInputRequired("Username", isRequired: false),
            onChanged: (value) {
              user.email = value;
            },
          ),
          if (isSignup) ...[
            SizedBox(height: height * 0.02),
            InputUI(
              width: width * 0.8,
              hint: FormHelper.isInputRequired("Email", isRequired: false),
              onChanged: (value) {
                user.email = value;
              },
            ),
          ],
          SizedBox(height: height * 0.02),
          InputUI(
            width: width * 0.8,
            hint: FormHelper.isInputRequired("Password", isRequired: false),
            onChanged: (value) {
              user.password = value;
            },
          ),
          SizedBox(height: height * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.65,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      try {
                        isSignup
                            ? await authService.signUp(user)
                            : await login(context, user, authService, ref);

                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(isSignup
                                  ? 'Sign Up Successful'
                                  : 'Login Successful')),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: $e')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(
                        horizontal: 50, vertical: height * 0.018),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    isSignup ? 'Sign Up' : 'Login',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              if (!isSignup)
                const Text(
                  'Forgot Password ?',
                  style: TextStyle(fontSize: 12),
                ),
              SizedBox(height: height * 0.01),
            ],
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.facebook),
              SizedBox(width: width * 0.03),
              const Icon(Icons.facebook)
            ],
          ),
          SizedBox(height: height * 0.02),
          TextButton(
            onPressed: () {
              setState(() {
                isSignup = !isSignup;
              });
            },
            child: Text(
              isSignup
                  ? 'Already have an account? Login'
                  : 'Don\'t have an account? Sign Up',
              style: const TextStyle(fontSize: 12, color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
