import 'package:flutter/material.dart';
import 'package:nendoroid_db/feature/_common/component/icon/check_icon.dart';
import 'package:nendoroid_db/feature/_common/component/icon/pre_order_icon.dart';
import 'package:nendoroid_db/feature/_common/component/icon/wish_icon.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';

class OpacityToggleButton extends StatelessWidget {
  const OpacityToggleButton({
    super.key,
    required this.onTap,
    required this.isActive,
    required this.text,
    this.icon,
  });

  final bool isActive;
  final VoidCallback onTap;
  final Widget? icon;
  final String text;

  factory OpacityToggleButton.wish({
    required VoidCallback onTap,
    required NendoData nendoData,
  }) {
    return OpacityToggleButton(
      onTap: onTap,
      isActive: nendoData.wish,
      text: '위시',
      icon: const WishIcon(size: 15),
    );
  }

  factory OpacityToggleButton.have({
    required VoidCallback onTap,
    required NendoData nendoData,
  }) {
    return OpacityToggleButton(
      onTap: onTap,
      isActive: nendoData.have,
      text: '보유',
      icon: const CheckIcon(size: 15),
    );
  }

  factory OpacityToggleButton.preOrder({
    required VoidCallback onTap,
    required NendoData nendoData,
  }) {
    return OpacityToggleButton(
      onTap: onTap,
      isActive: nendoData.preOrder,
      text: '예약',
      icon: const PreOrderIcon(size: 15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            if (icon != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Opacity(
                    opacity: isActive ? 1 : 0.5,
                    child: icon,
                  ),
                  const SizedBox(width: 5.0),
                ],
              ),
            Opacity(
              opacity: isActive ? 1 : 0.5,
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
