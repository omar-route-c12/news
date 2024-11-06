import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    final fifteenAgo = DateTime.now().subtract(const Duration(minutes: 15));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl:
                  'https://www.iisertvm.ac.in/assets/images/placeholder.jpg',
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (_, __) => const LoadingIndicator(),
              errorWidget: (_, __, ___) =>
                  const Icon(Icons.image_not_supported_outlined),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'BBC news',
            style: titleSmallStyle?.copyWith(
              fontSize: 10,
              color: AppTheme.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Why are football's biggest clubs starting a new tournament?",
            style: titleSmallStyle?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 2),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              timeago.format(fifteenAgo),
              style: titleSmallStyle?.copyWith(
                fontSize: 13,
                color: AppTheme.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
