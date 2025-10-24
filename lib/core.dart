class Product {
Product(this.title, this.content, this.price, this.isFavorite, this.myBag);
  final String title; // 상품 제목
  final String content; // 상품 상세설명
  final int price; // 가격
 // bool isAvailable;
  final bool isFavorite; // 찜
  final bool myBag; // 장바구니
}