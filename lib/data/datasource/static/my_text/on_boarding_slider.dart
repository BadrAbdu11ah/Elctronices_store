import 'package:electronics_store/core/constant/my_image_asset.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/data/model/on_boarding_model.dart';
import 'package:get/get.dart';

List<OnBoardingModel> onBoardingList = [
  // Discover
  OnBoardingModel(
    image: MyImageAsset.onboaridngImageOne,
    title: MyText.onBoardingTitle1.tr,
    body: MyText.onBoardingBody1.tr,
  ),
  // Make the payment
  OnBoardingModel(
    image: MyImageAsset.onboaridngImageTow,
    title: MyText.onBoardingTitle2.tr,
    body: MyText.onBoardingBody3.tr,
  ),
  // Enjoy your shopping
  OnBoardingModel(
    image: MyImageAsset.onboaridngImageThree,
    title: MyText.onBoardingTitle3.tr,
    body: MyText.onBoardingBody3.tr,
  ),
];
