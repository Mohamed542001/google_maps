import '../src/app_export.dart';

class AppTextStyles {
  static TextStyle textStyle({
    Color? color,
    double? size,
    String? family,
    FontWeight? weight,
    List<Shadow>? shadow,
    double height = 1.3,
    bool? isDecorated = false,
    bool? isItalic = false,
  }) {
    return TextStyle(
      inherit: true,
      color: color ?? AppColors.black,
      fontSize: (size ?? 14).sp,
      fontFamily: family ?? 'Helvetica',
      fontWeight: weight ?? FontWeight.w400,
      height: height,
      fontStyle: isItalic! ? FontStyle.italic : null,
      decoration: isDecorated! ? TextDecoration.lineThrough : null,
      shadows: shadow,
      decorationColor: isDecorated ? AppColors.black : null,
    );
  }
}
