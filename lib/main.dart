import 'package:flutter/material.dart';
import 'package:mariberbudaya/profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Static Social Feed',
      theme: ThemeData.light(),
      home: const SocialFeedScreen(),
    );
  }
}

class Post {
  Post({
    required this.authorName,
    required this.timeAgo,
    required this.content,
    this.hasImage = false,
    this.likes = 0,
    this.comments = 0,
  });

  final String authorName;
  final String timeAgo;
  final String content;
  final bool hasImage;
  int likes;
  int comments;
}

class SocialFeedScreen extends StatefulWidget {
  const SocialFeedScreen({super.key});

  @override
  State<SocialFeedScreen> createState() => _SocialFeedScreenState();
}

class _SocialFeedScreenState extends State<SocialFeedScreen> {
  final List<Post> posts = [
    Post(
      authorName: 'Fiqri Ananda',
      timeAgo: '2h',
      content: 'Aku suka vibecoding',
      hasImage: true,
      likes: 12,
      comments: 3,
    ),
    Post(
      authorName: 'Genta',
      timeAgo: '4h',
      content: 'Aku gak suka vibecoding.',
      hasImage: false,
      likes: 8,
      comments: 1,
    ),
    Post(
      authorName: 'HIMA TATABOGA',
      timeAgo: '1d',
      content:
          'PENGKADERAN HARUS KERAS, YANG KERAS HARUS DILESTARIKAN MAKA DARI ITU INI : Resep kue tradisional turun-temurun. Aku mau coba akhir pekan ini!',
      hasImage: true,
      likes: 42,
      comments: 10,
    ),
  ];

  void _toggleLike(int index) {
    setState(() {
      final p = posts[index];
      // simple like toggle: if liked (odd) -> unlike, else like
      // For demo keep it deterministic: increment by 1
      p.likes += 1;
    });
  }

  Widget _buildAvatar(String name) {
    final initials = name.trim().isEmpty
        ? '?'
        : name.trim().split(' ').map((s) => s[0]).take(2).join();
    return CircleAvatar(
      backgroundColor: Colors.blue.shade700,
      child: Text(initials, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildPostCard(int index) {
    final post = posts[index];
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildAvatar(post.authorName),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          post.authorName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        post.timeAgo,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(post.content, style: const TextStyle(fontSize: 15)),
            if (post.hasImage) ...[
              const SizedBox(height: 12),
              // Simulated image box
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 56, color: Colors.black38),
                ),
              ),
            ],
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      size: 20,
                      color: Colors.grey.shade700,
                    ),
                    const SizedBox(width: 6),
                    Text('${post.likes}'),
                    const SizedBox(width: 18),
                    Icon(
                      Icons.comment_outlined,
                      size: 20,
                      color: Colors.grey.shade700,
                    ),
                    const SizedBox(width: 6),
                    Text('${post.comments}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person, size: 32)),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: posts.length,
        itemBuilder: (context, index) => _buildPostCard(index),
      ),
    );
  }
}
