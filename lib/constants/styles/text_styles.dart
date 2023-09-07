import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:investo/constants/styles/colors.dart';

class Kstyles {
  //*----------------------------(fontweight : w400 )------------------------
  //Todo-------------------------(Regular category)---------------------
  //*----------------------------(fontweight : w400 )-------------------------
  Text reg12(
      {required String text,
      Color color = kWhite,
      double? height,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: color,
          height: height),
    );
  }

  Text reg10(
      {required String text,
      Color color = kWhite,
      double? height,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: color,
          height: height),
    );
  }

  Text reg14(
      {required String text,
      Color color = kWhite,
      double? height,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: color,
          height: height),
    );
  }

  Text reg16(
      {required String text,
      Color color = kWhite,
      double? height,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: color,
          height: height),
    );
  }

  Text reg18(
      {required String text,
      Color color = kWhite,
      double? height,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: color,
          height: height),
    );
  }

  //*----------------------------(fontweight : w500 )------------------------
  //Todo-------------------------(med category)---------------------
  //*----------------------------(fontweight : w500 )-------------------------
  Text med12(
      {required String text,
      Color color = kWhite,
      double? height,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: color,
          height: height),
    );
  }

  Text med13(
      {required String text,
      Color color = kWhite,
      TextOverflow overflow = TextOverflow.ellipsis,
      double? height,
      int? maxLine,
      TextAlign? textAlign}) {
    return Text(
      overflow: overflow,
      maxLines: maxLine,
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: color,
          height: height),
    );
  }

  Text med14(
      {required String text,
      Color color = kWhite,
      double? height,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: color,
          height: height),
    );
  }

  Text med16(
      {required String text,
      Color color = kWhite,
      double? height,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: color,
          height: height),
    );
  }

  Text med18(
      {required String text,
      Color color = kWhite,
      double? height,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: color,
          height: height),
    );
  }

  Text med24(
      {required String text,
      Color color = kWhite,
      double? height,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          color: color,
          height: height),
    );
  }

  Text med28(
      {required String text,
      Color color = kWhite,
      double? height,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          color: color,
          height: height),
    );
  }

  //*----------------------------(fontweight : w600 )------------------------
  //Todo-------------------------(semibold category)---------------------
  //*----------------------------(fontweight : w600 )-------------------------
  Text semiBold20(
      {required String text,
      Color color = kWhite,
      double? height,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: color,
          height: height),
    );
  }
}
