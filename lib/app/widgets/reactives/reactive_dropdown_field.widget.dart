import 'package:flutter/material.dart';
import 'package:open_library/app/utils/input_decoration.utils.dart';
import 'package:open_library/app/widgets/containers/container.shimmer.widget.dart';
import 'package:open_library/core/values/validation.messages.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveDropDown<T> extends StatelessWidget{
  final String controlName;
  final List<DropdownMenuItem<T>> items;
  final String labelText;
  final String? hintText;
  final bool? isActive;
  final Widget? iconSuffix;
  final void Function(FormControl<T>)? onChanged;
  final InputDecoration? decoration;
  final String? isNotMatch;
  final double paddingAll;
  final Color? backgroundColor;
  final IconData? iconPrefix;
  final bool isLoading;
  final GestureTapCallback? onPrefixIconTap;
  final Color? secondaryColor;

  const CustomReactiveDropDown(
      this.controlName, {
        super.key,
        required  this.items,
        this.labelText = "",
        this.isActive,
        this.iconSuffix,
        this.decoration,
        this.isNotMatch,
        this.paddingAll = 10.0,
        this.onChanged,
        this.hintText,
        this.backgroundColor,
        this.iconPrefix,
        this.onPrefixIconTap,
        this.secondaryColor,
        this.isLoading=false
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(paddingAll),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(labelText,style: const TextStyle(fontWeight: FontWeight.w400)),
            isLoading
                ? CustomShimmer(height: 10)
                : Padding(
              padding:  EdgeInsets.only(top: 10),
              child: ReactiveDropdownField<T>(
                  items: items,
                  formControlName: controlName,
                  autofocus: false,
                  isExpanded: true,
                  style: TextStyle(color: Colors.black.withValues(alpha: 0.5)),
                  onChanged: onChanged,
                  readOnly: !(isActive ?? true),
                  validationMessages: validationMessages(equals: isNotMatch ?? ""),
                  focusNode: isActive != null ? AlwaysDisabledFocusNode() : null,
                  decoration: InputDecorationUtils.outLineText(hintText: hintText,
                      suffixIcon: iconSuffix)),
                )
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

