
import 'package:google_maps/core/src/app_export.dart';

class InputFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final FormFieldSetter<dynamic>? onSave, onChanged;
  final Function()? onSubmit;
  final List<TextInputFormatter>? inputFormatters;

  final int? maxLines, maxLength;
  final IconData? icon;
  final TextAlign? textAlign;
  final Widget? suffixIcon, prefix;
  final TextEditingController? controller;
  final String? upperText, initialValue, hint;
  final bool? hasLabel,
      isNext,
      isRTL,
      multiLine,
      isRequired,
      secure,
      isNumber,
      enabled,
      readOnly;
  final double horizontalMargin, radius, verticalMargin;
  final Color? enabledBorderColor,
      fillColor,
      iconColor,
      labelColor,
      textColor,
      hintColor,
      focusedBorder;
  final Iterable<String>? autofillHints;
  final bool? isObscureText;

  const InputFormField({
    Key? key,
    this.textAlign,
    this.inputFormatters,
    this.isObscureText,
    this.prefix,
    this.isNumber = false,
    this.controller,
    this.maxLines = 1,
    this.onSave,
    this.secure = false,
    this.hint = '',
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.onTap,
    this.isNext = true,
    this.maxLength,
    this.upperText,
    this.hasLabel = false,
    this.isRTL = true,
    this.icon,
    this.hintColor = Colors.grey,
    this.horizontalMargin = 0,
    this.verticalMargin = 7,
    this.multiLine = false,
    this.fillColor,
    this.textColor = Colors.grey,
    this.labelColor,
    this.radius = 10,
    this.iconColor = Colors.white,
    this.enabledBorderColor,
    this.initialValue,
    this.enabled,
    this.isRequired,
    this.readOnly = false,
    this.focusedBorder = const Color(0xff3788e6),
    this.autofillHints, this.onSubmit,
  }) : super(key: key);

  @override
  _InputFormFieldState createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  bool? _showPassword;

  @override
  void initState() {
    _showPassword = widget.secure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(widget.radius);

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: widget.verticalMargin, horizontal: widget.horizontalMargin),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.upperText != null)
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Text(
                  widget.upperText ?? "",
                  style: AppTextStyles.textStyle(),
                ),
              ),
            SizedBox(
              child: TextFormField(
                textAlign: widget.textAlign ??
                    (TextAlign.start),
                inputFormatters: widget.inputFormatters,
                autofillHints: widget.autofillHints,
                onTap: widget.onTap,
                readOnly: widget.readOnly!,
                initialValue: widget.initialValue,
                textDirection: widget.isRTL!
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                onEditingComplete: widget.onSubmit,
                controller: widget.controller,
                obscureText: _showPassword ?? false,
                onSaved: widget.onSave,
                onChanged: widget.onChanged,
                maxLength: widget.maxLength,
                textInputAction: widget.multiLine!
                    ? TextInputAction.newline
                    : widget.isNext!
                    ? TextInputAction.next
                    : TextInputAction.done,
                keyboardType: widget.multiLine!
                    ? TextInputType.multiline
                    : widget.isNumber!
                    ? TextInputType.number
                    : TextInputType.emailAddress,
                //cursorColor: primaryColor,
                validator: widget.validator,
                maxLines: widget.maxLines,
                enabled: widget.enabled,
                buildCounter: (context,
                    {required currentLength,
                      required isFocused,
                      maxLength}) =>
                null,
                style: AppTextStyles.textStyle(
                  color: widget.textColor ?? AppColors.backgroundColor,
                ),
                decoration: InputDecoration(
                    fillColor: widget.fillColor ?? AppColors.backgroundColor,
                    filled: true,
                    hintTextDirection: widget.isRTL!
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    hintStyle: AppTextStyles.textStyle(
                        color: widget.hintColor ?? AppColors.backgroundColor, size: 15),
                    labelStyle: AppTextStyles.textStyle(
                        color: widget.labelColor ?? AppColors.backgroundColor,
                        size: 15),
                    counterStyle:
                    const TextStyle(fontSize: 5, color: Colors.transparent),
                    prefix: widget.prefix,
                    prefixIcon: widget.icon == null
                        ? null
                        : Icon(widget.icon, color: widget.iconColor, size: 14),
                    suffixIcon: widget.suffixIcon ??
                        (widget.secure!
                            ? IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          padding: const EdgeInsets.all(0),
                          icon: Image.asset(
                            _showPassword!
                                ? ImageConstants.password
                                : ImageConstants.eye,
                            // color: AppColors.backgroundColor,
                            width: 20.w,
                            height: 20.w,
                          ),
                          onPressed: () => setState(
                                () => _showPassword = !_showPassword!,
                          ),
                        )
                            : null),
                    hintText: widget.hasLabel! ? null : widget.hint,
                    labelText: widget.hasLabel! ? widget.hint : null,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: widget.maxLines == 1 ? 10 : 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius,
                      borderSide:  BorderSide(color: AppColors.backgroundColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: borderRadius,
                      borderSide:  BorderSide(color: AppColors.backgroundColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: borderRadius,
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: borderRadius,
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius,
                      borderSide: const BorderSide(color: Colors.grey),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}