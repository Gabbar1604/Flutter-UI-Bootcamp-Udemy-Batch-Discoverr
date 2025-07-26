// lib/data/mock_data.dart

import 'package:discoverr/model.dart';

class MockData {
  static List<String> getLocations() {
    return ['Popular', 'Japan', 'Moscow', 'London', 'Paris', 'New York'];
  }

  static List<TravelPost> getPosts() {
    return [
      TravelPost(
        id: 1,
        user: User(
          name: 'Hussain Mustafa',
          avatar:
              'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100&h=100&fit=crop&crop=face',
          timeAgo: '2 Hours Ago',
        ),
        location: 'Osaka, Japan',
        title: "Japan's second largest metropolitan area",
        imageUrl:
            'https://images.unsplash.com/photo-1545569341-9eb8b30979d9?w=400&h=300&fit=crop',
        likes: 32000,
        comments: 100,
        shares: 50,
        isVideo: true,
      ),
      TravelPost(
        id: 2,
        user: User(
          name: 'Tim Salvatore',
          avatar:
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
          timeAgo: '3 Hours Ago',
        ),
        location: 'Tokyo, Japan',
        title: 'Known as the sleepless city for obvious reasons',
        imageUrl:
            'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=400&h=300&fit=crop',
        likes: 50000,
        comments: 500,
        shares: 1250,
        isVideo: true,
      ),
      TravelPost(
        id: 3,
        user: User(
          name: 'Ely Marya',
          avatar:
              'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face',
          timeAgo: '5 Hours Ago',
        ),
        location: 'Kyoto, Japan',
        title: 'Traditional temples and modern lights',
        imageUrl:
            'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=400&h=300&fit=crop',
        likes: 28000,
        comments: 200,
        shares: 800,
        isVideo: false,
      ),
    ];
  }
}
