part of 'widgets.dart';

class TextFormat extends StatelessWidget {
  final String value;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final int maxLine;

  TextFormat(
    this.value, {
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.fontStyle,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine ?? 2,
      textAlign: textAlign ?? TextAlign.start,
      softWrap: true,
      style: GoogleFonts.poppins(
        color: fontColor ?? null,
        fontSize: fontSize ?? 38.ssp,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontStyle: fontStyle ?? FontStyle.normal,
      ),
    );
  }
}
