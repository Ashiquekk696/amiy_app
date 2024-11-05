class EventListModel {
  int? eventId;
  String? eventName;
  String? date;
  String? description;
  
  String? fullDescription;
  String? imageUrl;

  EventListModel(
      {this.eventId,
      this.eventName,
      this.date,this.fullDescription,
      this.description,
      this.imageUrl});

  EventListModel.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    eventName = json['event_name'];
       fullDescription = json['full_description'];
    date = json['date'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

 
}
