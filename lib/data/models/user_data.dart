class UserData {
  String lavozim;
  String fISh;
  String qabulkunlari;

  UserData(
      {required this.lavozim, required this.fISh, required this.qabulkunlari});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      lavozim: json['lavozim'] as String? ?? '' ,
      fISh: json['fISh'] as String? ?? '',
      qabulkunlari: json['qabulkunlari'] as String? ?? '',
    );
  }
}
