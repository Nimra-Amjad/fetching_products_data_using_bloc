import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Screen"),
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoadingState) {
              return CircularProgressIndicator();
            } else if (state is ProductsLoadedState) {
              return ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                    leading: Text(
                  state.productsModel[index].category.toString(),
                ));
              });
            } else if (state is ProductsErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return SizedBox();
          },
        ));
  }
}
