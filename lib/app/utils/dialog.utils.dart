import 'package:flutter/material.dart';
import 'package:open_library/app/services/navigation.service.dart';
import 'package:open_library/app/utils/widget_extensions.dart';
import 'package:open_library/app/widgets/buttons/button.widget.dart';
import 'package:open_library/app/widgets/reactives/reactive_calendar.dart';
import 'package:open_library/app/widgets/text.widget.dart';
import 'package:open_library/core/values/text.styles.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DialogUtils {

  static Future<bool> screen(BuildContext context, { required Widget child, Color? backgroundColor,double height=0.59, AlignmentGeometry alignment=Alignment.topCenter}) async {
    try{
      return await showDialog(
          context: context,
          barrierDismissible: true,
          useSafeArea: true,
          builder: (context) =>
              Dialog(
                  elevation: 0,
                  alignment: alignment,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  insetPadding: const EdgeInsets.all(0),
                  backgroundColor: backgroundColor,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      height: MediaQuery.of(context).size.height * height,
                      child: Material(
                          color: backgroundColor,
                          child: Column(
                              children: [
                                Align(alignment: Alignment.topRight,
                                    child: IconButton(
                                        icon: const Icon(Icons.close_outlined, color: Colors.black,size: 32),
                                        onPressed: ()=> NavigationService.goBack())),
                                Expanded(child: child)
                              ]).paddingAll(10)))));
    }catch(e){
      return true;
    }
  }

  static Future<bool> dialogReactiveCalendar(BuildContext context,
      { required  FormGroup formGroup,
        required String formControlName,
        bool enableDateAfterNow=true,
        bool enableDateBeforeNow=true,
        String? label
      }) {
    return DialogUtils.screen(
        context,
        height: 0.7,
        child: ListView(
            shrinkWrap: true,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText("Calendario", style: titleLarge)),
              CustomText(label??"Selecciona una Fecha",
                  textAlign: TextAlign.start,
                  style: bodyMedium.apply(color: Theme.of(context).disabledColor)),
              ReactiveForm(
                  formGroup: formGroup,
                  child: CustomReactiveCalendar(
                      formControlName,
                      enableDateAfterNow: enableDateAfterNow,
                      enableDateBeforeNow: enableDateBeforeNow)),
              Container(padding: const EdgeInsets.all(10)),
              Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: CustomButton(
                          title: "Aceptar",
                          height: MediaQuery.of(context).size.height*0.05,
                          width: MediaQuery.of(context).size.width*0.4,
                          backgroundColor: Colors.black,
                          onPressed: () => NavigationService.goBack())))
            ]));
  }
}
