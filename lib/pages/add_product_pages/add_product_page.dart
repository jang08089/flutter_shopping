import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/image_selector.dart';
import 'widgets/product_name_input.dart';
import 'widgets/product_price_input.dart';
import 'widgets/product_description_input.dart';
import 'widgets/submit_button.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>(); // submit 버튼과 동일, 서로 연결되어 동작

  // 각 입력 데이터 변수선언
  String? productName;
  String? productPrice;
  String? productDescription;
  String? selectedImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "상품 등록",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(), // 뒤로가기 버튼
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // 폼 키 연결
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageSelector(
                onImageSelected: (Path) {
                  // 이미지 경로에서 이미지 선택
                  setState(() {
                    // 이미지 선택 후 UI를 다시 그림
                    selectedImagePath = Path;
                  });
                },
              ),
              // 각각 입력한 값을 저장했으니 value로 호출
              SizedBox(height: 20),
              ProductNameInput(onSaved: (value) => productName = value),
              SizedBox(height: 20),
              ProductPriceInput(onSaved: (value) => productPrice = value),
              SizedBox(height: 20),
              ProductDescriptionInput(
                onSaved: (value) => productDescription = value,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SubmitButton(
        // submit_button 에 등록하기 버튼 고정 시켜줌
        formkey: _formKey, // submit_button 에서 전달받은 폼키 호출

        onSubmit: () {
          if (_formKey.currentState!.validate()) {
            // 폼 검증 = 등록버튼 누를때 모든 예외처리(validate)가 true면 통과, 하나라도 아니면 false 다음 코드 실행X
            _formKey.currentState!.save(); // 검증 통과 후 호출, 입력값이 상태 변수에 저장

            if (selectedImagePath == null || selectedImagePath!.isEmpty) {
              // 이미지 선택 여부 확인
              ScaffoldMessenger.of(context).showSnackBar(
                // 선택 안할시 예외처리(스낵바 띄움)
                SnackBar(
                  content: Text("이미지를 선택해주세요."),
                  backgroundColor: Colors.red,
                ),
              );
              return;
            }

            // 각 폼에서 입력받은 값들을 한 번에 모아서 newItem이라는 새로운 상품 객체 생성(홈페이지에 Map으로 명시되어 있으니 데이터 구조 맞춤)
            // 홈페이지와 구조를 맞춘 후, newItem을 items에 추가하는 방식으로 데이터 통합
            final Map<String, dynamic> newItem = {
              "name": productName ?? "",
              "price": int.tryParse(productPrice ?? "0") ?? 0,
              "selected": true,
              "image": selectedImagePath ?? "",
              "contents": productDescription ?? "",
            };

            // 상품 등록 완료되면 팝업 창 띄움
            showCupertinoDialog(
              context: context,
              builder: (BuildContext dialogContext) {
                return CupertinoAlertDialog(
                  title: Text("등록 완료"),
                  content: Text("상품이 성공적으로 등록되었습니다."),
                  actions: [
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(dialogContext); // 다이얼로그 닫기
                        Navigator.pop(context, newItem); // HomePage로 newItem 전달
                      },
                      child: Text("확인"),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
