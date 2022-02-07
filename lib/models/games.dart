import 'package:shared_preferences/shared_preferences.dart';

class Game {
  final String imageUrl;
  final String title;
  final String gameUrl;
  Game(
    this.title,
    this.imageUrl,
    this.gameUrl,
  );
}

List<Game> favoriteGames = [];

List<String> get favoriteGamesTitle {
  return favoriteGames.map((e) => e.title).toList();
}

Future<void> saveFavorites() async {
  // print('save favorites is called');
  final prefs = await SharedPreferences.getInstance();
  // print(favoriteGamesTitle);
  prefs.setStringList('favoriteTitles', favoriteGamesTitle);
}

Future<void> fetchFavorites() async {
  // print('fetch favorites is called');
  final prefs = await SharedPreferences.getInstance();
  final fetchedFavTitles = prefs.getStringList('favoriteTitles');
  favoriteGames = games
      .where((element) => fetchedFavTitles.contains(element.title))
      .toList();
  // print(fetchedFavTitles);
}

bool isGameFavorite(String title) {
  return favoriteGames.any((element) => element.title == title);
}

void toggleFavorite(String title) {
  int index = favoriteGames.indexWhere((element) => element.title == title);
  if (index != -1) {
    favoriteGames.removeAt(index);
  } else {
    favoriteGames.add(games.firstWhere((element) => element.title == title));
  }
  saveFavorites();
}

List<Game> games = [
  Game(
    'Flip Bottle',
    'https://play-lh.googleusercontent.com/QHM9aWQmL7WOI3MhOG0GEbJzkuQY8iVSY3Adj6J2TlN7mXGNupPF5s2qsjmrECgRvA',
    'https://www.agame.com/game/flip-bottle',
  ),
  Game(
    'Plane Fight',
    'https://static.gamezop.com/H1IEpMJP917/300x250.png',
    'https://www.gamezop.com/g/H1IEpMJP917?id=v6aDz0bon',
  ),
  Game(
    'Ludo With Friends',
    'https://static.gamezop.com/SkhljT2fdgb/300x250.png',
    'https://www.gamezop.com/g/SkhljT2fdgb?id=v6aDz0bon',
  ),
  Game(
    'Sticky Goo',
    'https://static.gamezop.com/rJJMVIa8p-x/300x250.png',
    'https://www.gamezop.com/g/rJJMVIa8p-x?id=v6aDz0bon',
  ),
  Game(
    'Carrom Hero',
    'https://static.gamezop.com/H1Hgyn6XqAS/300x250.png',
    'https://www.gamezop.com/g/H1Hgyn6XqAS?id=v6aDz0bon',
  ),
  Game(
    'Bottle Shoot',
    'https://static.gamezop.com/B1fSpMkP51m/300x250.png',
    'https://www.gamezop.com/g/B1fSpMkP51m?id=v6aDz0bon',
  ),
  Game(
    'Tic Tac Toe',
    'https://static.gamezop.com/H1WmafkP9JQ/300x250.png',
    'https://www.gamezop.com/g/H1WmafkP9JQ?id=v6aDz0bon',
  ),
  Game(
    'Tower Twist',
    'https://static.gamezop.com/HJT46GkPcy7/300x250.png',
    'https://www.gamezop.com/g/HJT46GkPcy7?id=v6aDz0bon',
  ),
  Game(
    'Kingdom Fight',
    'https://static.gamezop.com/SyfxJ3a75Cr/300x250.png',
    'https://www.gamezop.com/g/SyfxJ3a75Cr?id=v6aDz0bon',
  ),
  Game(
    'Chess Masters',
    'https://static.gamezop.com/rkAXTzkD5kX/300x250.png',
    'https://www.gamezop.com/g/rkAXTzkD5kX?id=v6aDz0bon',
  ),
  Game(
    'Fruit Chop',
    'https://static.gamezop.com/rkWfy2pXq0r/300x250.png',
    'https://www.gamezop.com/g/rkWfy2pXq0r?id=v6aDz0bon',
  ),
  Game(
    'Dribble Kings',
    'https://static.gamezop.com/SkJf58Ouf0/300x250.png',
    'https://www.gamezop.com/g/SkJf58Ouf0?id=v6aDz0bon',
  ),
  Game(
    'Snake King',
    'https://static.gamezop.com/ryTknTX5AS/300x250.png',
    'https://www.gamezop.com/g/ryTknTX5AS?id=v6aDz0bon',
  ),
  Game(
    'Enchanted Waters',
    'https://static.gamezop.com/HJskh679Cr/300x250.png',
    'https://www.gamezop.com/g/HJskh679Cr?id=v6aDz0bon',
  ),
  Game(
    'Snakes & Ladders',
    'https://static.gamezop.com/rJWyhp79RS/300x250.png',
    'https://www.gamezop.com/g/rJWyhp79RS?id=v6aDz0bon',
  ),
  Game(
    'Fireboy and Watergirl',
    'https://images.crazygames.com/games/fireboy-and-watergirl-the-forest-temple/cover-1586285142530.jpg?auto=format,compress&q=75&cs=strip&ch=DPR&w=1200&h=630&fit=crop',
    'https://www.agame.com/game/fireboy-and-watergirl-the-forest-temple',
  ),
  Game(
    'Dumb ways to die',
    'https://play-lh.googleusercontent.com/aSji1uIDWOUx-ZjFlPEsQzg5Ofb6oWSPyOBUYLmYzqQazv7C7n8S3Y_5JMh_tj8Zfc-O',
    'https://www.agame.com/game/dumb-ways-to-die-original',
  ),
  Game(
    'Cricket Gunda',
    'https://static.gamezop.com/BkzmafyPqJm/300x250.png',
    'https://www.gamezop.com/g/BkzmafyPqJm?id=v6aDz0bon',
  ),
  Game(
    'Knight Ride',
    'https://static.gamezop.com/rkYbNLTIT-x/300x250.png',
    'https://www.gamezop.com/g/rkYbNLTIT-x?id=v6aDz0bon',
  ),
  Game(
    'Om Nom Run',
    'https://i.ytimg.com/vi/UvHw7arwqZQ/maxresdefault.jpg',
    'https://www.crazygames.com/game/om-nom-run',
  ),
  Game(
    'Knife Flip',
    'https://static.gamezop.com/H1PJn6mqAr/300x250.png',
    'https://www.gamezop.com/g/H1PJn6mqAr?id=v6aDz0bon',
  ),
  Game(
    'Colour Chase',
    'https://static.gamezop.com/B1JBaM1D9y7/300x250.png',
    'https://www.gamezop.com/g/B1JBaM1D9y7?id=v6aDz0bon',
  ),
  Game(
    'Ohh1',
    'https://superdevresources.com/wp-content/uploads/2014/09/oh-hi-puzzle-game.jpg',
    'https://0hh1.com/',
  ),
  Game(
    'Hanger',
    'https://api.web.gamepix.com/assets/img/600/340/banner/hanger.png',
    'https://www.agame.com/game/hanger',
  ),
  Game(
    'Pull the Pin',
    'https://imag.malavida.com/mvimgbig/download-fs/pull-the-pin-25808-1.jpg',
    'https://www.crazygames.com/game/pull-pin',
  ),
  Game(
    'Quento',
    'https://quento.com/img/icon.png',
    "https://quento.com/game/",
  ),
  Game(
    'Cut the Rope Time Travel',
    'https://lh3.googleusercontent.com/8Yoo_S_VD8-g2Td4sx-MQenSX2ZFm2-SPmaIG9BbAyiLQSYwxzR-ar6js6QJBClX9WE0eGNzMlHhW9zgyC-_ofUL0g=w640-h400-e365-rj-sc0x00ffffff',
    'https://www.crazygames.com/game/cut-the-rope-time-travel',
  ),
  Game(
    'Adam and eve Zombies',
    'https://i.ytimg.com/vi/NFUoBeaYy8k/maxresdefault.jpg',
    'https://www.crazygames.com/game/adam-and-eve-zombies',
  ),
  Game(
    'Sudoku',
    'https://static.gamezop.com/SJgx126Qc0H/300x250.png',
    'https://www.gamezop.com/g/SJgx126Qc0H?id=v6aDz0bon',
  ),
  Game(
    'Will Hero',
    'https://images.crazygames.com/games/will-hero-online/thumb-1564051926318.png?auto=format,compress&q=75&cs=strip&ch=DPR&w=1200&h=630&fit=crop',
    'https://www.crazygames.com/game/will-hero-online',
  ),
  Game(
    'Johnny Revenge',
    'https://img.gamedistribution.com/699fec3ebc2e4f4c92f5ebd26ce195ce-512x512.jpeg',
    'https://www.agame.com/game/johnny-revenge',
  ),
  Game(
    'Penalty Shooters',
    'https://tcf.admeen.org/game/15500/15004/400x246/penalty-shooters.jpg',
    'https://www.crazygames.com/game/penalty-shooters-2',
  ),
  Game(
    'Pebble Boy',
    'https://static.gamezop.com/H1TbVUa8aWe/300x250.png',
    'https://www.gamezop.com/g/H1TbVUa8aWe?id=v6aDz0bon',
  ),
  Game(
    'Truck Loader',
    'https://i.ytimg.com/vi/WnyfWEmzFDk/maxresdefault.jpg',
    'https://www.agame.com/game/truck-loader-5',
  ),
  Game(
    'Line Puzzle',
    'https://images-eu.ssl-images-amazon.com/images/I/81GcIRVM5yL.png',
    'https://www.agame.com/game/line-puzzle',
  ),
  Game(
    'Missile Game',
    'https://lh4.ggpht.com/cQu-klK6DdZ2FpalLOA_nI1qnLemzJpGn_KI0u8Cju539pv2Lm_d_hS2NQzCspswGXHawYe-PhPUeG_3V0riFZ2f8w83tdtu9AFCPw',
    'https://missile-game.bwhmather.com/',
  ),
  Game(
    'Knife Smash',
    'https://lh3.googleusercontent.com/nbvHS86hSzVO1NVmY5KZG9AK8-1G2h-Uf9Ti54QBEvxYr3u0DICEmgRzaZabZJmIaKXAxAaJS3f7B2fWDYG55JyuEA=w640-h400-e365-rj-sc0x00ffffff',
    'https://www.agame.com/game/knife-smash-',
  ),
  Game(
    'Conduct This',
    'https://i.ytimg.com/vi/hTsHbLc88yU/maxresdefault.jpg',
    'https://www.agame.com/game/conduct-this',
  ),
  Game(
    'Happy Glass',
    'https://miro.medium.com/max/512/1*SOrhgaiP7486cPFNnSfYpQ.png',
    'https://www.agame.com/game/happy-glass-2',
  ),
  Game(
    'Moto X3',
    'https://images.crazygames.com/games/moto-x3m/cover-1586173923704.jpeg?auto=format,compress&q=75&cs=strip&ch=DPR&w=1200&h=630&fit=crop',
    'https://www.agame.com/game/moto-x3m-3',
  ),
  Game(
    'Little Alchemy 2',
    'https://littlealchemy2.com/static/img/little-alchemy-2-fb-thumbnail.jpg',
    'https://littlealchemy2.com/',
  ),
  Game(
    'X type',
    'https://phoboslab.org/content/assets/xtype.png',
    'https://phoboslab.org/xtype/',
  ),
  Game(
    'Stickman Army-Defenders',
    'https://img.poki.com/cdn-cgi/image/quality=78,width=600,height=600,fit=cover,g=0.5x0.5,f=auto/96b20dbdfd2599d007a4678483d6e6e7.png',
    'https://www.agame.com/game/stickman-army-the-defenders',
  ),
  Game(
    'Mini Golf Master',
    'https://gamefabrique.com/storage/screenshots/pc/mini-golf-master-03.png',
    'https://www.agame.com/game/mini-golf-master',
  ),
  Game(
    'City Cricket',
    'https://static.gamezop.com/HJP4afkvqJQ/300x250.png',
    'https://www.gamezop.com/g/HJP4afkvqJQ?id=v6aDz0bon',
  ),
  Game(
    'Xibalba',
    'https://phoboslab.org/content/assets/xibalba.png',
    'https://phoboslab.org/xibalba/',
  ),
  Game(
    'Adam eve 4',
    'https://i.ytimg.com/vi/JnwkxwLJZfI/hqdefault.jpg',
    'https://www.crazygames.com/game/adam-and-eve-',
  ),
  Game(
    'Solitare Gold',
    'https://static.gamezop.com/rkPlk2T7qAr/300x250.png',
    'https://www.gamezop.com/g/rkPlk2T7qAr?id=v6aDz0bon',
  ),
  Game(
    '2048 solitare',
    'https://www.mindgames.com/uploaded/thumb/2048-solitaire.jpg',
    'https://www.crazygames.com/game/2048-solitaire',
  ),
  Game(
    'Bubble Wipeout',
    'https://static.gamezop.com/H1AN6fkwqJ7/300x250.png',
    'https://www.gamezop.com/g/H1AN6fkwqJ7?id=v6aDz0bon',
  ),
  Game(
    'Oh nO',
    'https://play-lh.googleusercontent.com/Jd70ZjweyOh6e3yELgU2IB5o8r_gkf1EGKmWO3tp9s-tgxkfiI5rkYEel9wUfFhFWE4=w720-h310-rw',
    'https://0hn0.com/',
  ),
  Game(
    'Hetrix',
    'https://superdevresources.com/wp-content/uploads/2014/09/hextris-open-source-web-game.png',
    'https://hextris.io/',
  ),
  Game(
    'HexGl',
    'https://image.winudf.com/v2/image/Y29tLndoZXhnbDJfc2NyZWVuc2hvdHNfMV81OThhYTc4OQ/screen-1.jpg?h=355&fakeurl=1&type=.jpg',
    'https://hexgl.bkcore.com/play/',
  ),
  Game(
    'Colonist.io',
    'https://colonist.io/dist/images/screenshot.png',
    'https://colonist.io/',
  ),
  Game(
    'Line Rider',
    'https://www.researchgate.net/profile/James-Landay/publication/251524250/figure/fig1/AS:298078994223108@1448078978128/Line-Rider-is-a-popular-game-with-simple-graphics-but-rich-animation-and-interactivity.png',
    'https://www.linerider.com/',
  ),
  Game(
    'Quick, Draw!',
    'https://cdn.vox-cdn.com/thumbor/nbI705BGP7Mz6r6S7PdhYMP2GWE=/0x0:1185x747/920x0/filters:focal(0x0:1185x747):format(webp):no_upscale()/cdn.vox-cdn.com/uploads/chorus_asset/file/7475709/Screen_Shot_2016_11_15_at_12.05.46_PM.png',
    'https://quickdraw.withgoogle.com/',
  ),
  Game(
    'Emoji Game',
    'https://images-na.ssl-images-amazon.com/images/I/81sHfdB9myL.png',
    'https://www.agame.com/game/emoji-game',
  ),
  Game(
    'Kung fu fight',
    'https://static.play123.in/game-images/kung-fu-fight-beat-em-up_big.jpg',
    'https://www.agame.com/game/kung-fu-fight-beat-em-up',
  ),
  Game(
    'Z type',
    'https://phoboslab.org/content/assets/ztype.jpg',
    'https://zty.pe/',
  ),
  Game(
    'Stacky Run',
    'https://www.bestgames.com/thumb/Stacky-Run.jpg',
    'https://www.agame.com/game/stacky-run',
  ),
  Game(
    'Basketball Stars',
    'https://play-lh.googleusercontent.com/dzSm_krwhYzsLayp-_0QKU9w5NQyTunMH3y62Ad0O6uI6g-WNT29AcfNJlrpOj_bEwY',
    'https://www.crazygames.com/game/basketball-stars-2019',
  ),
  Game(
    'Draw Rider',
    'https://cdn.kiz10.com/upload/thumbnails/mediums/13585/draw-rider_.webp',
    'https://www.agame.com/game/draw-rider',
  ),
  Game(
    'Threes',
    'https://venturebeat.com/wp-content/uploads/2014/03/threes_ss_19.png',
    'http://play.threesgame.com/',
  ),
  Game(
    'Garctic',
    'https://gartic.io/static/images/thumb.png?v=10',
    'https://gartic.io/',
  ),
  Game(
    'Zombies can\'t Jump',
    'https://static.gamezop.com/rkxMV8TI6Wg/300x250.png',
    'https://www.gamezop.com/g/rkxMV8TI6Wg?id=v6aDz0bon',
  ),
  Game(
    'Stickman Archer',
    'https://i.ytimg.com/vi/q8cAYGYvLPs/maxresdefault.jpg',
    'https://www.agame.com/game/stickman-archer-2',
  ),
  Game(
    'Bio Lab',
    'https://lh6.ggpht.com/OFtdgmIYiYWEjcozzEoHHWA4__0VitkpoJ13OhzwWqHTzLQOVaFgUJtOgBgwl2VbhTxLqPo7Dc3A-UqNENqpMnAKxz9_3kI4JS0X',
    'https://playbiolab.com/',
  ),
  Game(
    'Super Buddy Kick',
    'https://img.gamedistribution.com/09399bfcb6e8462b873a6154b506ea99-512x512.jpeg',
    'https://www.agame.com/game/super-buddy-kick',
  ),
  Game(
    'Google\'s Packman',
    'http://lh3.googleusercontent.com/H8hhcUas7f9Pi4aMLTQfSTVk1wwE1d_SPYYGldXn9S8GARJis2ED4EpnIfXzfBhTP8KZM64bFnmgowpU3Ct7b7OznwcRakNOM3mB2KRr=s660',
    'https://www.google.com/logos/2010/pacman10-i.html',
  ),
  Game(
    'Snail Bob',
    'https://d2e111jq13me73.cloudfront.net/sites/default/files/styles/review_gallery_thumbnail_large/public/screenshots/csm-game/snail-bob-1-min.jpg?itok=UPfwru6u',
    'https://www.agame.com/game/snail-bob',
  ),
  Game(
    'Cut the Rope: Experiments',
    'https://i.ytimg.com/vi/m-_sVF44R7A/hqdefault.jpg',
    'https://www.crazygames.com/game/cut-the-rope-experiments',
  ),
  Game(
    'Fun Escape 3D',
    'https://cdn.kiz10.com/upload/thumbnails/mediums/13481/fun-escape-3d_.webp',
    'https://www.agame.com/game/fun-escape-3d',
  ),
  Game(
    'Stickman Skate',
    'https://images-eu.ssl-images-amazon.com/images/I/7157pNW58HL.png',
    'https://www.agame.com/game/stickman-skate',
  ),
  Game(
    'Paper Flight',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Paper_Airplane.png/290px-Paper_Airplane.png',
    'https://www.agame.com/game/paper-flight',
  ),
  Game(
    'Zig Zag',
    'https://static.packt-cdn.com/products/9781849691369/graphics/1369_01_08.jpg',
    'http://www.crazygames.com/game/zigzag',
  ),
  Game(
    'Apple Shooter',
    'https://assets.funnygames.org/5/3735/56597/440x280/apple-shooter.jpg',
    'https://www.agame.com/game/apple-shooter',
  ),
  Game(
    'Swooop',
    'https://blog.playcanvas.com/wp-content/uploads/2014/03/swooop_blog.jpg',
    'https://playcanv.as/p/JtL2iqIH/',
  ),
  Game(
    'Candy Fiesta',
    'https://static.gamezop.com/r1zG1h6m90H/300x250.png',
    'https://www.gamezop.com/g/r1zG1h6m90H?id=v6aDz0bon',
  ),
  Game(
    'Aqua Park',
    'https://play-lh.googleusercontent.com/dcIfJH7zkoTOgITuNVBotJDDCe7MyQPc1SUV7G-aRInN2pZRWFAepLiHPDw6__sAQg',
    'https://www.agame.com/game/aquaparkio',
  ),
];
