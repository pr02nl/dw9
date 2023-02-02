import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  final int amount;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const DeliveryIncrementDecrementButton({
    super.key,
    required this.amount,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: onDecrement,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '-',
                style: context.textStyles.textMedium
                    .copyWith(fontSize: 22, color: Colors.grey),
              ),
            ),
          ),
          Text(
            '$amount',
            style: context.textStyles.textRegular
                .copyWith(fontSize: 17, color: context.colors.secondary),
          ),
          InkWell(
            onTap: onIncrement,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '+',
                style: context.textStyles.textRegular
                    .copyWith(fontSize: 22, color: context.colors.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
