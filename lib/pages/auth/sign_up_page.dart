import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:loyaute/utils/colors.dart';
import 'package:loyaute/utils/data_common.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/sign-up';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();

  String _name = '';
  String _email = '';
  String _password = '';
  String _phoneNumber = '';
  bool _showLabelName = false;
  bool _showLabelEmail = false;
  bool _isPasswordObscure = true;
  bool _showLabelPassword = false;
  bool _showLabelPhoneNumber = false;
  String _selectedCountryCode = '62';

  @override
  void initState() {
    super.initState();
    _nameFocusNode.addListener(
      () {
        if (_nameFocusNode.hasFocus) {
          setState(() => _showLabelName = true);
        } else {
          setState(() => _showLabelName = false);
        }
      },
    );
    _emailFocusNode.addListener(
      () {
        if (_emailFocusNode.hasFocus) {
          setState(() => _showLabelEmail = true);
        } else {
          setState(() => _showLabelEmail = false);
        }
      },
    );
    _phoneNumberFocusNode.addListener(
      () {
        if (_phoneNumberFocusNode.hasFocus) {
          setState(() => _showLabelPhoneNumber = true);
        } else {
          setState(() => _showLabelPhoneNumber = false);
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
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
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
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: (_name != '' && _email != '' && _phoneNumber != '' && _password != '')
                        ? Text(
                            "Let's sign You up",
                            key: UniqueKey(),
                            style: const TextStyle(
                              fontSize: 29,
                              letterSpacing: -0.01,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            'Create an account',
                            key: UniqueKey(),
                            style: const TextStyle(
                              fontSize: 29,
                              letterSpacing: -0.01,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    "New around here? Awesome choice! Let's make it official. ",
                    style: TextStyle(
                      color: ColorTheme.neutral200,
                      fontSize: 14,
                      letterSpacing: -0.01,
                    ),
                  ),
                  const SizedBox(height: 18),
                  AnimatedOpacity(
                    opacity: _showLabelName == true ? 1.0 : 00,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        'Name',
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
                    focusNode: _nameFocusNode,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) => setState(() => _name = value),
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: -0.01,
                      color: ColorTheme.neutral500,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Name',
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
                    onSubmitted: (_) {
                      _emailFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_phoneNumberFocusNode);
                    },
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
                    opacity: _showLabelPhoneNumber == true ? 1.0 : 00,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        'Phone Number',
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
                    focusNode: _phoneNumberFocusNode,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => setState(() => _phoneNumber = value),
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: -0.01,
                      color: ColorTheme.neutral500,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      contentPadding: const EdgeInsets.all(16),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: ColorTheme.border,
                        ),
                      ),
                      prefixIcon: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedCountryCode,
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: -0.01,
                            fontWeight: FontWeight.w500,
                            color: ColorTheme.neutral500,
                            fontFamily: 'PlusJakartaSans',
                          ),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          padding: const EdgeInsets.only(left: 16),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCountryCode = newValue!;
                            });
                          },
                          items: countryList.map(
                            (country) {
                              return DropdownMenuItem(
                                value: country.phoneCode,
                                child: Text(
                                  '+${country.phoneCode}',
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              );
                            },
                          ).toList(),
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
                  const SizedBox(height: 60),
                  InkWell(
                    onTap: () {
                      print(_name);
                      print(_email);
                      print(_phoneNumber);
                      print(_password);
                      if (_name != '' && _email != '' && _phoneNumber != '' && _password != '') {
                        //TODO:
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Please fill the form first',
                          toastLength: Toast.LENGTH_LONG,
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        color:
                            (_name != '' && _email != '' && _phoneNumber != '' && _password != '')
                                ? ColorTheme.primary
                                : ColorTheme.border,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Create Account',
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
                          text: "Already have an account ? ",
                          style: TextStyle(
                            color: ColorTheme.neutral200,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign In',
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
