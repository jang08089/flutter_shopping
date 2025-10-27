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
  final _formKey = GlobalKey<FormState>(); // 폼 상태 관리 (유효성 검사, 저장 등)

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
                  setState(() {
                    selectedImagePath = Path;
                  });
                },
              ),
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
        formkey: _formKey,

        onSubmit: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            if (selectedImagePath == null || selectedImagePath!.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("이미지를 선택해주세요."),
                  backgroundColor: Colors.red,
                ),
              );
              return;
            }

            final Map<String, dynamic> newItem = {
              "name": productName ?? "",
              "price": int.tryParse(productPrice ?? "0") ?? 0,
              "selected": true,
              "image": selectedImagePath ?? "",
            };

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
