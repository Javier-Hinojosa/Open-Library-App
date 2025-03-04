import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_library/app/utils/input_decoration.utils.dart';
import 'package:open_library/core/values/validation.messages.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextField extends StatelessWidget {
  final String controlName;
  final String labelText;
  final String? hintText;
  final TextInputType? keyboard;
  final int? maxLength;
  final int? minLength;
  final int? maxLines;
  final int? minLines;
  final bool isPass;
  final bool isActive;
  final Color? labelColor;
  final Widget? iconSuffix;
  final void Function(FormControl<dynamic>)? onSubmitted;
  final void Function(FormControl<dynamic>)? onChanged;
  final void Function(FormControl<dynamic>)? onTap;
  final TextEditingController textEditing = TextEditingController(text: "");
  final InputDecoration? decoration;
  final String? isNotMatch;
  final double paddingAll;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final IconData? iconPrefix;
  final GestureTapCallback? onPrefixIconTap;
  final Color? secondaryColor;



  CustomReactiveTextField(
      this.controlName, {
        super.key,
        this.labelText = "",
        this.isActive=true,
        this.maxLength,
        this.minLength,
        this.onSubmitted,
        this.iconSuffix,
        this.maxLines,
        this.minLines,
        this.labelColor,
        this.isPass = false,
        this.decoration,
        this.isNotMatch,
        this.keyboard,
        this.paddingAll = 10.0,
        this.inputFormatters,
        this.onChanged,
        this.hintText,
        this.fillColor,
        this.iconPrefix,
        this.onPrefixIconTap,
        this.secondaryColor,
        this.onTap
      });

  @override
  Widget build(BuildContext context) {
    var themeDefault =  Colors.black;
    return Padding(
      padding: EdgeInsets.all(paddingAll),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(labelText,maxLines: 2, style:  TextStyle(color: labelColor, fontWeight: FontWeight.w400)),
          Padding(
            padding:  EdgeInsets.only(top: !isActive?5:10),
            child: ReactiveTextField(
              onTap: onTap,
              formControlName: controlName,
              textInputAction: TextInputAction.next,
              controller: textEditing,
              autofocus: false,
              textAlign: TextAlign.left,
              autocorrect: false,
              onSubmitted: onSubmitted,
              onChanged: onChanged,
              scribbleEnabled: isActive,
              style: TextStyle(color: !isActive?themeDefault.withValues(alpha: 0.5):null),
              enableInteractiveSelection: isActive,
              readOnly: !isActive,
              inputFormatters: inputFormatters,
              decoration: InputDecorationUtils.outLineText(hintText: hintText, suffixIcon: iconSuffix),
              textCapitalization: inputFormatters != null ? TextCapitalization.characters : TextCapitalization.none,
              enableIMEPersonalizedLearning: false,
              enableSuggestions: true,
              focusNode: isActive?null:AlwaysDisabledFocusNode(), //cursor disable
              maxLines: maxLines ?? 1,
              minLines: minLines ?? 1,
              maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
              maxLength: maxLength,
              buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
              validationMessages: validationMessages(minLength: minLength, maxLength: maxLength, equals: isNotMatch ?? ""),
              keyboardType: keyboard,
              obscureText: isPass,
              clipBehavior: Clip.none,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              showCursor: true))
        ]));
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
  @override
  bool get skipTraversal => true;
  @override
  bool get canRequestFocus => true;
}



