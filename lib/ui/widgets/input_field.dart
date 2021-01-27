part of 'widgets.dart';

/// Custom Input Field with validate functional
///
/// * Function `validateInput` must return type data `Map<String, dynamic>`
/// * Type data Map must have key `'isValid'` with type data `boolean` for checking if is valid
/// * Type data Map must have key `'errorMessage'` with type data `String` for showing message when is not valid
///
/// If [TextInputType] is [visiblePassword] it will generate button to show the secure text to plain text
///
class InputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String hint;
  final Map<String, dynamic> Function(String) validateInput;
  final int maxInput;
  final int maxLine;
  final bool isInputEnable;
  final Color textColor;
  final double textSize;
  final Widget prefixIcon;
  final Widget suffixIcon;

  InputField({
    @required this.controller,
    this.hint,
    @required this.inputType,
    this.validateInput,
    this.maxInput,
    this.isInputEnable,
    this.maxLine,
    this.textColor,
    this.textSize,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  _InputFieldState createState() => _InputFieldState(
        this.controller,
        this.hint,
        this.inputType,
        this.validateInput,
        this.maxInput,
        this.isInputEnable,
        this.maxLine,
        this.textColor,
        this.textSize,
        this.prefixIcon,
        this.suffixIcon,
      );
}

class _InputFieldState extends State<InputField> {
  final TextEditingController controller;
  final TextInputType inputType;
  final String hint;
  final Map<String, dynamic> Function(String) validateInput;
  final int maxInput;
  final int maxLine;
  final bool isEnable;
  final Color textColor;
  final double textSize;
  final Widget prefixIcon;
  final Widget suffixIcon;

  bool isValid = true;
  bool isObscureText = true;
  String errorMessage = "";

  _InputFieldState(
    this.controller,
    this.hint,
    this.inputType,
    this.validateInput,
    this.maxInput,
    this.isEnable,
    this.maxLine,
    this.textColor,
    this.textSize,
    this.prefixIcon,
    this.suffixIcon,
  );

  void setObsecureText() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      maxLength: maxInput ?? null,
      enabled: isEnable ?? true,
      maxLines: maxLine ?? 1,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: textSize ?? 14,
        fontFamily: "OpenSans",
      ),
      obscureText:
          (inputType == TextInputType.visiblePassword) ? isObscureText : false,
      onChanged: (value) {
        Map<String, dynamic> data = validateInput(value);
        setState(() {
          isValid = data['isValid'] ?? true;
          errorMessage = data['errorMessage'] ?? "";
        });
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: inputBackgroundColor,
        labelText: hint ?? "",
        errorText: (isValid) ? null : errorMessage,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: inputBackgroundColor),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greenColor),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: InputBorder.none,
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFamily: "OpenSans",
        ),
        prefixIcon: prefixIcon ?? null,
        suffixIcon: (inputType == TextInputType.visiblePassword)
            ? GestureDetector(
                onTap: setObsecureText,
                child: (isObscureText)
                    ? Icon(MdiIcons.eye)
                    : Icon(MdiIcons.eyeOff),
              )
            : suffixIcon ?? null,
      ),
    );
  }
}
