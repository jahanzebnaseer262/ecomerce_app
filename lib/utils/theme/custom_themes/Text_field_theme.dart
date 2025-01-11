import 'package:flutter/material.dart';
 class TTextFormFieldTheme{
   TTextFormFieldTheme._();
   static InputDecorationTheme lightInputDecorationTheme= InputDecorationTheme(
     errorMaxLines: 3,
     prefixIconColor: Colors.grey,
     suffixIconColor: Colors.grey,
     labelStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.black),//Controls the style of the label text when the input field is inactive.
     hintStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.black),
     errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
     floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),//Determines the style of the label text when it floats (e.g., after focusing on the field or entering text).
     border: const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: const BorderSide(width: 1,color: Colors.grey),
     ),
     enabledBorder:  const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: const BorderSide(width: 1,color: Colors.grey),
     ),
     focusedBorder:  const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: const BorderSide(width: 1,color: Colors.black12),
     ),
     errorBorder: const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: const BorderSide(width: 1,color: Colors.red),
     ),
     focusedErrorBorder: const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: const BorderSide(width: 2,color: Colors.orange),
     ),
   );

   static InputDecorationTheme darkInputDecorationTheme= InputDecorationTheme(
     errorMaxLines: 3,
     prefixIconColor: Colors.grey,
     suffixIconColor: Colors.grey,
     labelStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.black),
     hintStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.black),
     errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
     floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
     border: const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: const BorderSide(width: 1,color: Colors.grey),
     ),
     enabledBorder:  const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: const BorderSide(width: 1,color: Colors.grey),
     ),
     focusedBorder:  const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: const BorderSide(width: 1,color: Colors.white),
     ),
     errorBorder: const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: const BorderSide(width: 1,color: Colors.red),
     ),
     focusedErrorBorder: const OutlineInputBorder().copyWith(
       borderRadius: BorderRadius.circular(14),
       borderSide: const BorderSide(width: 2,color: Colors.orange),
     ),
   );

 }