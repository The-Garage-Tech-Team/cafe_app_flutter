




import 'dart:convert';

UserImages prodectFromJson(String str) => UserImages.fromJson(json.decode(str));

String prodectToJson(UserImages data) => json.encode(data.toJson());

class UserImages {
  UserImages({

    required this.imageUrl,

  });


  String imageUrl;

  factory UserImages.fromJson(Map<String, dynamic> json) => UserImages(


    imageUrl: json["image"],
  );

  Map<String, dynamic> toJson() => {

    "image": imageUrl,
  };
}


