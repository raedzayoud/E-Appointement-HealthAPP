class CommentModel {
  int? commentId;
  int? commentUserid;
  int? commentDoctorid;
  String? commentComment;
  String? commentRating;
  int? usersId;
  String? usersUsername;
  String? usersEmail;
  String? usersPhone;
  String? usersAge;
  String? usersPassword;
  String? usersImage;
  int? doctorId;
  String? doctorUsername;
  String? doctorDescription;
  String? doctorType;
  String? doctorImage;
  int? doctorReview;
  int? doctorPatient;
  int? doctorExperience;
  int? doctorRating;

  CommentModel(
      {this.commentId,
      this.commentUserid,
      this.commentDoctorid,
      this.commentComment,
      this.commentRating,
      this.usersId,
      this.usersUsername,
      this.usersEmail,
      this.usersPhone,
      this.usersAge,
      this.usersPassword,
      this.usersImage,
      this.doctorId,
      this.doctorUsername,
      this.doctorDescription,
      this.doctorType,
      this.doctorImage,
      this.doctorReview,
      this.doctorPatient,
      this.doctorExperience,
      this.doctorRating});

  CommentModel.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    commentUserid = json['comment_userid'];
    commentDoctorid = json['comment_doctorid'];
    commentComment = json['comment_comment'];
    commentRating = json['comment_rating'];
    usersId = json['users_id'];
    usersUsername = json['users_username'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersAge = json['users_age'];
    usersPassword = json['users_password'];
    usersImage = json['users_image'];
    doctorId = json['doctor_id'];
    doctorUsername = json['doctor_username'];
    doctorDescription = json['doctor_description'];
    doctorType = json['doctor_type'];
    doctorImage = json['doctor_image'];
    doctorReview = json['doctor_review'];
    doctorPatient = json['doctor_patient'];
    doctorExperience = json['doctor_experience'];
    doctorRating = json['doctor_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_id'] = this.commentId;
    data['comment_userid'] = this.commentUserid;
    data['comment_doctorid'] = this.commentDoctorid;
    data['comment_comment'] = this.commentComment;
    data['comment_rating'] = this.commentRating;
    data['users_id'] = this.usersId;
    data['users_username'] = this.usersUsername;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_age'] = this.usersAge;
    data['users_password'] = this.usersPassword;
    data['users_image'] = this.usersImage;
    data['doctor_id'] = this.doctorId;
    data['doctor_username'] = this.doctorUsername;
    data['doctor_description'] = this.doctorDescription;
    data['doctor_type'] = this.doctorType;
    data['doctor_image'] = this.doctorImage;
    data['doctor_review'] = this.doctorReview;
    data['doctor_patient'] = this.doctorPatient;
    data['doctor_experience'] = this.doctorExperience;
    data['doctor_rating'] = this.doctorRating;
    return data;
  }
}