import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tecnico_rick_morty/widgets/location_swiper.dart';

import '../providers/API_provider.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationsProvider = Provider.of<ApiProvider>(context);
    return Center(
      child: LocationsSwiper(locations: locationsProvider.locations),
    );
  }
}
