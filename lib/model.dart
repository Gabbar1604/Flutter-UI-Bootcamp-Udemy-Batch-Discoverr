// lib/models/user.dart
class User {
  final String name;
  final String avatar;
  final String timeAgo;

  User({required this.name, required this.avatar, required this.timeAgo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
      timeAgo: json['timeAgo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'avatar': avatar, 'timeAgo': timeAgo};
  }
}

// lib/models/travel_post.dart

class TravelPost {
  final int id;
  final User user;
  final String location;
  final String title;
  final String imageUrl;
  final int likes;
  final int comments;
  final int shares;
  final bool isVideo;

  TravelPost({
    required this.id,
    required this.user,
    required this.location,
    required this.title,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.isVideo,
  });

  factory TravelPost.fromJson(Map<String, dynamic> json) {
    return TravelPost(
      id: json['id'] ?? 0,
      user: User.fromJson(json['user'] ?? {}),
      location: json['location'] ?? '',
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      likes: json['likes'] ?? 0,
      comments: json['comments'] ?? 0,
      shares: json['shares'] ?? 0,
      isVideo: json['isVideo'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'location': location,
      'title': title,
      'imageUrl': imageUrl,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'isVideo': isVideo,
    };
  }

  TravelPost copyWith({
    int? id,
    User? user,
    String? location,
    String? title,
    String? imageUrl,
    int? likes,
    int? comments,
    int? shares,
    bool? isVideo,
  }) {
    return TravelPost(
      id: id ?? this.id,
      user: user ?? this.user,
      location: location ?? this.location,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      shares: shares ?? this.shares,
      isVideo: isVideo ?? this.isVideo,
    );
  }
}
