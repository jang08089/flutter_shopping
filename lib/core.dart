class Product {
  Product(this.title, this.content, this.price, this.isFavorite, this.myBag);
  String title; // 상품 제목
  String content; // 상품 상세설명
  int price; // 가격
  // bool isAvailable;
  bool isFavorite = false; // 찜
  bool myBag; // 장바구니
}
