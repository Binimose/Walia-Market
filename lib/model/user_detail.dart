

class UserDetail {
  final String name;
  final String address;

  UserDetail({required this.name, required this.address});
  Map<String,dynamic> getJson()=>{
    'name':name,
    'adress':address
  };
   factory UserDetail.getModelFromJson(Map<String, dynamic> json) {
    return UserDetail(name: json["name"], address: json["address"]);
  }

}