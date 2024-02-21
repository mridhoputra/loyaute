import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loyaute/provider/user_provider.dart';
import 'package:loyaute/utils/colors.dart';
import 'package:provider/provider.dart';

class OTPPage extends StatefulWidget {
  static const routeName = '/otp';
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

  String otp = '';
  String phoneNumber = '';

  void _configureFocusListeners() {
    for (int i = 0; i < 4; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.isNotEmpty && i < 4 - 1) {
          _focusNodes[i + 1].requestFocus();
        }
        String tempOtp = '';
        for (TextEditingController controller in _controllers) {
          tempOtp += controller.text;
        }
        setState(() => otp = tempOtp);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        phoneNumber = Provider.of<UserProvider>(context, listen: false).user.phoneNumber ?? '-';
      });

      _configureFocusListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_alt.png',
                    height: 26.5,
                    width: 26.5,
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Loyauté',
                    style: TextStyle(
                      height: 1,
                      fontSize: 24,
                      letterSpacing: -0.01,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 32, bottom: 8),
                child: Text(
                  'Enter OTP Verification',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.01,
                    color: ColorTheme.neutral500,
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    letterSpacing: -0.01,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: "We’ve sent an OTP code to ",
                      style: TextStyle(
                        color: ColorTheme.neutral200,
                      ),
                    ),
                    TextSpan(
                      text: phoneNumber,
                      style: TextStyle(
                        color: ColorTheme.neutral500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => SizedBox(
                      width: 70,
                      height: 56,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: TextStyle(
                          height: 1,
                          fontSize: 20,
                          letterSpacing: -0.01,
                          fontWeight: FontWeight.w500,
                          color: ColorTheme.neutral500,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide(color: ColorTheme.border)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    letterSpacing: -0.01,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: "Didn’t  receive code ? ",
                      style: TextStyle(
                        color: ColorTheme.neutral200,
                      ),
                    ),
                    TextSpan(
                      text: 'Resend Code',
                      style: TextStyle(
                        color: ColorTheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Fluttertoast.showToast(
                            msg: 'Code has been sent', toastLength: Toast.LENGTH_LONG),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () async {
                  if (otp.length == 4) {
                    Fluttertoast.showToast(msg: 'good', toastLength: Toast.LENGTH_LONG);
                  } else {
                    Fluttertoast.showToast(
                      msg: 'Please fill the OTP Code',
                      toastLength: Toast.LENGTH_LONG,
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: (otp.length == 4) ? ColorTheme.primary : ColorTheme.border,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Submit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
