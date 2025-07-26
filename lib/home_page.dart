// lib/main.dart
import 'package:discoverr/data.dart';
import 'package:discoverr/model.dart';
import 'package:discoverr/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceWidth;
  late double _deviceHeight;
  late List<String> _locations;
  late List<TravelPost> _posts;
  int _selectedLocationIndex = 1; // Default to Japan
  final Set<int> _likedPosts = {};

  @override
  void initState() {
    super.initState();
    _locations = MockData.getLocations();
    _posts = MockData.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(child: _mainColumn()),
    );
  }

  Widget _mainColumn() {
    return Column(
      children: <Widget>[
        CustomHeader(deviceWidth: _deviceWidth, deviceHeight: _deviceHeight),
        LocationBar(
          deviceWidth: _deviceWidth,
          deviceHeight: _deviceHeight,
          locations: _locations,
          selectedIndex: _selectedLocationIndex,
          onLocationTap: _onLocationTap,
        ),
        Expanded(child: _buildPostsList()),
      ],
    );
  }

  Widget _buildPostsList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.04),
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        final isLiked = _likedPosts.contains(post.id);

        return PostCard(
          post: post,
          deviceWidth: _deviceWidth,
          deviceHeight: _deviceHeight,
          isLiked: isLiked,
          onLikeTap: () => _toggleLike(post.id),
        );
      },
    );
  }

  void _onLocationTap(int index) {
    setState(() {
      _selectedLocationIndex = index;
    });
  }

  void _toggleLike(int postId) {
    setState(() {
      if (_likedPosts.contains(postId)) {
        _likedPosts.remove(postId);
      } else {
        _likedPosts.add(postId);
      }
    });
  }
}
