import 'package:flutter/material.dart';
import 'package:open_library/app/utils/extensors.dart';
import 'package:open_library/app/widgets/image_circle.widget.dart';
import 'package:open_library/app/widgets/text.widget.dart';
import 'package:open_library/core/values/paths.dart';
import 'package:open_library/core/values/text.styles.dart';
import 'package:open_library/data/models/entities/persons/person.model.dart';

class CustomPersonCard extends StatelessWidget{
  final PersonModel model;
  CustomPersonCard(this.model);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: model.imagePath!=null
            ? CustomImageCircle.file(
              url: model.imagePath!.path,
              radius: 25)
            :CustomImageCircle.assets(
            url: Paths.profileNone,
            radius: 25),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText("${model.name} ${model.surnameFirst} ${model.surnameSecond}",style: titleMedium),
            CustomText(model.id.toString(),style: bodyMedium),
          ]),
        subtitle: Column(children: [
          Divider(),
          _containerBody(context, "Correo electrónico:",model.email),
          _containerBody(context, "Fecha nacimiento:","${DateTime.parse(model.dateOfBirth).formatInSpanish()} (Edad ${model.age})"),
          _containerBody(context, "Teléfono:",model.phone),
          _containerBody(context, "Genero:",model.gender),
          _containerBody(context, "Edad: ",model.age.toString())
        ]))
    );
  }

 Widget _containerBody(BuildContext context,String title,String value){
    return  Row(
      textBaseline: TextBaseline.alphabetic,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 5,
      children: [
        CustomText(title,
            isScaleDown: true,
            style: bodyMedium.apply(color: Theme.of(context).primaryColorDark.withValues(alpha: 1))),
        Flexible(child: CustomText(value,style: bodyMedium,
            textOverflow: TextOverflow.clip,
            isScaleDown: true,
            maxLines: 1, textAlign: TextAlign.right))
      ]);
 }

}