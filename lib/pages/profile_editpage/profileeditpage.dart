import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/profile_editpage/profile.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class Profileeditpage extends StatefulWidget {
  final Profile? profile;
  const Profileeditpage(this.profile,{super.key});

  @override
  State<Profileeditpage> createState() => ProfileeditpageState();
}

class ProfileeditpageState extends State<Profileeditpage> {
  TextEditingController nicknamecontroller = TextEditingController();
  XFile? imageFile;
  String? nickname;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        imageFile = image;
      });
    }
  }

  @override
  void dispose() {
    nicknamecontroller.dispose();
    super.dispose();
  }

  @override
void initState() {
  super.initState();
  if (widget.profile != null) {
    nicknamecontroller.text = widget.profile!.nickname ?? '';
    imageFile = widget.profile!.image;
  }
}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                onTap: () {
                  if (formKey.currentState?.validate() == true) {
                    final profile = Profile(
                      nickname: nicknamecontroller.text,
                      image: imageFile,
                    );
                    Navigator.of(context).pop(profile);
                  } else {
                    null;
                  }
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.transparent,
                  child: Center(
                    child: Text("완료", style: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  pickImage();
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey,
                  ),
                  child: (imageFile != null)
                      ? ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(100),
                          child: Image.file(
                            File(imageFile!.path),
                            fit: BoxFit.fill,
                          ),
                        )
                      : const Icon(Icons.image, size: 50, color: Colors.white),
                ),
              ),
              SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(),
                  labelText: "닉네임",
                  labelStyle: TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if (value == null) {
                      return "닉네임을 입력해주세요";
                    }
                    if (value.isEmpty) {
                      return "닉네임을 입력해주세요";
                    }
                    if (value.trim().length > 8 || value.trim().length < 4) {
                      return "닉네임은 4글자 이상 8글자 이하로 만들어주세요 ";
                    }
                    return null;
                  },

                  controller: nicknamecontroller,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
