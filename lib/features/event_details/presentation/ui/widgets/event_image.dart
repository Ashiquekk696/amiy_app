import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/responive.dart';
import '../../../../event_listing/data/model/event_list_model.dart';

/// Displays the event image with a fade-in animation.
/// The image is fetched from a network URL and supports caching.
class EventImage extends StatelessWidget {
  final EventListModel eventListModel;
  final Responsive responsive;

  const EventImage({required this.eventListModel, required this.responsive});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(seconds: 1),
        builder: (context, double opacity, child) {
          return Opacity(
            opacity: opacity,
            child: child,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),

          /// Displays a cached network image with a placeholder and error widget.
          child: CachedNetworkImage(
            imageUrl: eventListModel.imageUrl ?? "",
            height: responsive.blockSizeVertical * 40,
            width: responsive.blockSizeHorizontal * 90,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
