
import 'package:flutter/material.dart';
import 'package:notepad/views/utlis/text_style.dart';

import '../utlis/colors.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> data = [
      {},
      {
        'name': 'Account',
        'icon': const Icon(Icons.key),
      },
      {
        'name': 'Privacy',
        'icon': const Icon(Icons.lock_outline),
      },
      {
        'name': 'Avatar',
        'icon': const Icon(Icons.emoji_emotions_outlined),
      },
      {
        'name': 'Chats',
        'icon': const Icon(Icons.chat),
      },
      {
        'name': 'Notifications',
        'icon': const Icon(Icons.notifications),
      },
      {
        'name': 'Storage and data',
        'icon': const Icon(Icons.storage),
      },
      {
        'name': 'App Language',
        'icon': const Icon(Icons.language),
      },
      {
        'name': 'Help',
        'icon': const Icon(Icons.help_outline),
      },
      {
        'name': 'Invite a friend',
        'icon': const Icon(Icons.person_2),
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: HeadingTwo(data: 'Profile',color: Colors.white,),

      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
              child: index == 0
                  ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage('https://imgs.search.brave.com/5t2AIKX1Q3AK7EVkP9WQZjBRCWWCA85hocjC1932hdQ/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMzLmFscGhhY29k/ZXJzLmNvbS8xMzUv/MTM1NjU1LmpwZw'),
                  ),
                  title: const HeadingTwo(
                    data: 'Kakashi Hatake',
                    fontSize: 18,
                  ),
                  subtitle: const Text('Premium Subscribers'),
                  trailing: Icon(
                    Icons.qr_code_2,
                    color: AppColors.primaryColor,
                    size: 34,
                  ),
                ),
              )
                  : InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: HeadingTwo(
                      data: "${data[index]['name']} is Under Construction !!",
                      color: AppColors.primaryColor,
                    ),
                    backgroundColor: Colors.white.withOpacity(0.9),
                    duration: const Duration(seconds: 2),
                  ));
                },
                child: ListTile(
                  leading: data[index]['icon'],
                  title: HeadingTwo(
                    data: data[index]['name'],
                    fontSize: 18,
                  ),
                ),
              ));
        },
      ),
    );
  }
}