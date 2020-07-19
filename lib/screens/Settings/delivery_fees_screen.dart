import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';
import 'package:kwik_biz_flutter/utils/theme_utils.dart';
import 'package:kwik_biz_flutter/widgets/DefaultScreen/default_screen.dart';
import 'package:kwik_biz_flutter/widgets/Dropdown/custom_dropdown_button.dart';
import 'package:kwik_biz_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_biz_flutter/widgets/custom_card.dart';
import 'package:kwik_biz_flutter/widgets/custom_dialog.dart';
import 'package:kwik_biz_flutter/widgets/custom_sized_box.dart';
import 'package:kwik_biz_flutter/widgets/custom_text.dart';
import 'package:kwik_biz_flutter/widgets/custom_text_field.dart';

enum DeliveryFeeType { FREE, SINGLE_FEE, TABLE }

class DeliveryFeesScreen extends StatefulWidget {
  @override
  _DeliveryFeesScreenState createState() => _DeliveryFeesScreenState();
}

class _DeliveryFeesScreenState extends State<DeliveryFeesScreen> {
  Map deliveryFeeTypes = {
    'Grátis': DeliveryFeeType.FREE,
    'Tabelada': DeliveryFeeType.TABLE,
    'Taxa Única': DeliveryFeeType.SINGLE_FEE,
  };
  String selectedValue = 'Grátis';

  @override
  Widget build(BuildContext context) {
    bool isDark = ThemeUtils.isDark(context);

    return DefaultScreen('Taxas', children: [
      CustomSizedBox(heightSize: 1),
      CustomCard(
        title: 'Taxa de entrega',
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: CustomDropdownButton(
                options:
                    deliveryFeeTypes.keys.map((e) => e.toString()).toList(),
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
      if (selectedValue == 'Taxa Única')
        Column(
          children: <Widget>[
            CustomSizedBox(heightSize: 2),
            CustomCard(
              title: 'Taxa Única',
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextField(
                  labelText: 'Valor R\$',
                ),
              ),
            ),
          ],
        ),
      if (selectedValue == 'Tabelada')
        Column(
          children: <Widget>[
            CustomSizedBox(heightSize: 2),
            CustomCard(
              title: 'Tabela',
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: DataTable(
                        columnSpacing: 8,
                        headingRowHeight: 32,
                        dataRowHeight: 40,
                        horizontalMargin: 16,
                        columns: <DataColumn>[
                          DataColumn(
                            label: CustomText(
                              'LOCAL',
                              size: 11,
                            ),
                          ),
                          DataColumn(
                            label: CustomText(
                              'VALOR',
                              size: 11,
                            ),
                          ),
                          DataColumn(
                            label: CustomText(
                              '',
                              size: 11,
                            ),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(cells: [
                            DataCell(
                              CustomText(
                                'Tijuco',
                                size: 12,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                'R\$ 5,00',
                                size: 12,
                              ),
                            ),
                            DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RemoveButton(
                                    onPressed: null,
                                  ),
                                ]))
                          ]),
                          DataRow(cells: [
                            DataCell(
                              CustomText(
                                'Guarda-Mor',
                                size: 12,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                'R\$ 7,00',
                                size: 12,
                              ),
                            ),
                            DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RemoveButton(
                                    onPressed: null,
                                  ),
                                ]))
                          ]),
                          DataRow(cells: [
                            DataCell(
                              CustomText(
                                'Colônia do Marçal',
                                size: 12,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                'R\$ 6,50',
                                size: 12,
                              ),
                            ),
                            DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RemoveButton(
                                    onPressed: null,
                                  ),
                                ]))
                          ]),
                        ],
                      ),
                    ),
                    CustomButtonWidget(
                      buttonText: 'Adicionar Local',
                      buttonType: ButtonType.CONFIRMATION,
                      buttonFillType: ButtonFillType.EMPTY,
                      onPressed: () {
                        CustomDialog.showDialog(
                          context,
                          title: 'Novo Local',
                          content: Material(
                            color: Colors.transparent,
                            child: Container(
                                child: Column(
                              children: <Widget>[
                                CustomSizedBox(heightSize: 2),
                                CustomTextField(labelText: 'Local'),
                                CustomSizedBox(heightSize: 2),
                                CustomTextField(labelText: 'Valor (R\$)'),
                                CustomSizedBox(heightSize: 2),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: CustomButtonWidget(
                                        buttonText: 'Cancelar',
                                        buttonFillType: ButtonFillType.EMPTY,
                                        buttonType: ButtonType.CANCEL,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                    CustomSizedBox(widthSize: 2),
                                    Expanded(
                                      child: CustomButtonWidget(
                                        buttonText: 'Adicionar',
                                        buttonFillType: ButtonFillType.FILLED,
                                        buttonType: ButtonType.CONFIRMATION,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                          ),
                          hasOkButton: false,
                        );
                      },
                      // icon: SFSymbols.plus_circle_fill,
                    )
                  ],
                ),
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

class RemoveButton extends StatelessWidget {
  final Function onPressed;

  const RemoveButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = ThemeUtils.isDark(context);
    return GestureDetector(
      onTap: onPressed,
      child: Icon(SFSymbols.xmark_circle_fill,
          color: Colors.red[isDark ? 400 : 800]),
    );
  }
}
