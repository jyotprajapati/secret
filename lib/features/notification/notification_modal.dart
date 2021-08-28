class NotificationModal {
  List<LikedNotification>? likedNotification;
  List<CommentNotification>? commentNotification;
  List<FollowNotification>? followNotification;

  NotificationModal(
      {this.likedNotification,
      this.commentNotification,
      this.followNotification});

  NotificationModal.fromJson(Map<String, dynamic> json) {
    if (json['likedNotification'] != null) {
      likedNotification = <LikedNotification>[];
      json['likedNotification'].forEach((v) {
        likedNotification!.add(LikedNotification.fromJson(v));
      });
    }
    if (json['commentNotification'] != null) {
      commentNotification = <CommentNotification>[];
      json['commentNotification'].forEach((v) {
        commentNotification!.add(CommentNotification.fromJson(v));
      });
    }
    if (json['followNotification'] != null) {
      followNotification = <FollowNotification>[];
      json['followNotification'].forEach((v) {
        followNotification!.add(FollowNotification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (likedNotification != null) {
      data['likedNotification'] =
          likedNotification!.map((v) => v.toJson()).toList();
    }
    if (commentNotification != null) {
      data['commentNotification'] =
          commentNotification!.map((v) => v.toJson()).toList();
    }
    if (followNotification != null) {
      data['followNotification'] =
          followNotification!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LikedNotification {
  String? likedOn;
  OtherUser? otherUser;
  VideoInfo? videoInfo;

  LikedNotification({this.likedOn, this.otherUser, this.videoInfo});

  LikedNotification.fromJson(Map<String, dynamic> json) {
    likedOn = json['liked_on'];
    otherUser = json['other_user'] != null
        ? OtherUser.fromJson(json['other_user'])
        : null;
    videoInfo = json['video_info'] != null
        ? VideoInfo.fromJson(json['video_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['liked_on'] = likedOn;
    data['other_user'] = otherUser!.toJson();
    data['video_info'] = videoInfo!.toJson();
    return data;
  }
}

class OtherUser {
  int? id;
  String? name;
  String? email;
  String? photoUrl;
  String? bio;

  OtherUser({this.id, this.name, this.email, this.photoUrl, this.bio});

  OtherUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photo_url'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['photo_url'] = photoUrl;
    data['bio'] = bio;
    return data;
  }
}

class VideoInfo {
  int? id;
  String? videoUrl;
  double? latitude;
  double? longitude;
  String? city;
  String? state;
  int? videoViews;
  int? videoLikes;
  int? videoComments;
  int? videoReported;
  String? videoCaption;

  VideoInfo(
      {this.id,
      this.videoUrl,
      this.latitude,
      this.longitude,
      this.city,
      this.state,
      this.videoViews,
      this.videoLikes,
      this.videoComments,
      this.videoReported,
      this.videoCaption});

  VideoInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoUrl = json['video_url'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    city = json['city'];
    state = json['state'];
    videoViews = json['video_views'];
    videoLikes = json['video_likes'];
    videoComments = json['video_comments'];
    videoReported = json['video_reported'];
    videoCaption = json['video_caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['video_url'] = videoUrl;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['city'] = city;
    data['state'] = state;
    data['video_views'] = videoViews;
    data['video_likes'] = videoLikes;
    data['video_comments'] = videoComments;
    data['video_reported'] = videoReported;
    data['video_caption'] = videoCaption;
    return data;
  }
}

class CommentNotification {
  String? commentOn;
  OtherUser? otherUser;
  VideoInfo? videoInfo;

  CommentNotification({this.commentOn, this.otherUser, this.videoInfo});

  CommentNotification.fromJson(Map<String, dynamic> json) {
    commentOn = json['comment_on'];
    otherUser = (json['other_user'] != null
        ? OtherUser.fromJson(json['other_user'])
        : null)!;
    videoInfo = (json['video_info'] != null
        ? VideoInfo.fromJson(json['video_info'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment_on'] = commentOn;
    if (otherUser != null) {
      data['other_user'] = otherUser!.toJson();
    }
    if (videoInfo != null) {
      data['video_info'] = videoInfo!.toJson();
    }
    return data;
  }
}

class FollowNotification {
  String? followOn;
  OtherUser? otherUser;

  FollowNotification({this.followOn, this.otherUser});

  FollowNotification.fromJson(Map<String, dynamic> json) {
    followOn = json['follow_on'];
    otherUser = json['other_user'] != null
        ? OtherUser.fromJson(json['other_user'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['follow_on'] = followOn;
    if (otherUser != null) {
      data['other_user'] = otherUser!.toJson();
    }
    return data;
  }
}
