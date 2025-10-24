import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/itemcart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_shopping/profile.dart';
import 'package:flutter_shopping/profileeditpage.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => MypageState();
}

class MypageState extends State<Mypage> {
  Profile? profile;

  Future<void> showProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Profileeditpage()),
    );

    if (result != null && result is Profile) {
      setState(() {
        profile = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("마이페이지"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
             SizedBox(height: 20),
            Row(
              children: [
                Text(
                  profile?.nickname ?? "닉네임 없음",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black),
                ),
               Spacer(),
                Container(
                  width: 100,
                  height: 100,
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
                      : Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
              ],
            ),
             SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(                
                onPressed: showProfile,
                child: Text("프로필 수정"),
              ),
            ),
            SizedBox(height: 30),
             SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(                
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=> Itemcart()));
                },
                child: Text("장바구니"),
              ),
            ),
          ],
        ),
      ),
     
    );
  }
}
