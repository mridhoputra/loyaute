import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:loyaute/pages/auth/sign_up_page.dart';
import 'package:loyaute/utils/colors.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/sign-in';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String _email = '';
  String _password = '';
  bool _showLabelEmail = false;
  bool _isPasswordObscure = true;
  bool _showLabelPassword = false;

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(
      () {
        if (_emailFocusNode.hasFocus) {
          setState(() => _showLabelEmail = true);
        } else {
          setState(() => _showLabelEmail = false);
        }
      },
    );
    _passwordFocusNode.addListener(
      () {
        if (_passwordFocusNode.hasFocus) {
          setState(() => _showLabelPassword = true);
        } else {
          setState(() => _showLabelPassword = false);
        }
      },
    );
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/logo_alt.png',
                      height: 44,
                      width: 44,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Let’s sign You in.',
                    style: TextStyle(
                      fontSize: 29,
                      letterSpacing: -0.01,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Hey there, fabulous! Ready to kick back and explore? Just a quick sign-in away from unlocking a world of fun.',
                    style: TextStyle(
                      color: ColorTheme.neutral200,
                      fontSize: 14,
                      letterSpacing: -0.01,
                    ),
                  ),
                  const SizedBox(height: 18),
                  AnimatedOpacity(
                    opacity: _showLabelEmail == true ? 1.0 : 00,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: -0.01,
                          fontWeight: FontWeight.w500,
                          color: ColorTheme.neutral200,
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    focusNode: _emailFocusNode,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => setState(() => _email = value),
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: -0.01,
                      color: ColorTheme.neutral500,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      contentPadding: const EdgeInsets.all(16),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: ColorTheme.border,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorTheme.border,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                  const SizedBox(height: 18),
                  AnimatedOpacity(
                    opacity: _showLabelPassword == true ? 1.0 : 00,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: -0.01,
                          fontWeight: FontWeight.w500,
                          color: ColorTheme.neutral200,
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    focusNode: _passwordFocusNode,
                    obscureText: _isPasswordObscure,
                    onChanged: (value) => setState(() => _password = value),
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: -0.01,
                      color: ColorTheme.neutral500,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: ColorTheme.border,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorTheme.border,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordObscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () => setState(() => _isPasswordObscure = !_isPasswordObscure),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        letterSpacing: -0.01,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: "Forgot Password? ",
                          style: TextStyle(color: ColorTheme.neutral200, letterSpacing: -0.01),
                        ),
                        TextSpan(
                          text: 'Reset Password',
                          style: TextStyle(
                            color: ColorTheme.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.01,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Fluttertoast.showToast(
                                msg: 'Feature not available',
                                toastLength: Toast.LENGTH_LONG,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  InkWell(
                    onTap: () {
                      if (_email != '' && _password != '') {
                        //TODO:
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Email and Password must not be empty',
                          toastLength: Toast.LENGTH_LONG,
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        color: (_email != '' && _password != '')
                            ? ColorTheme.primary
                            : ColorTheme.border,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        letterSpacing: -0.01,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: "Haven't registered yet? ",
                          style: TextStyle(
                            color: ColorTheme.neutral200,
                          ),
                        ),
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(
                            color: ColorTheme.primary,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => context.pushNamed(SignUpPage.routeName),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
