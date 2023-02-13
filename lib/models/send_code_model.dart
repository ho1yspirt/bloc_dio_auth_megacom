// ignore_for_file: prefer_collection_literals, unnecessary_this

class SendCodeModel {
  int? status;
  String? message;
  String? externalId;
  SendCodeModel({this.status, this.message, this.externalId});
  SendCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    externalId = json['externalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['externalId'] = this.externalId;
    return data;
  }
}
