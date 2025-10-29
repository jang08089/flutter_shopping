import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/home/cartmodel.dart';
import 'package:intl/intl.dart';

class Itemcart extends StatefulWidget {
  const Itemcart({super.key});

  @override
  State<Itemcart> createState() => _ItemcartState();
}

class _ItemcartState extends State<Itemcart> {
  @override
  void initState() {
    super.initState();
    cartModel.addListener(_updateCartList);
  }

  @override
  void dispose() {
    cartModel.removeListener(_updateCartList);
    super.dispose();
  }

  void _updateCartList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cartItem = cartModel.cartItems;
    final formatter = NumberFormat('#,###');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "장바구니",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(bottom: 150),
        itemCount: cartItem.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = cartItem[index];
          final price = item['price'] as int? ?? 0;
          final number = item['number'] as int? ?? 1;
          final totalPrice = formatter.format(price * number);

          return itembox(
            itemName: item['name'] as String? ?? '',
            imagePath: item['image']?.toString() ?? '',
            priceText: formatter.format(price),
            totalPriceText: totalPrice,
            number: number,
            onDelete: () => cartModel.removeItem(index),
            onPlus: () => cartModel.plusNumber(index),
            onCount: () => cartModel.countNumber(index),
          );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: const Text('구매 완료'),
                    content: const Text("상품이 구매되었습니다."),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("확인"),
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("구매하기", style: TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }

  // ✅ itembox 위젯
  Widget itembox({
    required String itemName,
    required String imagePath,
    required String priceText,
    required String totalPriceText,
    required int number,
    required VoidCallback onDelete,
    required VoidCallback onPlus,
    required VoidCallback onCount,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: imagePath.isNotEmpty
                  ? Image.asset(imagePath, fit: BoxFit.cover)
                  : const Icon(Icons.image_not_supported),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemName, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),

                const SizedBox(height: 20),
                Text(
                  '$totalPriceText원',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 50),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: onCount,
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.grey[400],
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    color: Colors.grey[400],
                    child: Text(
                      number.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: onPlus,
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.grey[400],
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
