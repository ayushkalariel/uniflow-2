class EventModel {
  String? EventName;
  DateTime? EventDate;
  String? Eid;

  EventModel({this.EventName, this.EventDate, this.Eid});

  //to recieve data
  factory EventModel.fromMap(map) {
    return EventModel(
        Eid: map['Eid'],
        EventName: map['EventName'],
        EventDate: map['EventDate']);
  }

  Map<String, dynamic> toMap() {
    return {
      'Eid': Eid,
      'EventName': EventName,
      'EeventDate': EventDate,
    };
  }
}
