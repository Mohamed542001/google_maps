import '../../src/app_export.dart';

class NoResult extends StatelessWidget {
  const NoResult({Key? key, this.mainAxisAlignment})
      : super(key: key);
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        Image.asset(ImageConstants.resultImage,width: 120.w,height: 120.h,),
        Gap(20.h),
        Text(
          'No Elements',
          style: AppTextStyles.textStyle(
            color: AppColors.white,
            size: 18,
            weight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
