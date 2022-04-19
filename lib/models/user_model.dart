
class UserModel {
  String? uid;
  String? email;
  String? name;
  String? lastname;
  String? tel;

  UserModel({this.uid, this.email, this.name, this.lastname, this.tel});

  factory UserModel.fromMap(Map)
  {
    return UserModel(
      uid: Map['uid'],
      email: Map['email'],
      name: Map['name'],
      lastname: Map['lastname'],
      tel: Map['telefono']
    );
  }


  Map <String, dynamic> toMap(){
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'lastname': lastname,
      'telefono': tel
    };
  }

}