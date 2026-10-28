import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_dimensions.dart';

class SettingsSectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSectionCard({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppDimensions.sectionHeaderPadding,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: context.octave.text2,
              letterSpacing: 0.2,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Material(
            color: context.octave.surface1,
            borderRadius:
                BorderRadius.circular(AppDimensions.sectionCardRadius),
            clipBehavior: Clip.antiAlias,
            child: Column(children: children),
          ),
        ),
      ],
    );
  }
}

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimensions.dividerIndent),
      child: Container(
        height: AppDimensions.dividerHeight,
        color: context.octave.separator,
      ),
    );
  }
}
