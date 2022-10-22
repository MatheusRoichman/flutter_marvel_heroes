import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/utils.dart';
import '../typography/typography.dart';
import 'buttons_config.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final bool isLoading;
  final VoidCallback? onTap;
  final double width;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isDisabled;
  final ButtonSizeType sizeType;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.isLoading = false,
    this.onTap,
    this.width = 150,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.isDisabled = false,
    this.sizeType = ButtonSizeType.medium,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool isPressed = false;
  late double height;

  @override
  void initState() {
    super.initState();
    height = getButtonHeight(widget.sizeType);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setState(() => isPressed = true),
      onTapUp: (details) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: !widget.isDisabled ? widget.onTap : null,
      child: Container(
        height: height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: _buttonColor,
        ),
        child: widget.isLoading ? _buttonLoading : _buttonContent,
      ),
    );
  }

  Color get _buttonColor {
    if (widget.isDisabled) {
      return ThemeColors.primaryGrey;
    } else if (isPressed) {
      return darken(Colors.blue);
    }

    return Colors.blue;
  }

  Widget get _buttonLoading {
    return Center(
      child: SizedBox(
        height: height / 2,
        width: height / 2,
        child: CircularProgressIndicator(
          color: ThemeColors.primaryWhite,
          strokeWidth: height / 15,
        ),
      ),
    );
  }

  Widget get _buttonContent {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.prefixIcon ?? const SizedBox(),
        if (widget.prefixIcon != null) const SizedBox(width: 8),
        Center(
          child: _getTextWidget(
            widget.text,
            ThemeColors.primaryWhite,
          ),
        ),
        if (widget.suffixIcon != null) const SizedBox(width: 8),
        widget.suffixIcon ?? const SizedBox(),
      ],
    );
  }

  Text _getTextWidget(String text, Color color) {
    switch (widget.sizeType) {
      case ButtonSizeType.small:
        return Text(
          text,
          maxLines: widget.maxLines,
          style: TTypography.description.merge(TextStyle(color: color)),
        );
      case ButtonSizeType.medium:
        return Text(
          text,
          maxLines: widget.maxLines,
          style: TTypography.description.merge(TextStyle(color: color)),
        );
      case ButtonSizeType.large:
        return Text(
          text,
          maxLines: widget.maxLines,
          style: TTypography.description.merge(TextStyle(color: color)),
        );
    }
  }
}
