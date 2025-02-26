GestInventaire

📌 Description
GestInventaire est une application Flutter permettant de gérer un inventaire de produits. L'utilisateur peut ajouter, modifier et supprimer des produits avec des informations comme le nom, la description, le prix et la quantité.

🚀 Fonctionnalités
- 📥 Ajout de produits avec des détails (nom, description, prix, quantité).
- 📋 Affichage de la liste des produits.
- ✏️ Modification des produits.
- 🗑️ Suppression des produits.
- 📦 Gestion d'état avec Provider.

🛠️ Technologies utilisées
- Flutter (SDK)
- Dart (Langage de programmation)
- Provider (Gestion d'état)
- Accordion (UI Widget pour affichage)

📂 Structure du projet
GestInventaire/
│── lib/
│   ├── main.dart                # Point d'entrée de l'application
│   ├── models/
│   │   ├── product.dart          # Modèle de données pour les produits
│   ├── viewmodels/
│   │   ├── product_view_models.dart  # Gestion de l'état avec Provider
│   ├── views/
│   │   ├── home_screen.dart      # Interface principale de l'application
│── test/
│   ├── product_view_model_test.dart  # Tests unitaires
│── pubspec.yaml                  # Dépendances du projet


📦 Installation et exécution
1️⃣ Prérequis
- Flutter SDK installé ([Installation Flutter](https://flutter.dev/docs/get-started/install))
- Un émulateur ou un appareil physique connecté

2️⃣ Cloner le projet
```
git clone https://github.com/votre-utilisateur/GestInventaire.git
cd GestInventaire
```

3️⃣ Installer les dépendances
```
flutter pub get
```

4️⃣ Lancer l'application
```
flutter run
```
🧪 Tests unitaires
L'application inclut des tests unitaires pour le ViewModel des produits.
Pour exécuter les tests, utilisez :
```
flutter test
```

