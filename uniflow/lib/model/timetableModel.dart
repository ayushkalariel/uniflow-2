class UserModel {
  String? one;
  String? two;
  String? three;
  String? four;

  UserModel({
    this.one,
    this.two,
    this.three,
    this.four,
  });

  //to recieve data
  factory UserModel.fromMap(map) {
    return UserModel(
      one: map['1'],
      two: map['2'],
      three: map['3'],
      four: map['4'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '1': one,
      '2': two,
      '3': three,
      '4': four,
    };
  }
}
