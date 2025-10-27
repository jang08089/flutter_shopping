import 'package:flutter/material.dart';

class ProductNameInput extends StatefulWidget {
  final void Function(String?) onSaved;

  const ProductNameInput({super.key, required this.onSaved});

  @override
  State<ProductNameInput> createState() => _ProductNameInputState();
}

class _ProductNameInputState extends State<ProductNameInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "상품 이름",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: "상품 이름을 입력해주세요.",
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "상품 이름을 입력해주세요.";
              }
              return null;
            },
            onSaved: widget.onSaved,
          ),
        ],
      ),
    );
  }
}
