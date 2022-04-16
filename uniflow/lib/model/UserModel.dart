class UserModel {
  String? FirstName;
  String? LastName;
  String? Class;
  String? uid;
  int? roll;

  UserModel({this.FirstName, this.LastName, this.Class, this.roll, this.uid});

  //to recieve data
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        roll: map['roll'],
        FirstName: map['FirstName'],
        LastName: map['LastName'],
        Class: map['Class']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'FirstName': FirstName,
      'LastName': LastName,
      'roll': roll,
      'Class': Class,
    };
  }
}
