
class UserData {
  final String name;
  final bool selected;

  UserData({
    required this.name,
    required this.selected});

}

 UserData fromJson(Map<String, dynamic> json){

    return UserData(

      name: json['name'] as String,
      selected: json['selected'] as bool,

    );
 }
