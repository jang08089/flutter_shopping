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
    "assets/images/jaguar.jpeg",
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
              // 갤러리 UI에서 이미지 리스트 가져옴
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImage = images[index]; // 어느 이미지를 가져올건지
                  });
                  widget.onImageSelected(images[index]);
                  Navigator.pop(context); // 아무 인덱스 이미지선택 후 팝업 닫기
                },
                child: Image.asset(
                  images[index],
                ), // 이미지 파일 경로의 리스트중 몇번째 것을 가져올건지
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 이미지를 선택 했을 때 출력되고 선택하지 않았을 때 기본 이미지 아이콘 출력
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
