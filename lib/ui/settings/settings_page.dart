import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:waterreminder/bloc/water_bloc.dart';
import 'package:waterreminder/ui/settings/rolling_switch_button.dart';
import 'package:waterreminder/util/dialog.dart';
import 'package:waterreminder/util/num_extension.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<WaterBloc>();
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: 32 + 64 + 40, top: 32.0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(width: double.infinity),
              Text(
                "Configurações",
                style: theme.textTheme.headline4,
              ),
              SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.only(left: 6, right: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Text("Lembretes"),
                    ),
                    RollingSwitchButton(
                      value: bloc.state.alarmEnabled,
                      colorOff: theme.errorColor,
                      onChange: (value) => bloc.changeAlarmEnabled(value),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              TextButton(
                onPressed: () => showConsumptionDialog(context),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                      theme.primaryColor.withOpacity(0.06)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Consumo diário",
                          style: theme.textTheme.bodyText2,
                        ),
                      ),
                      Text(
                        bloc.state.recommendedMilliliters.asMilliliters(),
                        style: theme.textTheme.bodyText2
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => clearDataStore(context),
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        theme.errorColor.withOpacity(0.06)),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Hard Reset",
                        style: theme.textTheme.bodyText2?.copyWith(
                          color: theme.errorColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> clearDataStore(BuildContext context) async {
    final confirmed = await showConfirmationDialog(
      context,
      title: "Hard Reset",
      content:
          "Está prestes a reinicializar todos os dados da aplicação. Esta ação não pode ser desfeita.",
    );
    if (confirmed) {
      context.read<WaterBloc>().clearDataStore();
    }
  }
}
