import 'package:flutter_test/flutter_test.dart';
import 'package:gestinventaire/viewmodels/product_view_models.dart';

void main() {
  late ProductViewModels productViewModel;

  setUp(() {
    productViewModel = ProductViewModels();
  });

  test('Initialisation de ProductViewModels', () {
    expect(productViewModel.productList, isEmpty);
  });

  test('Ajout d\'un produit', () {
    productViewModel.addProduct("PC", "Ordinateur portable", 10, 1500.0);

    expect(productViewModel.productList.length, 1);
    expect(productViewModel.productList.first.name, "PC");
  });

  test('Mise à jour d\'un produit existant', () {
    productViewModel.addProduct("PC", "Ordinateur portable", 10, 1500.0);
    int productId = productViewModel.productList.first.id;

    productViewModel.updateProduct(productId, "PC Gamer", "Ordinateur haut de gamme", 5, 2000.0);

    expect(productViewModel.productList.first.name, "PC Gamer");
    expect(productViewModel.productList.first.price, 2000.0);
  });

  test('Suppression d\'un produit existant', () {
    productViewModel.addProduct("PC", "Ordinateur portable", 10, 1500.0);
    int productId = productViewModel.productList.first.id;

    productViewModel.deleteProduct(productId);

    expect(productViewModel.productList, isEmpty);
  });

  test('Mise à jour d\'un produit inexistant ne doit rien changer', () {
    productViewModel.updateProduct(999, "Inconnu", "Test", 1, 100.0);

    expect(productViewModel.productList, isEmpty);
  });

  test('Suppression d\'un produit inexistant ne doit rien changer', () {
    productViewModel.deleteProduct(999);

    expect(productViewModel.productList, isEmpty);
  });
}
