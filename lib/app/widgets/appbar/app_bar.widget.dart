import 'package:flutter/material.dart';
import 'package:open_library/app/services/navigation.service.dart';
import 'package:open_library/app/utils/widget_extensions.dart';
import 'package:open_library/app/widgets/buttons/icon_button.widget.dart';
import 'package:open_library/app/widgets/text.widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key, this.surfaceTintColor,this.onBack,this.trailing});

  final Color?  surfaceTintColor;
  final List<Widget>? trailing;
  final void Function()? onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        surfaceTintColor: surfaceTintColor,
        automaticallyImplyLeading: true,
        elevation: 0,
        actions: trailing,
        leadingWidth: MediaQuery.of(context).size.width*0.3,
        leading: GestureDetector(
          onTap: onBack??()=>NavigationService.goBack(),
          child: Row(
            children: [
              CustomIconButton(),
              CustomText("Atras")
            ]).paddingAll(5),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);


}