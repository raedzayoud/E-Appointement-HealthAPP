class Doctormodel {
  int? doctorId;
  String? doctorUsername;
  String? doctorDescription;
  String? doctorType;
  String? doctorImage;

  Doctormodel(
      {this.doctorId,
      this.doctorUsername,
      this.doctorDescription,
      this.doctorType,
      this.doctorImage});

  factory Doctormodel.fromJson(Map<String, dynamic> json) {
    return Doctormodel(
        doctorId: json['doctor_id'],
        doctorUsername: json['doctor_username'],
        doctorDescription: json['doctor_description'],
        doctorType: json['doctor_type'],
        doctorImage: json['doctor_image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctorId;
    data['doctor_username'] = this.doctorUsername;
    data['doctor_description'] = this.doctorDescription;
    data['doctor_type'] = this.doctorType;
    data['doctor_image'] = this.doctorImage;
    return data;
  }
}
