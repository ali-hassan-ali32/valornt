import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valornt/providers/main_provider.dart';
import 'package:valornt/widgets/agent_list_builder.dart';
import 'package:valornt/widgets/custom_backGround.dart';
import 'package:valornt/widgets/map_list_builder.dart';
import 'package:valornt/widgets/weaponListBuilder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return const CustomBackground(
      childWidget: CurrentTap(),
    );
  }
}

class CurrentTap extends StatelessWidget {
  const CurrentTap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<MainProvider, int>(
      selector: (p0, p1) => p1.sourceIndex,
      builder: (context, currentTapIndex, child) {
        switch(currentTapIndex) {
          case 0:
            return const AgentListBuilder();
          case 1:
            return const MapListBuilder();
          default:
            return const WeaponListBuilder();
        }
      },
    );
  }
}



List<Color> hexToColorList(List<String> hexStrings) {
  return hexStrings.map((hexString) {
    return Color(int.parse(hexString, radix: 16));
  }).toList();
}

