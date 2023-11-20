class Article {
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  bool isLiked = false;

  Article(this.title, this.image, this.comments, this.likes, this.isLiked,
      this.location, this.shares, this.author);
}

List<Article> articles = [
  Article(
      'Japan\'s second largest metropolitan area',
      'https://c4.wallpaperflare.com/wallpaper/490/528/841/landscape-mountains-sunlight-japan-wallpaper-preview.jpg',
      100,
      32000,
      true,
      'Osaka Japan',
      50,
      'Hussain Mustafa'),
  Article(
      'Known as the sleepless town for obvious reasons',
      'https://c4.wallpaperflare.com/wallpaper/717/182/326/night-lights-buildings-railway-station-wallpaper-preview.jpg',
      300,
      50000,
      true,
      'Kabuikicho Japan',
      1250,
      'Tim Salvatore'),
  Article(
      'Japan\'s second largest metropolitan area',
      'https://www.bhmpics.com/downloads/neon-street-background-Wallpapers/5.street_neon_night_city_139596_1920x1080.jpg',
      200,
      10000,
      true,
      'Tokyo Japan',
      1000,
      'Ely Marya'),
];
