import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImageSection extends StatefulWidget {
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const ProductImageSection({
    required this.imagePath,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  State<ProductImageSection> createState() => _ProductImageSectionState();
}

class _ProductImageSectionState extends State<ProductImageSection> {
  bool showHeart = false; // 찜하기 하트 보여줄지 여부
  bool isNowFavorite = false; // 더블탭 이후 보여줄 아이콘 결정용

  void _handleDoubleTap() {
    // 더블탭 핸들러 함수
    setState(() {
      // 현재 위젯의 isFavorite의 반대값을 임시로 저장 -> 지금 찜이 되어 있으면(true) → 취소(false) , 지금 찜이 안 되어 있으면(false) → 찜(true)
      isNowFavorite = !widget.isFavorite;
      showHeart = true; // 하트 or 슬래시 하트 표시 시작
    });

    widget.onFavoriteToggle(); // 외부에 찜 토글 동작 위임(상태 저장 등)

    // 0.9초 후 자동으로 애니메이션 하트 숨김
    Future.delayed(Duration(milliseconds: 900), () {
      // 애니 위젯이 아직 화면에 남아 있으면 있으면 showHeart를 false로 변경
      if (mounted) setState(() => showHeart = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onDoubleTap: _handleDoubleTap,
          child: Image.asset(
            widget.imagePath,
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
          ),
        ),
        // 찜하기 하트 애니
        AnimatedOpacity(
          opacity: showHeart ? 1.0 : 0.0, //showHeart에 따라 보이거나 숨김
          duration: Duration(milliseconds: 500), //애니메이션 지속 시간
          child: Icon(
            isNowFavorite
                ? CupertinoIcons
                      .heart_fill //찜 상태라면 하트
                : CupertinoIcons.heart_slash_fill, // 찜 취소면 슬래쉬 하트
            color: isNowFavorite
                ? Colors.deepOrange.withValues(alpha: 0.8) // 찜 상태라면 투명도 0.8 뻘건색
                : Colors.grey.withValues(alpha: 0.8), // 찜 취소면 투명도 0.8 회색
            size: 100, // 애니 하트 크기
          ),
        ),
      ],
    );
  }
}
