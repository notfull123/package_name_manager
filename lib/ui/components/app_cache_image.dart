import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_colors.dart';

class AppCacheImage extends StatelessWidget {
  final String? url;
  final double width;
  final double height;
  final double? borderRadius;

  const AppCacheImage(
      {super.key,
      this.url,
      this.width = 48,
      this.height = 48,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        child: CachedNetworkImage(
          imageUrl: url ?? '',
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  backgroundColor: Colors.white,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColors.main),
                ),
              ),
            );
          },
          errorWidget: (context, url, error) {
            return Icon(
              Icons.image_outlined,
              color: Colors.white,
              size: width / 2,
            );
          },
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
