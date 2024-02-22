class Voucher {
  String merchantName;
  String merchantImage;
  String title;
  String banner;
  DateTime startDate;
  DateTime endDate;
  String description;
  List<Benefit> benefits;
  List<HowToGet> howToGet;
  List<String> tnc;

  Voucher({
    required this.merchantName,
    required this.merchantImage,
    required this.title,
    required this.banner,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.benefits,
    required this.howToGet,
    required this.tnc,
  });
}

class Benefit {
  String title;
  String description;

  Benefit({
    required this.title,
    required this.description,
  });
}

class HowToGet {
  String title;
  String description;

  HowToGet({
    required this.title,
    required this.description,
  });
}
