import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_colors.dart';
import 'package:package_name_manager/models/entities/movie_entity.dart';

class MovieWidget extends StatelessWidget {
  final MovieEntity? movie;
  final VoidCallback? onPressed;

  const MovieWidget({super.key, this.movie, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                _buildThumbWidget(),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(movie?.title ?? '',
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 1.0,
              color: AppColors.lightGray,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildThumbWidget() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: AppColors.lightGray,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: CachedNetworkImage(
          imageUrl: movie?.posterUrl ?? '',
          fit: BoxFit.cover,
          width: 48,
          height: 48,
        ),
      ),
    );
  }
}
