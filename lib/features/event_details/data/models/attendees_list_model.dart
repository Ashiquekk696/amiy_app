class AttendeeListModel {
  String? createdAt;
  String? name;
  String? avatar;
  String? id;
  String? phone;
  AttendeeListModel(
      {this.createdAt, this.name, this.avatar, this.id, this.phone});

  AttendeeListModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['username'];
    avatar = json['avatar'];
    id = json['id'];
    phone = json['phone'];
  }
}
