

class User {
  String title;
  String note;
  // bool isDone;
  // int id;
    
  User(this.title,this.note,
  // this.isDone
  // this.id
  
  );

     User fromJson(Map<String,dynamic> json) =>  User(
     title= json['title'],
     note= json['note'],
    //  isDone= json['isDone'],
    //  id=json['id'],
   );
 
Map<String,dynamic> toJson() => {
'title': title,
'note':  note,
// 'id':id,
};

bool isDone = false;
}


