// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ValidationType {
  location,
  phone,
  name,
  notEmpty,
  email,
  password,
  validationCode
}

class AppValidator {
  static FilteringTextInputFormatter priceValueOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));
  }

  static String? validateFields(
    String? value,
    ValidationType fieldType,
    BuildContext context,
  ) {
    if (value == null) {
      return "برجاء ملء هذا الحقل";
    } else if (fieldType == ValidationType.notEmpty) {
      if (value.trim().isEmpty || value.isEmpty) {
        return "برجاء ملء هذا الحقل";
      }
      return null;
    } else if (fieldType == ValidationType.name) {
      if (!RegExp(r'^[a-zA-zأ-ي\s]+$').hasMatch(value)) {
        return "برجاء إدخال اسم صحيح";
      }
      return null;
    } else if (fieldType == ValidationType.email) {
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        return "برجاء إدخال بريد إلكتروني صحيح";
      }
      return null;
    } else if (fieldType == ValidationType.phone) {
      if (value.trim().isEmpty || value.isEmpty) {
        return "أدخل رقم الهاتف";
      }
      /* if (!RegExp(r'^1[0125][0-9]{8}$').hasMatch(value)) {
        return Utils.translate(context)?.enter_valid_phone ?? '';
      }*/
      return null;
    } else if (fieldType == ValidationType.password) {
      if (value.length < 6) {
        return "كلمة السر يجب ان تحتوي علي 6 حروف او 6 ارقام علي الاقل";
      }
      return null;
    } else if (fieldType == ValidationType.validationCode) {
      if (value.isEmpty || value.length != 4) {
        return "أدخل رمز تحقق صحيح";
      }
      return null;
    }
    return null;
  }
}

String? validateField(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'هذا الحقل لا يمكن ان يكون فارغا.';
  }
  return null;
}

String? validatePhoneField(String? value) {
  if (value == null || value.isEmpty) {
    return "أدخل القيمة";
  }

  RegExp regex = RegExp(r'^[0-9]+$');
  if (!regex.hasMatch(value)) {
    return "أدخل أرقام فقط";
  }
  return null;
}
