import 'package:flutter/material.dart';
import 'package:kooha_test/export.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, store, child) {
        List<Map<String, dynamic>> items = Mock.navItems();

        return SizedBox(
          height: 100,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                4,
                (index) => _NavItem(
                  icon: items[index]['icon'],
                  title: items[index]['label'],
                  isSelected: store.navIndex == index,
                  onPressed: () => store.navIndex = index,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSelected,
    this.onPressed,
  }) : super(key: key);

  final String icon;
  final String title;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();

    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            color: isSelected ? theme.primaryText : theme.grey,
          ),
          10.verticalSpace,
          SecondaryText(
            text: title,
            color: isSelected ? theme.primaryText : theme.grey,
          ),
        ],
      ),
    );
  }
}
