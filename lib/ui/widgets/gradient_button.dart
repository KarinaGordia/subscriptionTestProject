import 'package:flutter/material.dart';
import 'package:subscription_test/ui/theme/theme.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key, required this.text, required this.onPressed, this.size,
  });

  final String text;
  final void Function()? onPressed;
  final WidgetStateProperty<Size?>? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(29.0)),
        gradient: LinearGradient(
          colors: [
            AppColors.slateBlue,
            AppColors.lavenderGray,
          ],
        ),
      ),
      child: FilledButton(
        style: ButtonStyle(
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(29.0),
              ),
            ),
          ),
          minimumSize: size,
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}