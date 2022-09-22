import 'package:flutter/material.dart';
import '../../application/cart/service.dart';
import '../../core/l10n.dart';
import '../../domain/cart/cart_line.dart';
import '../dialogs/register_dialog.dart';
import 'package:provider/provider.dart';
import '../../application/auth/service.dart' as auth;
import '../../application/cart/service.dart' as cart;

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);
  static const routeName = "/cartPage";

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late int productId;
  @override
  Widget build(BuildContext context) {
    return Selector<CartService, CartState>(
      selector: (_, cart) => cart.state,
      builder: (context, state, __) {
        if (state is LoadedState) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Text(
                  'Shopping cart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21.0,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return CartItem(line: state.cart.lines[index]);
                  },
                  childCount: state.cart.lines.length,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 21.0,
                ),
              ),
              const SliverToBoxAdapter(child: Divider()),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    Text(
                      '480.000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 18.0)),
              const SliverToBoxAdapter(child: Divider()),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    Text(
                      '480.000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 4.0,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'delivery_change'.trs,
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      state.cart.totalText,
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: Divider()),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'Sub total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    Text(
                      '480.000',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: MaterialButton(
                  onPressed: () {
                    if (auth.AuthService.instance.state is auth.VerifiedState) {
                      cart.CartService.instnance.add(
                        cart.AddEvent(
                          productId: productId,
                        ),
                      );
                    } else {
                      registerDialog(context);
                    }
                  },
                  color: Colors.cyan,
                  height: 50.0,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
        } else if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text('not_verified_user'.trs),
          );
        }
      },
    );
  }
}

class CartItem extends StatelessWidget {
  final CartLine line;
  const CartItem({
    Key? key,
    required this.line,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20.0)),
            child: Center(
              child: Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: NetworkImage(line.product.thumbPic)),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 100.0,
                  child: Text(
                    line.product.shortName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        CartService.instnance
                            .add(RemoveEvent(productId: line.product.id));
                      },
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '${line.quantity}',
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      line.totalText,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
