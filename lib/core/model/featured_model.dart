// To parse this JSON data, do
//
//     final featuredModel = featuredModelFromJson(jsonString);

import 'dart:convert';

FeaturedModel featuredModelFromJson(String str) =>
    FeaturedModel.fromJson(json.decode(str));

String featuredModelToJson(FeaturedModel data) => json.encode(data.toJson());

class FeaturedModel {
  final bool? success;
  final String? message;
  final Data? data;

  FeaturedModel({
    this.success,
    this.message,
    this.data,
  });

  factory FeaturedModel.fromJson(Map<String, dynamic> json) => FeaturedModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final List<Record>? records;
  final int? count;

  Data({
    this.records,
    this.count,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        records: json["records"] == null
            ? []
            : List<Record>.from(
                json["records"]!.map((x) => Record.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
        "count": count,
      };
}

class Record {
  final String? uuid;
  final String? fullName;
  final dynamic userName;
  final String? occupation;
  final dynamic profileImagePath;
  final String? email;
  final dynamic dateOfBirth;
  final dynamic bio;
  final dynamic pin;
  final bool? isEmailVerified;
  final String? type;
  final bool? activeNotification;
  final bool? informationSubscription;
  final String? eligibility;
  final DateTime? createdAtDateOnly;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Influencer? influencer;
  final Fee? fee;

  Record({
    this.uuid,
    this.fullName,
    this.userName,
    this.occupation,
    this.profileImagePath,
    this.email,
    this.dateOfBirth,
    this.bio,
    this.pin,
    this.isEmailVerified,
    this.type,
    this.activeNotification,
    this.informationSubscription,
    this.eligibility,
    this.createdAtDateOnly,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.influencer,
    this.fee,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        uuid: json["uuid"],
        fullName: json["fullName"],
        userName: json["userName"],
        occupation: json["occupation"],
        profileImagePath: json["profileImagePath"],
        email: json["email"],
        dateOfBirth: json["dateOfBirth"],
        bio: json["bio"],
        pin: json["pin"],
        isEmailVerified: json["isEmailVerified"],
        type: json["type"],
        activeNotification: json["activeNotification"],
        informationSubscription: json["informationSubscription"],
        eligibility: json["eligibility"],
        createdAtDateOnly: json["createdAtDateOnly"] == null
            ? null
            : DateTime.parse(json["createdAtDateOnly"]),
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        influencer: json["influencer"] == null
            ? null
            : Influencer.fromJson(json["influencer"]),
        fee: json["fee"] == null ? null : Fee.fromJson(json["fee"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "fullName": fullName,
        "userName": userName,
        "occupation": occupation,
        "profileImagePath": profileImagePath,
        "email": email,
        "dateOfBirth": dateOfBirth,
        "bio": bio,
        "pin": pin,
        "isEmailVerified": isEmailVerified,
        "type": type,
        "activeNotification": activeNotification,
        "informationSubscription": informationSubscription,
        "eligibility": eligibility,
        "createdAtDateOnly":
            "${createdAtDateOnly!.year.toString().padLeft(4, '0')}-${createdAtDateOnly!.month.toString().padLeft(2, '0')}-${createdAtDateOnly!.day.toString().padLeft(2, '0')}",
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "influencer": influencer?.toJson(),
        "fee": fee?.toJson(),
      };
}

class Fee {
  final String? uuid;
  final String? userId;
  final String? celebrityId;
  final int? bookingFee;
  final int? directMessageFee;
  final bool? isBookingFeeAdded;
  final bool? isdirectMessageFeeAdded;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Fee({
    this.uuid,
    this.userId,
    this.celebrityId,
    this.bookingFee,
    this.directMessageFee,
    this.isBookingFeeAdded,
    this.isdirectMessageFeeAdded,
    this.createdAt,
    this.updatedAt,
  });

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        uuid: json["uuid"],
        userId: json["userId"],
        celebrityId: json["celebrityId"],
        bookingFee: json["bookingFee"],
        directMessageFee: json["directMessageFee"],
        isBookingFeeAdded: json["isBookingFeeAdded"],
        isdirectMessageFeeAdded: json["isdirectMessageFeeAdded"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "userId": userId,
        "celebrityId": celebrityId,
        "bookingFee": bookingFee,
        "directMessageFee": directMessageFee,
        "isBookingFeeAdded": isBookingFeeAdded,
        "isdirectMessageFeeAdded": isdirectMessageFeeAdded,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Influencer {
  final String? uuid;
  final String? country;
  final String? socialMedia;
  final dynamic handle;
  final String? followers;
  final String? idType;
  final String? idNumber;
  final DateTime? dateOfBirth;
  final String? documentImagePath;
  final String? userId;
  final int? views;
  final dynamic pin;
  final bool? isFeatured;
  final DateTime? createdAtDateOnly;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Influencer({
    this.uuid,
    this.country,
    this.socialMedia,
    this.handle,
    this.followers,
    this.idType,
    this.idNumber,
    this.dateOfBirth,
    this.documentImagePath,
    this.userId,
    this.views,
    this.pin,
    this.isFeatured,
    this.createdAtDateOnly,
    this.createdAt,
    this.updatedAt,
  });

  factory Influencer.fromJson(Map<String, dynamic> json) => Influencer(
        uuid: json["uuid"],
        country: json["country"],
        socialMedia: json["socialMedia"],
        handle: json["handle"],
        followers: json["followers"],
        idType: json["idType"],
        idNumber: json["idNumber"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        documentImagePath: json["documentImagePath"],
        userId: json["userId"],
        views: json["views"],
        pin: json["pin"],
        isFeatured: json["isFeatured"],
        createdAtDateOnly: json["createdAtDateOnly"] == null
            ? null
            : DateTime.parse(json["createdAtDateOnly"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "country": country,
        "socialMedia": socialMedia,
        "handle": handle,
        "followers": followers,
        "idType": idType,
        "idNumber": idNumber,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "documentImagePath": documentImagePath,
        "userId": userId,
        "views": views,
        "pin": pin,
        "isFeatured": isFeatured,
        "createdAtDateOnly":
            "${createdAtDateOnly!.year.toString().padLeft(4, '0')}-${createdAtDateOnly!.month.toString().padLeft(2, '0')}-${createdAtDateOnly!.day.toString().padLeft(2, '0')}",
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
