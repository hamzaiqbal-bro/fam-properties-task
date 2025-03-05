// presentation/widgets/building_item.dart
import 'package:flutter/material.dart';
import 'package:fam_properties/domain/entities/building_entity.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildingItem extends StatelessWidget {
  final BuildingEntity building;

  const BuildingItem({Key? key, required this.building}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1) Building Name (title)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Expanded(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       building.buildingName,
                       style: const TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     // 2) Developer Name (subheading)
                     Text(
                       building.developerName,
                       style: const TextStyle(
                         fontSize: 14,
                         color: Colors.black54,
                       ),
                     ),
                     const SizedBox(height: 6),
                 
                     // 3) Small blue line
                     Container(
                       width: 60,
                       height: 4,
                       color: Colors.blue,
                     ),
                   ],
                 ),
               ),
                
                Icon(FontAwesomeIcons.arrowsTurnRight,color: Colors.blue,)
              ],
            ),
            const SizedBox(height: 12),

            // 4) Price row
            Row(
              children: [
                const Icon(FontAwesomeIcons.moneyBill1Wave, color: Colors.grey),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    text: 'FROM ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(
                        text: 'AED ',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: '${building.startingPrice}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // 5) Location row
            Row(
              children: [
                const Icon(FontAwesomeIcons.locationArrow, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    building.areaName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 6) Ready By row
            Row(
              children: [
                const Icon(FontAwesomeIcons.calendar, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  'Ready BY ${building.buildingLaunchDate}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 7) Bottom row with three boxes
            Row(
              children: [
                // Map
                Expanded(
                  child: Column(
                    children: const [
                      Icon(FontAwesomeIcons.map, color: Colors.blue),
                      SizedBox(height: 4),
                      Text('Map'),
                    ],
                  ),
                ),
                // WhatsApp
                Expanded(
                  child: Column(
                    children: [
                      Icon(FontAwesomeIcons.whatsapp, color: Colors.green[800]),
                      const SizedBox(height: 4),
                      const Text('Chat'),
                    ],
                  ),
                ),
                // Details
                Expanded(
                  child: Column(
                    children: const [
                      Icon(Icons.arrow_forward, color: Colors.blue),
                      SizedBox(height: 4),
                      Text('Details'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
