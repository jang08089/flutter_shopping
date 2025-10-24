import 'package:flutter/material.dart';
import 'dart:io'; // File 패키지 사용시 필요
import 'package:image_picker/image_picker.dart'; // 이미지 선택 기능(Image_picker 플러그인 설치)
/* 
원래 assets의 이미지 파일을 넣어서 직접 추가 해서 사용하거나 
url 이미지를 사용하려 했으나 직접 이미지를 선택해서 사용하고 싶었기에
 image picker 기능 사용하기로 결정
*/

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key}); // StatefulWidget 사용

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formkey = GlobalKey<FormState>(); // 폼 상태를 관리하는 변수선언
  // 폼 상태란? 접근, 검증, 저장을 할 수 있음

  String? _productName; // 상품 이름을 저장하는 변수
  String? _productPrice; // 상품 가격을 저장하는 변수
  String? _productDescription; // 상품 설명을 저장하는 변수

  File? _imageFile; // 선택한 이미지 파일
  bool _imageSelected = false; // 이미지 선택 여부 상태

  final ImagePicker _picker = ImagePicker(); // ImagePicker의 객체 생성

  // "갤러리에서 이미지 선택 구현"
  Future<void> _selectImage() async {
    // 함수 반환 타입
    try {
      // try - catch 예외처리
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery, // 사용자가 갤러리에서 이미지를 선택하도록 요청
      );

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path); // 선택한 이미지 파일 경로(주소)
          _imageSelected = true;
        });

        showDialog(
          // 팝업창 열기
          context: context,
          builder: (_) => AlertDialog(
            // (_) = 매개변수 사용 X
            title: Text("이미지 선택"),
            content: Text("이미지를 선택했습니다."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // 팝업을 닫음
                child: Text("확인"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      _showError("이미지를 선택하지 않았습니다."); // 에러 처리 (스낵바 구현)
    }
  }

  // 폼 제출 함수
  void _submitForm() {
    if (!_imageSelected) {
      // 이미지 선택이 false일 경우 bool값
      _showError("이미지를 선택해주세요."); // catch 에서 쓰인 에러 처리와 동일
      return;
    }

    // 폼 검증 & 저장
    if (_formkey.currentState!.validate()) {
      // 입력값이 유효하면
      _formkey.currentState!.save(); // 실핼시 위에서 선언한 _productName 변수에 값을 저장

      // 등록 완료 팝업 출력
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("등록 완료"),
          content: Text("상품이 성공적으로 등록되었습니다."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("확인"),
            ),
          ],
        ),
      );
    }
  }

  // 에러 스낵바
  void _showError(String message) {
    // 함수 이름. 언더스코어(_) = 이 클래스는 _AddProductPageState 내부에서만 호출 가능한 Private 함수
    ScaffoldMessenger.of(context).showSnackBar(
      // SnackBar 표시
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
