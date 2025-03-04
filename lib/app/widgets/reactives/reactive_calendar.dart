import 'package:flutter/material.dart';
import 'package:open_library/app/widgets/text.widget.dart';
import 'package:open_library/core/values/globals.dart';
import 'package:open_library/core/values/text.styles.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomReactiveCalendar extends StatelessWidget {
  final String formControlName;
  final bool enableDateAfterNow;
  final bool enableDateBeforeNow;

  const CustomReactiveCalendar( this.formControlName,{super.key, this.enableDateAfterNow=true, this.enableDateBeforeNow=true});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<DateTime, DateTime>(
      formControlName: formControlName,
      builder: (field) =>
        TableCalendar(
            firstDay:enableDateBeforeNow ?DateTime.utc(1900, 3, 14):DateTime.now(),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: field.value??DateTime.now(),
            calendarFormat: CalendarFormat.month,
            rangeSelectionMode: RangeSelectionMode.disabled,
            selectedDayPredicate: (day) =>isSameDay(field.value, day),
            onDaySelected: (selectedDay, focusedDay) => field.didChange(selectedDay),
            locale: 'es_ES',
            weekNumbersVisible: false,
            onHeaderTapped: (focusedDay) async {
              final newDate = await _selectMonthAndYear(context, focusedDay);
              if (newDate != null) {
                field.didChange(newDate); // Actualiza el valor del formulario reactivo
              }
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronIcon:  Icon(Icons.arrow_back_ios, color: labelLarge.color),
              rightChevronIcon:  Icon(Icons.arrow_forward_ios, color: labelLarge.color),
              titleTextStyle: labelLarge),
            calendarStyle:  CalendarStyle(
              isTodayHighlighted: true,
              todayDecoration: const BoxDecoration(color: Globals.backgroundColor, shape: BoxShape.circle),
              selectedDecoration: BoxDecoration(color: Theme.of(context).primaryColor, shape: BoxShape.circle))));
  }

  Future<DateTime?> _selectMonthAndYear(BuildContext context, DateTime focusedDay) async {
    int selectedYear = focusedDay.year;
    int selectedMonth = focusedDay.month;

    return await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
         backgroundColor: Globals.backgroundColor,
          title: const Text('Selecciona mes y año'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Selector de año
              DropdownButton<int>(
                value: selectedYear,
                items: List.generate(126, (index) => 1900 + index)
                    .map((year) => DropdownMenuItem(
                  value: year,
                  child: Text(year.toString()),
                ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    selectedYear = value;
                  }
                },
              ),
              // Selector de mes
              DropdownButton<int>(
                value: selectedMonth,
                items: List.generate(12, (index) => index + 1)
                    .map((month) => DropdownMenuItem(
                  value: month,
                  child: Text(
                    _getMonthName(month), // Nombre del mes
                  ),
                ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    selectedMonth = value;
                  }
                },
              ),
            ]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Cancelar
              child:  CustomText('Cancelar',style: titleSmall),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(DateTime(selectedYear, selectedMonth));
              },
              child: CustomText('Aceptar',style: titleSmall.apply(color: Globals.primaryColor)),
            ),
          ],
        );
      },
    );
  }

// Método auxiliar para obtener el nombre del mes
  String _getMonthName(int month) {
    const months = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre',
    ];
    return months[month - 1];
  }

}