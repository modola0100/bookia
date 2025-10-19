import 'package:bookia/core/functions/snackbar.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.book,
    required this.onDelete,
    required this.onRefresh,
    required this.onUpdate,
  });
  final CartItem book;
  final Function() onDelete;
  final Function() onRefresh;
  final Function(int) onUpdate;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: book.itemProductId ?? "",
      child: GestureDetector(
        onTap: () {
          pushTo(context, Routes.details, extra: book.mapToProduct()).then((
            value,
          ) {
            onRefresh();
          });
        },
        child: Dismissible(
          key: UniqueKey(),

          background: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.delete,
                  color: AppColors.whiteColor,
                  size: 30,
                ),
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            onDelete();
          },
          child: Container(
            height: 140,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: book.itemProductImage ?? "",
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Gap(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.itemProductName ?? "",
                        style: TextStyles.size18(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Gap(10),
                      Text(
                        "\$${book.itemProductPriceAfterDiscount}",
                        style: TextStyles.size15(),
                      ),
                      Gap(20),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if ((book.itemQuantity ?? 1) > 1) {
                                int newQuantity = (book.itemQuantity ?? 1) - 1;
                                onUpdate(newQuantity);
                              } else {
                                showSnakBar(
                                  context,
                                  Colors.red,
                                  "Minimum is 1",
                                );
                              }
                            },
                            child: Container(
                              child: Icon(
                                Icons.remove,
                                size: 22,
                                color: AppColors.darkColor,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          Gap(10),
                          Text(
                            book.itemQuantity.toString(),
                            style: TextStyles.size18(),
                          ),
                          Gap(10),
                          GestureDetector(
                            onTap: () {
                              if ((book.itemQuantity ?? 1) <
                                  (book.itemProductStock ?? 1)) {
                                int newQuantity = (book.itemQuantity ?? 1) + 1;
                                onUpdate(newQuantity);
                              } else {
                                showSnakBar(
                                  context,
                                  Colors.red,
                                  "Out of Stock",
                                );
                              }
                            },
                            child: Container(
                              child: Icon(
                                Icons.add,
                                size: 22,
                                color: AppColors.darkColor,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
