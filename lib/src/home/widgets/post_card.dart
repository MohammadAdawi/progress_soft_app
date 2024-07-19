import 'package:flutter/material.dart';
import 'package:progress_soft_app/app/models/posts_model.dart';
import 'package:progress_soft_app/shared/local/theme/theme.dart';

class PostCard extends StatelessWidget {
  final PostsModel post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.whiteTextColor,
      elevation: 4.0, // Light elevation to give a 3D effect
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              post.body,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'User ID: ${post.userId}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
            Text(
              'Post ID: ${post.id}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
