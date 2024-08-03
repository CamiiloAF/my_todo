import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/extensions/build_context_extensions.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: context.screenHeight * 0.15),
          SvgPicture.asset('assets/images/empty_task_list.svg', height: 400),
          Text(
            'No tasks were found',
            style: context.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
