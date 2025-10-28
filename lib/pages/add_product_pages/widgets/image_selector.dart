import 'package:flutter/material.dart';

class ImageSelector extends StatefulWidget {
  final Function(String) onImageSelected;

  const ImageSelector({super.key, required this.onImageSelected});
  @override
  State<StatefulWidget> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  String? selectedImage;

  // assets에 이미지 파일 넣고 경로 입력
  List<String> images = [
    "assets/images/simba.jpg",
    "assets/images/penguin.png",
    "assets/images/suyeon.jpg",
    "assets/images/audi.jpeg",
    "assets/images/classic.jpeg",
    "assets/images/classiccar.jpeg",
    "assets/images/tiger.jpeg",
    "assets/images/jaguar.jpeg"
  ];

  void _openGallery() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.66,
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImage = images[index];
                  });
                  widget.onImageSelected(images[index]);
                  Navigator.pop(context); // 선택 후 팝업 닫기
                },
                child: Image.asset(images[index]),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: _openGallery,
            child: selectedImage != null
                ? Image.asset(selectedImage!, width: 200, height: 200)
                : Icon(Icons.image, size: 100, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
