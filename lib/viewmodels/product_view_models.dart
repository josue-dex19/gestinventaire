import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductViewModels with ChangeNotifier {
  final List<Product> _productList = [];
  List<Product> get productList => _productList;

  // Ajouter un produit
  void addProduct(String name, String desc, double quantity, double price) {
    int newId = _productList.isNotEmpty ? _productList.last.id + 1 : 1;
    _productList.add(Product(id: newId, name: name, desc: desc, quantity: quantity, price: price));
    notifyListeners();
  }

  // Mettre à jour un produit
  void updateProduct(int id, String name, String desc, double quantity, double price) {
    int index = _productList.indexWhere((product) => product.id == id);
    if (index != -1) {
      _productList[index] = Product(id: id, name: name, desc: desc, quantity: quantity, price: price);
      notifyListeners();
    }
  }

  // Supprimer un produit
  void deleteProduct(int id) {
    _productList.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  // Afficher la boîte de dialogue de modification
  void showEditDialog(BuildContext context, Product product) {
    final TextEditingController nameController = TextEditingController(text: product.name);
    final TextEditingController descController = TextEditingController(text: product.desc);
    final TextEditingController prixController = TextEditingController(text: product.price.toString());
    final TextEditingController quantyController = TextEditingController(text: product.quantity.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Modifier le produit"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nom"),
              ),
              TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: "Description"),
              ),
              TextField(
                controller: prixController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Prix"),
              ),
              TextField(
                controller: quantyController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Quantité"),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Annuler"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text("Modifier"),
              onPressed: () {
                double? price = double.tryParse(prixController.text);
                double? quantity = double.tryParse(quantyController.text);

                if (nameController.text.isNotEmpty &&
                    descController.text.isNotEmpty &&
                    price != null &&
                    quantity != null) {
                  updateProduct(
                    product.id,
                    nameController.text,
                    descController.text,
                    quantity,
                    price,
                  );
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
