import 'package:flutter/material.dart';

class ImageSelector extends StatefulWidget {
  final Function(String) onImageSelected;

  const ImageSelector({super.key, required this.onImageSelected});
  @override
  State<StatefulWidget> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  String? selectedImage;

  List<String> images = ["", "", "assets/images/penguin.png", "", ""];

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
          selectedImage != null
              ? Image.asset(selectedImage!, width: 200, height: 200)
              : Icon(Icons.image, size: 100, color: Colors.grey),
          SizedBox(height: 8),
          ElevatedButton(onPressed: _openGallery, child: Text("이미지 선택")),
          if (selectedImage != null)
            Text("이미지 선택됨", style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}
