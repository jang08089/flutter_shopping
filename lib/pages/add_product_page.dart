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
        title: Text('상품 등록'),
        leading: BackButton(), // 뒤로가기 버튼
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
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
                      ProductPriceInput(
                        onSaved: (value) => productPrice = value,
                      ),

                      SizedBox(height: 20),
                      ProductDescriptionInput(
                        onSaved: (value) => productDescription = value,
                      ),

                      SizedBox(height: 30),
                      SubmitButton(
                        formkey: _formKey,
                        productName: productName,
                        productPrice: productPrice,
                        productDescription: productDescription,
                        selectedImagePath: selectedImagePath,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
