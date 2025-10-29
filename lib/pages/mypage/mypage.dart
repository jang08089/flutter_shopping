import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/itemcartpage/itemcart.dart';
import 'package:flutter_shopping/pages/itemcartpage/noitemcart_page.dart';
import 'package:flutter_shopping/pages/profile_editpage/profile.dart';
import 'package:flutter_shopping/pages/profile_editpage/profileeditpage.dart';
import 'package:flutter_shopping/pages/home/cartmodel.dart'; // ✅ 추가

class Mypage extends StatefulWidget {
  final Profile? profile;

  const Mypage(this.profile, {super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  Profile? currentProfile;

  @override
  void initState() {
    super.initState();
    currentProfile = widget.profile;
    // ✅ cartModel 변경 시 자동으로 rebuild 되도록
    cartModel.addListener(_updateCartState);
  }

  @override
  void dispose() {
    cartModel.removeListener(_updateCartState);
    super.dispose();
  }

  void _updateCartState() {
    setState(() {}); // cartModel 변경 시 UI 갱신
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

  void goToCartPage() {
    // ✅ cartModel의 상태를 직접 확인
    final bool isCartEmpty = cartModel.isCartEmpty;

    Widget targetPage = isCartEmpty ? NoitemcartPage() : Itemcart();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => targetPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = currentProfile;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "마이페이지",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, profile);
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
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    profile?.nickname ?? "닉네임 없음",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: (profile?.image != null &&
                          File(profile!.image!.path).existsSync())
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            File(profile.image!.path),
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: showProfile,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                ),
                child: const Text("프로필 수정"),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: goToCartPage,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                ),
                child: const Text("장바구니 보기"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
