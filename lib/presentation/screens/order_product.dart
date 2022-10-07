
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../domain/order/order.dart';

class OrderProduct extends StatelessWidget {
  final Order order;
  const OrderProduct({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int totalProduct = 0;
    // totalProduct += order.listItemCart!.length;
    // print(totalProduct);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.1),
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(2, 2),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(order.listItemCart!.first.lines.first.product.thumbPic),
                fit: BoxFit.cover
              ),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8)),
            ),
          ),
         const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   order.listItemCart!.first.product!.title!,
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: AppFont.bold.copyWith(
                  //     fontSize: 15,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Quantity:",
                                style: AppFont.regular.copyWith(
                                  fontSize: 13,
                                ),
                                children: [
                                  TextSpan(
                                    text: "3",
                                    style: AppFont.semiBold.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                     const Spacer(),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Total: ",
                                style: AppFont.regular.copyWith(
                                  fontSize: 13,
                                ),
                                children: [
                                  TextSpan(
                                    text: order.total.toString(),
                                    style: AppFont.semiBold.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  Text(
                    order.placedAt.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFont.regular.copyWith(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
