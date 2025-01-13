import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/constants/assets_repo.dart';

class MenuAppBar extends StatelessWidget {
  const MenuAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Menu',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SvgPicture.asset(AssetsRepo.searchIcon),
      ],
    );
  }
}
