
/// onBoard class


class OnBoard{
  final String image;
  final String title;
  final String description;
  final String? imageDarkTheme;

   OnBoard({
    required this.image,
    required this.title,
    this.description = '',
    this.imageDarkTheme,
});
}

