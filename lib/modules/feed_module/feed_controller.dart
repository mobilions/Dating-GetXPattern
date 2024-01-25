import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {

  CardSwiperController swiperController = CardSwiperController();

  List<DatingList> datingList = [
    DatingList("Lucas", "assets/images/dating_man_1.jpg", "London, United Kingdom", "23"),
    DatingList("Ethan", "assets/images/dating_man_2.jpg", "address", "26"),
    DatingList("Grace", "assets/images/dating_man_3.jpg", "address", "22"),
    DatingList("Emily", "assets/images/dating_women_1.jpg", "address", "29"),
    DatingList("Sophia", "assets/images/dating_women_2.jpg", "address", "30"),
    DatingList("Olivia", "assets/images/dating_women_3.jpg", "address", "25"),
    DatingList("Noah", "assets/images/dating_women_4.jpg", "address", "23"),
    DatingList("Isabella", "assets/images/dating_women_5.jpg", "address", "22"),

  ];

}

class DatingList {
  final String? name, imageName, address, age;

  DatingList(
      this.name,
      this.imageName,
      this.address,
      this.age,
      );
}
