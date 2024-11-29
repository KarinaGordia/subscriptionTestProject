import 'package:flutter/material.dart';
import 'package:subscription_test/ui/theme/theme.dart';

class AdditionalInfoRow extends StatelessWidget {
  const AdditionalInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _AdditionalInfoTextButton(text: 'terms of use'),
        const _AdditionalInfoTextButton(text: 'policy privacy'),
        FilledButton(
          onPressed: () {},
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.slateBlue10),
            padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 10, horizontal: 16)),
          ),
          child: Text(
            'Restore purchase',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.white46),
          ),
        ),
      ],
    );
  }
}

class _AdditionalInfoTextButton extends StatelessWidget {
  const _AdditionalInfoTextButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: const ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 5)),
        visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: AppColors.white46),
      ),
    );
  }
}