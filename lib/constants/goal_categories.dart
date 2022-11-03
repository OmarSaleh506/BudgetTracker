
final List<Goal_Category> categoriesGoals = [
  Goal_Category(
    name: 'سكن',
    image: "lib/constants/goalsIcons/house.svg",
    containerColor: "0xff1C6DD0",
  ),
  Goal_Category(
    name: 'سيارة',
    image: "lib/constants/goalsIcons/car.svg",
    containerColor: "0xffFABC3A",
  ),
  Goal_Category(
    name: 'تعليم',
    image: "lib/constants/goalsIcons/car.svg",
    containerColor: "0xff98C0F1",
  ),
  Goal_Category(
    name: 'زواج',
    image: "lib/constants/goalsIcons/marriage.svg",
    containerColor: "0xffFA6161",
  ),
  Goal_Category(
    name: 'أخرى',
    image: "lib/constants/goalsIcons/plus.svg",
    containerColor: "0xff797979",
  ),
];

class Goal_Category {
  final String? containerColor;
  final String? name;
  final String? image;

  Goal_Category({this.name, this.image, this.containerColor});
}
