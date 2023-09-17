// To parse this JSON data, do
//
//     final trendingCelebModel = trendingCelebModelFromJson(jsonString);

import 'dart:convert';

TrendingCelebModel trendingCelebModelFromJson(String str) =>
    TrendingCelebModel.fromJson(json.decode(str));

String trendingCelebModelToJson(TrendingCelebModel data) =>
    json.encode(data.toJson());

class TrendingCelebModel {
  final bool? success;
  final String? message;
  final TrendingCeleData? data;

  TrendingCelebModel({
    this.success,
    this.message,
    this.data,
  });

  factory TrendingCelebModel.fromJson(Map<String, dynamic> json) =>
      TrendingCelebModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : TrendingCeleData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class TrendingCeleData {
  final List<TrendingCelebRecord>? records;
  final int? count;

  TrendingCeleData({
    this.records,
    this.count,
  });

  factory TrendingCeleData.fromJson(Map<String, dynamic> json) =>
      TrendingCeleData(
        records: json["records"] == null
            ? []
            : List<TrendingCelebRecord>.from(
                json["records"]!.map((x) => TrendingCelebRecord.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
        "count": count,
      };
}

class TrendingCelebRecord {
  final String? uuid;
  final String? fullName;
  final dynamic userName;
  final String? occupation;
  final String? profileImagePath;
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
  final TrendingInfluencer? influencer;
  final TrendingCelebFee? fee;

  TrendingCelebRecord({
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

  factory TrendingCelebRecord.fromJson(Map<String, dynamic> json) =>
      TrendingCelebRecord(
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
            : TrendingInfluencer.fromJson(json["influencer"]),
        fee:
            json["fee"] == null ? null : TrendingCelebFee.fromJson(json["fee"]),
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

class TrendingCelebFee {
  final String? uuid;
  final String? userId;
  final String? celebrityId;
  final int? bookingFee;
  final int? directMessageFee;
  final bool? isBookingFeeAdded;
  final bool? isdirectMessageFeeAdded;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TrendingCelebFee({
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

  factory TrendingCelebFee.fromJson(Map<String, dynamic> json) =>
      TrendingCelebFee(
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

class TrendingInfluencer {
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

  TrendingInfluencer({
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

  factory TrendingInfluencer.fromJson(Map<String, dynamic> json) =>
      TrendingInfluencer(
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
