import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:provider/provider.dart';
import '../viewmodels/product_view_models.dart';
import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModels>(context, listen: false);
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    final TextEditingController prixController = TextEditingController();
    final TextEditingController quantyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product App'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Accordion(
                  children: [
                    AccordionSection(
                      headerPadding: const EdgeInsets.all(20),
                      headerBackgroundColor: Colors.green,
                      header: const Text("Ajouter un produit", style: TextStyle(fontSize: 18),),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: 'Nom produit',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: descController,
                            decoration: const InputDecoration(
                              labelText: 'Description',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: prixController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Prix',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: quantyController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Quantité',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(20),
                            ),
                            onPressed: () {
                              double? price = double.tryParse(prixController.text);
                              double? quantity = double.tryParse(quantyController.text);
                              if (nameController.text.isNotEmpty &&
                                  descController.text.isNotEmpty &&
                                  price != null &&
                                  quantity != null) {
                                productViewModel.addProduct(
                                  nameController.text,
                                  descController.text,
                                  quantity,
                                  price,
                                );
                                nameController.clear();
                                descController.clear();
                                prixController.clear();
                                quantyController.clear();
                              }
                            },
                            child: const Text('Enregistrer'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Liste des Produits",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Consumer<ProductViewModels>(
                  builder: (context, productVM, child) {
                    if (productVM.productList.isEmpty) {
                      return const Center(
                        child: Text(
                          'Aucune donnée pour le moment',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      );
                    }

                    return Column(
                      children: productVM.productList.map((product) {
                        return ListTile(
                          title: Text(product.name),
                          subtitle: Text("Prix: ${product.price} - Quantité: ${product.quantity}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              productVM.deleteProduct(product.id);
                            },
                          ),
                          onTap: () => productVM.showEditDialog(context, product),
                        );
                      }).toList(),
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
