enum ButtonSizeType {
  small,
  medium,
  large,
}

double getButtonHeight(ButtonSizeType sizeType) {
  switch (sizeType) {
    case ButtonSizeType.small:
      return 32;
    case ButtonSizeType.medium:
      return 40;
    case ButtonSizeType.large:
      return 48;
  }
}