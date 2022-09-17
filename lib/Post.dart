
import 'dart:convert';

class Post{
  int? id;
  int? id2;
  String? name;
  String? salary;
  int? age;

  Post({this.id,this.id2,this.name,this.salary,this.age});

  Map<String,dynamic> toJson() => {
    'id':id,
    'id2':id2,
    'name':name,
    'salary':salary,
    'age':age,
  };

  Post.fromJson(Map<String,dynamic> json)
  : id = json['id'],
    id2 = json['id2'],
    name = json['name'],
    salary = json['salary'],
    age = json['age'];
}