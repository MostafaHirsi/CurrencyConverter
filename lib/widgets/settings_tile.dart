import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function()? onTap;
  const SettingsTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(title),
          ),
          subtitle: Text(
            subTitle,
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
        const Divider(
          endIndent: 16,
          indent: 16,
        )
      ],
    );
  }
}
