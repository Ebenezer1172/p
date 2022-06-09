  // import 'package:note/utils.dart';

class User {
  String title;
  String note; 
  String id;
  DateTime createdTime;
  bool isDone = false;
  User(this.title,this.note,this.id,this.createdTime,this.isDone);

     User fromJson(Map<String,dynamic> json) =>  User(
     json['title'],
     json['note'],
     json['id'],
     json['createdTime'],
    json['isDone'], 
   );
 
Map<String,dynamic> toJson() => {
'title': title,
'note':  note, 
'id': id,
'createdTime':  createdTime,
'isDone':isDone,
};
 
}


