// To parse this JSON data, do
//
//     final celebByIdModel = celebByIdModelFromJson(jsonString);

import 'dart:convert';

CelebByIdModel celebByIdModelFromJson(String str) =>
    CelebByIdModel.fromJson(json.decode(str));

String celebByIdModelToJson(CelebByIdModel data) => json.encode(data.toJson());

class CelebByIdModel {
  final bool? success;
  final String? message;
  final CelebData? data;

  CelebByIdModel({
    this.success,
    this.message,
    this.data,
  });

  factory CelebByIdModel.fromJson(Map<String, dynamic> json) => CelebByIdModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : CelebData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };

  static CelebByIdModel empty() {
    return CelebByIdModel();
  }
}

class CelebData {
  final String? id;
  final String? fullName;
  final dynamic userName;
  final String? occupation;
  final dynamic profileImagePath;
  final String? email;
  final dynamic dateOfBirth;
  final dynamic bio;
  final String? password;
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
  final CelebInfluencer? influencer;
  final CelebFee? fee;
  final List<dynamic>? fanReviews;
  final List<CelebrityReview>? celebrityReviews;
  final bool? isFollowing;

  CelebData({
    this.id,
    this.fullName,
    this.userName,
    this.occupation,
    this.profileImagePath,
    this.email,
    this.dateOfBirth,
    this.bio,
    this.password,
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
    this.fanReviews,
    this.celebrityReviews,
    this.isFollowing,
  });

  factory CelebData.fromJson(Map<String, dynamic> json) => CelebData(
        id: json["id"],
        fullName: json["fullName"],
        userName: json["userName"],
        occupation: json["occupation"],
        profileImagePath: json["profileImagePath"],
        email: json["email"],
        dateOfBirth: json["dateOfBirth"],
        bio: json["bio"],
        password: json["password"],
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
            : CelebInfluencer.fromJson(json["influencer"]),
        fee: json["fee"] == null ? null : CelebFee.fromJson(json["fee"]),
        fanReviews: json["fanReviews"] == null
            ? []
            : List<dynamic>.from(json["fanReviews"]!.map((x) => x)),
        celebrityReviews: json["celebrityReviews"] == null
            ? []
            : List<CelebrityReview>.from(json["celebrityReviews"]!
                .map((x) => CelebrityReview.fromJson(x))),
        isFollowing: json["isFollowing"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "userName": userName,
        "occupation": occupation,
        "profileImagePath": profileImagePath,
        "email": email,
        "dateOfBirth": dateOfBirth,
        "bio": bio,
        "password": password,
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
        "fanReviews": fanReviews == null
            ? []
            : List<dynamic>.from(fanReviews!.map((x) => x)),
        "celebrityReviews": celebrityReviews == null
            ? []
            : List<dynamic>.from(celebrityReviews!.map((x) => x.toJson())),
        "isFollowing": isFollowing,
      };
}

class CelebrityReview {
  final String? uuid;
  final String? content;
  final int? rating;
  final String? username;
  final String? fanId;
  final String? celebrityId;
  final String? bookingId;
  final DateTime? createdAt;

  CelebrityReview({
    this.uuid,
    this.content,
    this.rating,
    this.username,
    this.fanId,
    this.celebrityId,
    this.bookingId,
    this.createdAt,
  });

  factory CelebrityReview.fromJson(Map<String, dynamic> json) =>
      CelebrityReview(
        uuid: json["uuid"],
        content: json["content"],
        rating: json["rating"],
        username: json["username"],
        fanId: json["fanId"],
        celebrityId: json["celebrityId"],
        bookingId: json["bookingId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "content": content,
        "rating": rating,
        "username": username,
        "fanId": fanId,
        "celebrityId": celebrityId,
        "bookingId": bookingId,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class CelebFee {
  final String? uuid;
  final String? userId;
  final String? celebrityId;
  final int? bookingFee;
  final int? directMessageFee;
  final bool? isBookingFeeAdded;
  final bool? isdirectMessageFeeAdded;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CelebFee({
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

  factory CelebFee.fromJson(Map<String, dynamic> json) => CelebFee(
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

class CelebInfluencer {
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
  final List<Video>? videos;

  CelebInfluencer({
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
    this.videos,
  });

  factory CelebInfluencer.fromJson(Map<String, dynamic> json) =>
      CelebInfluencer(
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
        videos: json["videos"] == null
            ? []
            : List<Video>.from(json["videos"]!.map((x) => Video.fromJson(x))),
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
        "videos": videos == null
            ? []
            : List<dynamic>.from(videos!.map((x) => x.toJson())),
      };
}

class Video {
  final String? uuid;
  final String? videoPath;
  final bool? introVideo;
  final String? size;
  final String? celebrityId;
  final String? userId;
  final String? fanId;
  final bool? hidden;
  final String? bookingId;
  final DateTime? createdAt;

  Video({
    this.uuid,
    this.videoPath,
    this.introVideo,
    this.size,
    this.celebrityId,
    this.userId,
    this.fanId,
    this.hidden,
    this.bookingId,
    this.createdAt,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        uuid: json["uuid"],
        videoPath: json["videoPath"],
        introVideo: json["introVideo"],
        size: json["size"],
        celebrityId: json["celebrityId"],
        userId: json["userId"],
        fanId: json["fanId"],
        hidden: json["hidden"],
        bookingId: json["bookingId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "videoPath": videoPath,
        "introVideo": introVideo,
        "size": size,
        "celebrityId": celebrityId,
        "userId": userId,
        "fanId": fanId,
        "hidden": hidden,
        "bookingId": bookingId,
        "createdAt": createdAt?.toIso8601String(),
      };
}
