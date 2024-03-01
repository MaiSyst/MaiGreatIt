import 'package:mai_greatit/data/models/data_feature_options.dart';
import 'package:mai_greatit/data/models/data_mai_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mai_greatit/presentations/widget/mai_bottom_nav_item.dart';

class HomeUiState {
  int currentIndexBottomNav = 0;
  final List<DataFeatureOption> dataFeatures = const [
    DataFeatureOption(iconName: "spotify", title: "Spotify"),
    DataFeatureOption(iconName: "spotify", title: "Spotify")
  ];
  final List<DataMaiCard> dataPreference = const [
    DataMaiCard(title: "Football en Direct", image: "can.webp"),
    DataMaiCard(title: "Sarali", image: "can.webp", desc: "Paiement marchand"),
  ];
}
