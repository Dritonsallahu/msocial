
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


getDefaultFont({double? fontSize, Color? color,FontWeight? fontWeight,double? height,List<Shadow>? shadow}){
  // return GoogleFonts.ibmPlexSansThai(fontSize: fontSize,color: color,fontWeight: fontWeight,height: height,shadows: shadow);
  return GoogleFonts.hindVadodara(fontSize: fontSize,color: color,fontWeight: fontWeight,height: height,shadows: shadow);
}

getOpenSansFont({double? fontSize, Color? color,FontWeight? fontWeight,double? height,List<Shadow>? shadow}){
  return GoogleFonts.openSans(fontSize: fontSize,color: color,fontWeight: fontWeight,height: height,shadows: shadow);
}