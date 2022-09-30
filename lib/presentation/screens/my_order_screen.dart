
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';
import '../../domain/cart/cart_line.dart';
import '../../domain/order/order.dart';
import 'order_detail_screen.dart';
import 'order_product.dart';

class MyOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartLine>(context,listen: false);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.black,
                    size: 20,
                  )),
              Text(
                "My Orders",
                style: AppFont.bold.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cartViewModel.listOrder.length,
                  itemBuilder: (_,index){
                    Order order = cartViewModel.listOrder[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: InkWell(
                        onTap: (){
                           Navigator.pushNamed(context, OrderDetailScreen.routeName,arguments: order);
                        },
                        child: OrderProduct(
                          order: order,
                        ),
                      )
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
