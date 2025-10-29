import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/itemcartpage/itemcart.dart';
import 'package:flutter_shopping/pages/profile_editpage/profile.dart';
import 'package:flutter_shopping/pages/profile_editpage/profileeditpage.dart';

class Mypage extends StatefulWidget {
  final Profile? profile;
  const Mypage(this.profile, {super.key});

  @override
  State<Mypage> createState() => MypageState();
}

class MypageState extends State<Mypage> {
  Profile? currentProfile;

  @override
  void initState() {
    super.initState();
    currentProfile = widget.profile;
  }

  Future<void> showProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Profileeditpage(currentProfile),
      ),
    );

    if (result != null && result is Profile) {
      setState(() {
        currentProfile = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = currentProfile;

    return Scaffold(
      appBar: AppBar(
        title: const Text("마이페이지",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, profile); // ✅ 최신 프로필 HomePage로 반환
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  profile?.nickname ?? "닉네임 없음",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                const Spacer(),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: (profile?.image != null)
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            File(profile!.image!.path),
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
              ],
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder()
                ),
                onPressed: showProfile,
                child: const Text("프로필 수정"),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
