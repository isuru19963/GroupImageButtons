import 'package:flutter/material.dart';

class GroupCustomButton extends StatelessWidget {
  const GroupCustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.buttonImage,
    required this.isSelected,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.selectedColor,
    this.unselectedColor,
    this.borderRadius,
    this.selectedShadow,
    this.unselectedShadow,
    this.height,
    this.width,
    required this.textAlign,
    required this.textPadding,
    this.alignment,
    this.elevation,


  }) : super(key: key);

  final String text;
  final String buttonImage;
  final void Function()? onPressed;
  final bool isSelected;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? selectedShadow;
  final List<BoxShadow>? unselectedShadow;
  final double? height;
  final double? width;
  final TextAlign textAlign;
  final EdgeInsets textPadding;
  final AlignmentGeometry? alignment;
  final double? elevation;

  bool get isEnabled => onPressed != null;

  List<BoxShadow>? get _boxShadow => isSelected
      ? selectedShadow
      : isEnabled
          ? unselectedShadow
          : null;

  TextStyle? get _textStyle => isSelected
      ? selectedTextStyle
      : isEnabled
          ? unselectedTextStyle
          : null;

  Color? get _borderColor => isSelected
      ? selectedBorderColor ?? unselectedBorderColor
      : isEnabled
          ? unselectedBorderColor
          : null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(30),
        boxShadow: _boxShadow,
      ),
      child:
      Padding(
          padding: const EdgeInsets.only(
              top: 1, bottom: 1, left: 10,right: 10),
          child:Column(
            children: [
              SizedBox(
                width: 78,

                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          // const SizedBox(
                          //   width: 8,
                          // ),
                          Expanded(
                            child: new GestureDetector(
                              onTap: onPressed,
                              child: Container(
                                decoration: BoxDecoration(

                                    gradient: LinearGradient(
                                      colors: [Color(0xFF0BDA51),Color(0xFFFFF14F)],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),

                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Image.network(buttonImage,fit:BoxFit.fill),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 93, bottom: 1,),
                        child: Row(
                          children: <Widget>[
                            Text(text,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 12,

                                letterSpacing: 0.10,
                                // color: DesignCourseAppTheme.darkerText,
                              )
                              ,textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
      ),

      // ElevatedButton(
      //   onPressed: onPressed,
      //   style: ElevatedButton.styleFrom(
      //     elevation: elevation ?? 0.0,
      //     primary: _getBackGroundColor(theme),
      //     shape: _buildShape(),
      //     padding: (width != null || height != null) ? EdgeInsets.zero : null,
      //     alignment: (width != null || height != null) ? alignment : null,
      //   ),
      //   child: Padding(
      //     padding: textPadding,
      //     child: Text(
      //       text,
      //       textAlign: textAlign,
      //       style: _textStyle,
      //     ),
      //   ),
      // ),
    );
  }

  Color? _getBackGroundColor(ThemeData theme) {
    final themePrimaryColor = theme.buttonTheme.colorScheme?.primary;
    //TODO: implement
    // final themeSecondaryColor = theme.buttonTheme.colorScheme?.secondary;

    Color? selectedColorBuffer = selectedColor;
    Color? unselectedColorBuffer = unselectedColor;

    selectedColorBuffer ??= themePrimaryColor;
    selectedColorBuffer ??= Colors.black;

    unselectedColorBuffer ??= Colors.white;

    final color = isSelected
        ? selectedColorBuffer
        : isEnabled
            ? unselectedColorBuffer
            : null;
    return color;
  }

  OutlinedBorder? _buildShape() {
    final color = _borderColor;
    if (borderRadius != null) {
      return RoundedRectangleBorder(
        borderRadius: borderRadius!,
        side: buildBorderSide(color),
      );
    } else {
      return RoundedRectangleBorder(
        side: buildBorderSide(color),
      );
    }
  }

  BorderSide buildBorderSide(Color? color) {
    if (color != null) {
      return BorderSide(
        color: color,
      );
    }
    return BorderSide.none;
  }
}
