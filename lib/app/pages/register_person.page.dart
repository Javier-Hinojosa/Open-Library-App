import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:open_library/app/providers/register_person.provider.dart';
import 'package:open_library/app/services/navigation.service.dart';
import 'package:open_library/app/utils/config.utils.dart';
import 'package:open_library/app/utils/dialog.utils.dart';
import 'package:open_library/app/utils/input_decoration.utils.dart';
import 'package:open_library/app/utils/widget_extensions.dart';
import 'package:open_library/app/widgets/appbar/app_bar.widget.dart';
import 'package:open_library/app/widgets/buttons/button.widget.dart';
import 'package:open_library/app/widgets/buttons/icon_button.widget.dart';
import 'package:open_library/app/widgets/image_circle.widget.dart';
import 'package:open_library/app/widgets/reactives/reactive_dropdown_field.widget.dart';
import 'package:open_library/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:open_library/app/widgets/text.widget.dart';
import 'package:open_library/core/values/globals.dart';
import 'package:open_library/core/values/keys.dart';
import 'package:open_library/core/values/paths.dart';
import 'package:open_library/core/values/text.styles.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';


class RegisterPersonPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: CustomAppBar(),
     body: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         CustomText("Registrar usuario",style: titleLarge),
           SizedBox(height: 40),
           Consumer<RegisterPersonProvider>(
               builder: (context, provider, child) {
                 return ReactiveForm(formGroup: provider.form, child: Column(
                     children: [
                       Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: _containerImage(context, provider)),
              Flexible(child: CustomReactiveTextField(
                  paddingAll: 5,
                  labelText: "Nombre",
                  hintText: "Ej: Juan",
                  Keys.name))
            ]),
                       Row(
              children: [
                Flexible(
                  flex: 3,
                  child: CustomReactiveTextField(
                      paddingAll: 5,
                      labelText: "Apellido Paterno",
                      hintText: "Ej: Pérez",
                      Keys.lastName),
                ),
                Flexible(
                    flex: 3,
                    child: CustomReactiveTextField(
                        paddingAll: 5,
                        labelText: "Apellido Materno",
                        hintText: "Ej: García",
                        Keys.surname))
              ]),
                       CustomReactiveTextField(
              Keys.email,
              paddingAll: 5,
              labelText: "Correo",
              hintText: "Ej: james.madison@examplepetstore.com"),
                       Row(
              children: [
                Flexible(
                    flex: 4,
                    child: CustomReactiveDropDown(
                        Keys.gender,
                        labelText: "Género",
                        hintText: "Ej: Masculino",
                        paddingAll: 5,
                        items: [
                          DropdownMenuItem(value: "Male",child: CustomText("Masculino",maxLines: 1)),
                          DropdownMenuItem(value: "Female",child: CustomText("Femenino",maxLines: 1)),
                          DropdownMenuItem(value: "Other",child: CustomText("Otro",maxLines: 1))
                        ])),
                Flexible(
                    flex: 7,
                    child: _phoneReactive(
                        keyName: Keys.phone,
                        labelText: "Telefóno",
                        hintText: "Ej: 5512345678",
                        onChanged: (phone) => provider.form.control(Keys.phone).value=phone.completeNumber
                    ))
              ]),
                       Row(
              children: [
                Flexible(
                    flex: 4,
                    child: CustomReactiveTextField(Keys.dateOfBirth,
                        isActive: false,
                        paddingAll: 5,
                        labelText: "Fecha de nacimiento",
                        hintText: "DD/MM/AA",
                        onTap: (w) async => await DialogUtils.dialogReactiveCalendar(context,
                            enableDateAfterNow: false,
                            enableDateBeforeNow:true,
                            formGroup:  provider.form,
                            formControlName: Keys.dateOfBirth).whenComplete(() {
                          if(provider.form.control(Keys.dateOfBirth).value!=null){
                            DateTime date = provider.form.control(Keys.dateOfBirth).value;
                            if(date.isBefore(DateTime.now()))
                              provider.form.control(Keys.age).value = ConfigUtils.calculateAge(date);
                            else
                              provider.form.control(Keys.dateOfBirth).markAllAsTouched();
                          }
                        }))),
                Flexible(
                    flex: 2,
                    child: CustomReactiveTextField(
                        Keys.age,
                        paddingAll: 5,
                        isActive:false,
                        labelText: "Edad",
                        hintText: "Ej: 18"))
              ]),
                       SizedBox(height: 20),
                       Align(
            alignment: Alignment.centerRight,
            child: CustomButton(
              height: MediaQuery.of(context).size.height*0.05,
              width: MediaQuery.of(context).size.width*0.4,
              title: "Guardar",
            onPressed: provider.isValidForm
                ? () => provider.registerPerson(context)
                : null))
                     ]));
               })
       ])).paddingAll(20));
  }

  Widget _phoneReactive({required String keyName, String labelText = "", String? hintText="", void Function(PhoneNumber)? onChanged}){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(labelText,style: TextStyle(fontWeight: FontWeight.w400)),
          IntlPhoneField(
              decoration: InputDecorationUtils.outLineText(hintText: hintText),
              initialCountryCode: 'MX',
              pickerDialogStyle: PickerDialogStyle(
                  backgroundColor: Theme.of(NavigationService.context).scaffoldBackgroundColor),
              invalidNumberMessage: "Número Telefónico Invalido",
              onChanged: onChanged).paddingOnly(top: 10)
        ]).paddingAll(5);
  }
  Widget _containerImage(BuildContext context,RegisterPersonProvider provider) {
    return Stack(
        children: [
          if(provider.selectedFile==null)
            CustomImageCircle.assets(
                url: Paths.profileNone,
                radius: 65)
          else
            CustomImageCircle.file(
                url: provider.selectedFile!.path,
                radius: 65),
          Positioned(
              right: 1,
              bottom: 1,
              child: Container(
                  padding: const EdgeInsets.all(2),
                  constraints:  BoxConstraints(
                      minWidth: 12,
                      minHeight: 12),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.1,
                      height: MediaQuery.of(context).size.height*0.05,
                      child:  CustomIconButton(
                          onPressed: ()=>provider.pickImage(),
                          icon: Icons.edit,
                          backgroundColor: Globals.secondaryColor))))
        ]);
 }

}