class Weekday {
  String? en;
  String? ar;

  Weekday({this.en, this.ar});

  factory Weekday.fromJson(Map<String, dynamic> json) =>
      Weekday(en: json['en'] as String?, ar: json['ar'] as String?);

  Map<String, dynamic> toJson() => {'en': en, 'ar': ar};
}
