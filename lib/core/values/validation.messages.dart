import 'package:reactive_forms/reactive_forms.dart';

Map<String, String Function(Object)>? validationMessages({int? minLength, int? maxLength,String? equals="No Hay coincidencia"}) =>
    {
      ValidationMessage.required: (e) => 'El campo se encuentra vacío',
      ValidationMessage.pattern: (e) => "Formato Invalido",
      ValidationMessage.min:(e) => minLength != null
          ? "Mínimo $minLength Caracteres"
          : "Mínimo de Caracteres",
      ValidationMessage.minLength: (e) => minLength != null
          ? "Mínimo $minLength Caracteres"
          : "Mínimo de Caracteres",
      ValidationMessage.max:(e) => maxLength != null
          ? "Valor Máximo de $maxLength"
          : "Valor máximo excedido",
      ValidationMessage.maxLength: (e) => maxLength != null
          ? "Máximo $maxLength Caracteres"
          : "Máximo de Caracteres",
      ValidationMessage.number: (e) => "Solo se Admiten Números en Unidad",
      ValidationMessage.email: (e) => "Ingrese un correo válido",
      ValidationMessage.equals: (e)=> equals??"No Hay coincidencia",
      ValidationMessage.compare: (e)=> "No hay coicidencia"
    };