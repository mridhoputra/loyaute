import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:loyaute/model/user_model.dart';
import 'package:loyaute/utils/state_enum.dart';

class UserProvider extends ChangeNotifier {
  User _user = User();
  User get user => _user;

  RequestState _userState = RequestState.initial;
  RequestState get userState => _userState;

  String _userMessage = '';
  String get userMessage => _userMessage;

  Future<void> login(String email, String password) async {
    _userState = RequestState.loading;
    notifyListeners();
    if (email == 'test@gmail.com' && password == '12345678') {
      _user = User(
        name: 'John Doe',
        email: 'test@gmail.com',
        phoneNumber: '+62 823403122',
        memberId: '165894879261361',
        point: 1978,
        pointExpiry: DateTime(2024, 1, 31),
      );
      _userState = RequestState.hasData;
      notifyListeners();
    } else {
      _userState = RequestState.error;
      _userMessage = 'Wrong email and password combination';
      notifyListeners();
    }
  }

  Future<void> register(String name, String email, String phoneNumber, String password) async {
    _user = User(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      memberId: generateRandomNumber(),
      point: 0,
      pointExpiry: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    _userState = RequestState.hasData;
    notifyListeners();
  }

  String generateRandomNumber() {
    final random = Random();
    num min = pow(10, 15 - 1);
    num max = pow(10, 15) - 1;
    num randomNumber = min + random.nextInt(max.toInt() - min.toInt());
    return randomNumber.toString();
  }
}
