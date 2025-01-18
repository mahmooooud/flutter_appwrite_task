import 'package:flutter/material.dart';
import 'package:flutter_appwrite_task/core/common/extension/context.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainContainer extends StatelessWidget {
  MainContainer(
      {Key? key,
      this.child,
      this.borderRadius,
      this.color,
      this.height,
      this.shadowColorGrey,
      this.width,
      this.border,
      this.offset1,
      this.padding,
      this.margin,
      this.offset2,
      this.elevation = true,
      this.decoration,
      this.blurR})
      : super(key: key);
  Widget? child;
  BorderRadius? borderRadius;
  double? height;
  double? width;
  double? blurR;
  Color? color;
  Color? shadowColorGrey;
  Border? border;
  Offset? offset1;
  Offset? offset2;
  BoxDecoration? decoration;

  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  final bool? elevation;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(16.r),
      margin: margin,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: height,
      width: width ?? double.infinity,
      decoration: decoration ??
          BoxDecoration(
              color: color ?? context.colors.white,
              border: border,
              borderRadius: borderRadius ?? BorderRadius.circular(16.r),
              boxShadow: elevation == null
                  ? []
                  : [
                      BoxShadow(
                          color: context.colors.backGroundColorGrey
                              .withOpacity(.04),
                          spreadRadius: 0,
                          offset: const Offset(0, 1),
                          blurRadius: blurR ?? 0),
                    ]),
      child: child,
    );
  }
}
