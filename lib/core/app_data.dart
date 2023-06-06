import 'package:e_commerce_flutter/src/model/bottom_navy_bar_item.dart';
import 'package:e_commerce_flutter/src/model/recommended_product.dart';
import 'package:e_commerce_flutter/src/model/product_size_type.dart';
import 'package:e_commerce_flutter/src/model/product_category.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:e_commerce_flutter/src/model/categorical.dart';
import 'package:e_commerce_flutter/src/model/numerical.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:flutter/material.dart';

class AppData {
  const AppData._();

  static String dummyText =
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      ' industry. Lorem Ipsum has been the industry\'s standard dummy text'
      ' ever since the 1500s, when an unknown printer took a galley of type'
      ' and scrambled it to make a type specimen book.';

  static List<Product> products = [
    Product(
      name: 'ANTRACOL 70',
      price: 460,
      about: 'Ini adalah obat untuk pengusir hama yang ampuh sejak dulu kala',
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/ANTRACOL70.png',
        'assets/images/ANTRACOL70.png',
        'assets/images/ANTRACOL70.png'
      ],
      isFavorite: true,
      rating: 1,
      type: ProductType.sack,
    ),
    Product(
      name: 'GRAMOXONE276SL',
      price: 380,
      about: 'Ini adalah obat pengusir setan',
      isAvailable: false,
      off: null,
      quantity: 0,
      images: [
        'assets/images/GRAMOXONE276SL.png',
        'assets/images/GRAMOXONE276SL.png',
        'assets/images/GRAMOXONE276SL.png'
      ],
      isFavorite: false,
      rating: 4,
      type: ProductType.inject,
    ),
    Product(
      name: 'Nativo',
      price: 650,
      about: 'obat obat pil',
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/nativo.png',
        'assets/images/nativo.png',
        'assets/images/nativo.png',
      ],
      isFavorite: false,
      rating: 3,
      type: ProductType.sack,
    ),
    Product(
      name: 'Beras Jago',
      price: 229,
      about: 'Beras jago adalah beras yang membuat anda menjadi lebih kuat.',
      isAvailable: true,
      off: 200,
      quantity: 0,
      images: [
        'assets/images/beras.png',
        'assets/images/beras.png',
        'assets/images/beras.png',
      ],
      isFavorite: false,
      rating: 5,
      sizes: ProductSizeType(
        categorical: [
          Categorical(CategoricalType.small, true),
          Categorical(CategoricalType.medium, false),
          Categorical(CategoricalType.large, false),
        ],
      ),
      type: ProductType.wheat,
    ),
    Product(
      name: 'tractor machine',
      price: 99999,
      about: 'Tractor bukan sembarang tractor',
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/traktor.png',
        'assets/images/traktor.png',
        'assets/images/traktor.png',
      ],
      isFavorite: false,
      rating: 4,
      sizes: ProductSizeType(
        numerical: [Numerical('41', true), Numerical('45', false)],
      ),
      type: ProductType.tools,
    ),
    Product(
        name: 'Benih Padi',
        price: 230,
        about: dummyText,
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'assets/images/benih_padi.png',
          'assets/images/benih_padi.png',
          'assets/images/benih_padi.png',
          'assets/images/benih_padi.png',
        ],
        isFavorite: false,
        rating: 2,
        type: ProductType.seed),
    Product(
      name: 'Beras Wangi',
      price: 497,
      about: 'Beras sejuta umat',
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/beraswangi.png',
        'assets/images/beraswangi.png',
      ],
      isFavorite: false,
      rating: 3,
      sizes: ProductSizeType(
        numerical: [
          Numerical('43', true),
          Numerical('50', false),
          Numerical('55', false)
        ],
      ),
      type: ProductType.wheat,
    ),
    Product(
      name: ' Skop ',
      price: 50000,
      about: 'Sekop Ajaib yang  bisa menumbuhkan seed dengan instan.',
      isAvailable: true,
      off: 6000,
      quantity: 0,
      images: [
        'assets/images/skop.png',
        'assets/images/skop.png',
        'assets/images/skop.png',
      ],
      isFavorite: false,
      sizes: ProductSizeType(
        numerical: [
          Numerical('50', true),
          Numerical('65', false),
          Numerical('85', false)
        ],
      ),
      rating: 2,
      type: ProductType.tools,
    ),
  ];

  static List<ProductCategory> categories = [
    ProductCategory(
      ProductType.all,
      true,
      Icons.all_inclusive,
    ),
    ProductCategory(
      ProductType.sack,
      false,
      FontAwesomeIcons.sackXmark,
    ),
    ProductCategory(ProductType.wheat, false, FontAwesomeIcons.wheatAwn),
    ProductCategory(
      ProductType.inject,
      false,
      FontAwesomeIcons.syringe,
    ),
    ProductCategory(
      ProductType.tools,
      false,
      FontAwesomeIcons.personDigging,
    ),
    ProductCategory(ProductType.seed, false, FontAwesomeIcons.seedling)
  ];

  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];

  static List<BottomNavyBarItem> bottomNavyBarItems = [
    BottomNavyBarItem(
      "Home",
      const Icon(Icons.home),
      Color.fromARGB(255, 125, 186, 49),
      Colors.grey,
    ),
    BottomNavyBarItem(
      "Favorite",
      const Icon(Icons.favorite),
      Color.fromARGB(255, 125, 186, 49),
      Colors.grey,
    ),
    BottomNavyBarItem(
      "Cart",
      const Icon(Icons.shopping_cart),
      Color.fromARGB(255, 125, 186, 49),
      Colors.grey,
    ),
    BottomNavyBarItem(
      "Profile",
      const Icon(Icons.person),
      Color.fromARGB(255, 125, 186, 49),
      Colors.grey,
    ),
  ];

  static List<RecommendedProduct> recommendedProducts = [
    RecommendedProduct(
      imagePath: "",
      cardBackgroundColor: const Color(0xFFEC6813),
    ),
    RecommendedProduct(
      imagePath: "",
      cardBackgroundColor: const Color(0xFF3081E1),
      buttonBackgroundColor: const Color(0xFF9C46FF),
      buttonTextColor: Colors.white,
    ),
  ];
}
