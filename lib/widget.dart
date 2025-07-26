import 'package:discoverr/model.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final double deviceWidth;
  final double deviceHeight;

  const CustomHeader({
    super.key,
    required this.deviceWidth,
    required this.deviceHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.04,
        vertical: deviceHeight * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu, color: Colors.grey[600], size: deviceWidth * 0.07),
          Row(
            children: [
              Container(
                width: deviceWidth * 0.06,
                height: deviceWidth * 0.06,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(width: deviceWidth * 0.02),
              Text(
                'Discover',
                style: TextStyle(
                  fontSize: deviceWidth * 0.055,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          Icon(Icons.search, color: Colors.grey[600], size: deviceWidth * 0.07),
        ],
      ),
    );
  }
}

class LocationBar extends StatelessWidget {
  final double deviceWidth;
  final double deviceHeight;
  final List<String> locations;
  final int selectedIndex;
  final Function(int) onLocationTap;

  const LocationBar({
    super.key,
    required this.deviceWidth,
    required this.deviceHeight,
    required this.locations,
    required this.selectedIndex,
    required this.onLocationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(deviceWidth * 0.04),
      padding: EdgeInsets.all(deviceWidth * 0.01),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: locations.asMap().entries.map((entry) {
            int index = entry.key;
            String location = entry.value;
            bool isSelected = index == selectedIndex;

            return GestureDetector(
              onTap: () => onLocationTap(index),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: deviceWidth * 0.005),
                padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.04,
                  vertical: deviceHeight * 0.015,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  location,
                  style: TextStyle(
                    fontSize: deviceWidth * 0.04,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.grey[800] : Colors.grey[300],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final TravelPost post;
  final double deviceWidth;
  final double deviceHeight;
  final bool isLiked;
  final VoidCallback onLikeTap;

  const PostCard({
    super.key,
    required this.post,
    required this.deviceWidth,
    required this.deviceHeight,
    required this.isLiked,
    required this.onLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: deviceHeight * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildPostHeader(), _buildPostImage(), _buildPostActions()],
      ),
    );
  }

  Widget _buildPostHeader() {
    return Padding(
      padding: EdgeInsets.all(deviceWidth * 0.04),
      child: Row(
        children: [
          CircleAvatar(
            radius: deviceWidth * 0.06,
            backgroundImage: NetworkImage(post.user.avatar),
          ),
          SizedBox(width: deviceWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.user.name,
                  style: TextStyle(
                    fontSize: deviceWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  post.user.timeAgo,
                  style: TextStyle(
                    fontSize: deviceWidth * 0.035,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onLikeTap,
            child: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : Colors.grey[400],
              size: deviceWidth * 0.06,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostImage() {
    return SizedBox(
      height: deviceHeight * 0.35,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              post.imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.image,
                    size: deviceWidth * 0.2,
                    color: Colors.grey[500],
                  ),
                );
              },
            ),
          ),
          if (post.isVideo)
            Center(
              child: Container(
                width: deviceWidth * 0.15,
                height: deviceWidth * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow,
                  size: deviceWidth * 0.08,
                  color: Colors.grey[800],
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
              padding: EdgeInsets.all(deviceWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(
                      fontSize: deviceWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.005),
                  Text(
                    post.location,
                    style: TextStyle(
                      fontSize: deviceWidth * 0.035,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostActions() {
    return Padding(
      padding: EdgeInsets.all(deviceWidth * 0.04),
      child: Row(
        children: [
          GestureDetector(
            onTap: onLikeTap,
            child: Row(
              children: [
                Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.grey[400],
                  size: deviceWidth * 0.055,
                ),
                SizedBox(width: deviceWidth * 0.02),
                Text(
                  Helpers.formatNumber(post.likes),
                  style: TextStyle(
                    fontSize: deviceWidth * 0.035,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: deviceWidth * 0.08),
          Row(
            children: [
              Icon(
                Icons.comment_outlined,
                color: Colors.grey[400],
                size: deviceWidth * 0.055,
              ),
              SizedBox(width: deviceWidth * 0.02),
              Text(
                post.comments.toString(),
                style: TextStyle(
                  fontSize: deviceWidth * 0.035,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(width: deviceWidth * 0.08),
          Row(
            children: [
              Icon(
                Icons.share_outlined,
                color: Colors.grey[400],
                size: deviceWidth * 0.055,
              ),
              SizedBox(width: deviceWidth * 0.02),
              Text(
                Helpers.formatNumber(post.shares),
                style: TextStyle(
                  fontSize: deviceWidth * 0.035,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Helpers {
  static String formatNumber(int number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(0)}k';
    }
    return number.toString();
  }

  static double getResponsiveWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }

  static double getResponsiveHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * percentage;
  }
}
