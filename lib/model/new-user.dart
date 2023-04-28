class NewUser{
  final String name;
  final String job;
  final String id;
  final String createdAt;

  NewUser({
    required this.name,
    required this.id,
    required this.job,
    required this.createdAt
  });

  factory NewUser.fromJson(Map<String, dynamic> json){
    return NewUser(
        name: json['name'],
        id: json['id'],
        job: json['job'],
        createdAt: json['createdAt']);
  }
}