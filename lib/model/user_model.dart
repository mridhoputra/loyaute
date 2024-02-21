class User {
  User({
    this.memberId,
    this.name,
    this.email,
    this.phoneNumber,
    this.point,
    this.pointExpiry,
  });

  String? memberId;
  String? name;
  String? email;
  String? phoneNumber;
  int? point;
  DateTime? pointExpiry;
}
