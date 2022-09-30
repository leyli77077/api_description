import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../domain/order/order.dart';

class OrderDetailScreen extends StatelessWidget {
  final Order order;
  static const String routeName = 'order-detail';

  const OrderDetailScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 21,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Order Details',
          style: AppFont.semiBold,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order No: ${order.total}",
                  style: AppFont.semiBold.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  order.status.toString(),
                  style: AppFont.regular
                      .copyWith(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${order.listItemCart!.length} items',
              style: AppFont.medium.copyWith(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              itemCount: order.listItemCart!.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              itemBuilder: (_, index) {
                // Product product = order.listItemCart![index].;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
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
                          decoration: const BoxDecoration(
                            // image: DecorationImage(
                            //     image: NetworkImage(product.urlImage!.first),
                            //     fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8)),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   product.title!,
                                //   style: AppFont.semiBold.copyWith(
                                //       color: Colors.black, fontSize: 16),
                                // ),
                                const SizedBox(
                                  height: 9,
                                ),
                                Text(
                                  'Mango',
                                  style: AppFont.medium.copyWith(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Color: ",
                                              style: AppFont.regular.copyWith(
                                                fontSize: 13,
                                                color: Colors.grey,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: order.linesCount
                                                      .toString(),
                                                  style:
                                                      AppFont.regular.copyWith(
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ]),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Size: ",
                                              style: AppFont.regular.copyWith(
                                                fontSize: 13,
                                                color: Colors.grey,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: order.total.toString(),
                                                  style:
                                                      AppFont.regular.copyWith(
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ]),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Quantity: ",
                                              style: AppFont.regular.copyWith(
                                                fontSize: 13,
                                                color: Colors.grey,
                                              ),
                                              children: const [
                                                // TextSpan(
                                                //   text: order
                                                //       .listItemCart![index]
                                                //       .quantity
                                                //       .toString(),
                                                //   style:
                                                //       AppFont.regular.copyWith(
                                                //     fontSize: 13,
                                                //     color: Colors.black,
                                                //     fontWeight: FontWeight.w400,
                                                //   ),
                                                // ),
                                              ]),
                                        ],
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.bottomRight,
                                      // child: Text(
                                      //   '${product.price.toString()} VND',
                                      //   textAlign: TextAlign.right,
                                      //   style: AppFont.medium.copyWith(
                                      //     fontSize: 13,
                                      //     fontWeight: FontWeight.bold,
                                      //     color: Colors.black,
                                      //   ),
                                      // ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Order information',
              style: AppFont.medium.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            buildOrderInformation(
                title: "Shipping Address", description: "ddddd"),
            const SizedBox(
              height: 25,
            ),
            buildOrderInformation(
                title: "Payment method", description: "ddddd"),
            const SizedBox(
              height: 25,
            ),
            buildOrderInformation(title: "Total Amount", description: "133"),
          ],
        ),
      ),
    );
  }

  Widget buildOrderInformation(
      {required String title, required String description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '$title:',
            style: AppFont.medium.copyWith(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            description,
            style: AppFont.medium.copyWith(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
