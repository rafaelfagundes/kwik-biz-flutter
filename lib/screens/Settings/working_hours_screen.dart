import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';
import 'package:kwik_biz_flutter/widgets/DefaultScreen/default_screen.dart';
import 'package:kwik_biz_flutter/widgets/Dropdown/custom_dropdown_button.dart';
import 'package:kwik_biz_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_biz_flutter/widgets/custom_card.dart';
import 'package:kwik_biz_flutter/widgets/custom_sized_box.dart';
import 'package:kwik_biz_flutter/widgets/custom_text_field.dart';
import 'package:kwik_biz_flutter/widgets/label_and_switch_widget.dart';

enum DeliveryFeeType { ALWAYS_OPEN, CUSTOM }

class DayAndTimes {
  final bool isEnabled;
  final String dayName;
  final DateTime start;
  final DateTime end;

  DayAndTimes({
    @required this.isEnabled,
    @required this.dayName,
    @required this.start,
    @required this.end,
  });
}

class WorkingHoursScreen extends StatefulWidget {
  @override
  _WorkingHoursScreenState createState() => _WorkingHoursScreenState();
}

class _WorkingHoursScreenState extends State<WorkingHoursScreen> {
  Map workingHoursTypes = {
    'Sempre Aberto': DeliveryFeeType.ALWAYS_OPEN,
    'Personalizar': DeliveryFeeType.CUSTOM,
  };
  String selectedValue = 'Sempre Aberto';

  Map timeTable = {
    'dom': DayAndTimes(
      isEnabled: true,
      dayName: 'Domingo',
      start: DateTime.now(),
      end: DateTime.now(),
    ),
    'seg': DayAndTimes(
      isEnabled: true,
      dayName: 'Segunda',
      start: DateTime.now(),
      end: DateTime.now(),
    ),
    'ter': DayAndTimes(
      isEnabled: true,
      dayName: 'Terça',
      start: DateTime.now(),
      end: DateTime.now(),
    ),
    'qua': DayAndTimes(
      isEnabled: true,
      dayName: 'Quarta',
      start: DateTime.now(),
      end: DateTime.now(),
    ),
    'qui': DayAndTimes(
      isEnabled: true,
      dayName: 'Quinta',
      start: DateTime.now(),
      end: DateTime.now(),
    ),
    'sex': DayAndTimes(
      isEnabled: true,
      dayName: 'Sexta',
      start: DateTime.now(),
      end: DateTime.now(),
    ),
    'sab': DayAndTimes(
      isEnabled: true,
      dayName: 'Sábado',
      start: DateTime.now(),
      end: DateTime.now(),
    ),
  };

  void _enableDisableDay(String day, bool value) {
    Map _timeTable = Map.from(timeTable);
    _timeTable[day] = DayAndTimes(
      dayName: _timeTable[day].dayName,
      end: _timeTable[day].end,
      start: _timeTable[day].start,
      isEnabled: value,
    );

    setState(() {
      timeTable = _timeTable;
    });
  }

  void _setStartOrEndTime(String day, String value, bool isStart) {
    Map _timeTable = Map.from(timeTable);

    setState(() {
      timeTable = _timeTable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScreen('Horários', children: [
      CustomSizedBox(heightSize: 1),
      CustomCard(
        title: 'Horário de Funcionamento',
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: CustomDropdownButton(
                options:
                    workingHoursTypes.keys.map((e) => e.toString()).toList(),
                value: selectedValue,
                setValue: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
      if (selectedValue == 'Personalizar')
        Column(
          children: <Widget>[
            ...timeTable.keys.map(
              (e) => Column(
                children: <Widget>[
                  CustomSizedBox(heightSize: 2),
                  DayCard(
                    title: timeTable[e].dayName,
                    isEnabled: timeTable[e].isEnabled,
                    onSwitched: (value) {
                      _enableDisableDay(e, value);
                    },
                    onStartHourChanged: (value) {
                      _setStartOrEndTime(e, value, true);
                    },
                    onEndHourChanged: (value) {
                      _setStartOrEndTime(e, value, false);
                    },
                    startHour: timeTable[e].start,
                    endHour: timeTable[e].end,
                  ),
                ],
              ),
            ),
          ],
        ),
      CustomSizedBox(heightSize: 3),
      CustomButtonWidget(
        buttonType: ButtonType.CALL_TO_ACTION_ALTERNATIVE,
        buttonText: 'Salvar',
        onPressed: null,
      ),
    ]);
  }
}

class DayCard extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final Function onSwitched;
  final Function onStartHourChanged;
  final Function onEndHourChanged;
  final DateTime startHour;
  final DateTime endHour;

  const DayCard({
    Key key,
    @required this.title,
    @required this.onSwitched,
    @required this.onStartHourChanged,
    @required this.onEndHourChanged,
    @required this.isEnabled,
    @required this.startHour,
    @required this.endHour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var startInput =
        TextEditingController(text: DateFormat('hh:mm').format(startHour));
    var endInput =
        TextEditingController(text: DateFormat('hh:mm').format(endHour));

    return CustomCard(
      child: Column(
        children: <Widget>[
          CustomSizedBox(heightSize: 1.5),
          LabelAndSwitchWidget(
              value: isEnabled, onChanged: onSwitched, label: title),
          CustomSizedBox(heightSize: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: CustomTextField(
                  labelText: 'Hora Inicial',
                  onChanged: onStartHourChanged,
                  controller: startInput,
                )),
                CustomSizedBox(widthSize: 2),
                Expanded(
                    child: CustomTextField(
                  labelText: 'Hora Final',
                  onChanged: onEndHourChanged,
                  controller: endInput,
                )),
              ],
            ),
          ),
          CustomSizedBox(heightSize: 2),
        ],
      ),
    );
  }
}
