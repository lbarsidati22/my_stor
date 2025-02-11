import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_stor/core/model/softagi_response.dart';
import 'package:my_stor/core/utils/app_constants.dart';
import 'package:my_stor/core/utils/theme/app_colors.dart';

class ProductItem extends StatelessWidget {
  final Products product;
  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: size.width * 0.35,
              width: size.width * 0.40,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: product.image ?? AppConstants.imageNull,
                ),
              ),
            ),
            Positioned(
              top: 4,
              left: 8,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.grey3,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.favorite_border,
                  ),
                ),
              ),
            ),
          ],
        ),
        // Flexible(
        //   child: FittedBox(
        //     fit: BoxFit.scaleDown,
        //     child: Text(
        //       productName ?? '',
        //     ),
        //   ),
        // ),
        // Text(
        //   maxLines: 1,
        //   overflow: TextOverflow.ellipsis,
        //   product.name ?? '',
        // ),
        SizedBox(
          height: 10,
        ),
        Text(
          '\$ ${product.price}',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
