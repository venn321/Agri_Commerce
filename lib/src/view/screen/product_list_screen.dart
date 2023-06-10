import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/widget/product_grid_view.dart';
import 'package:e_commerce_flutter/src/view/widget/list_item_selector.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppbarActionType { leading, trailing }

final ProductController controller = Get.put(ProductController());

TextEditingController searchController = TextEditingController();
bool searchState = false;

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
  const ProductListScreen({Key? key}) : super(key: key);
}

class _ProductListScreenState extends State<ProductListScreen> {
  String greeting = '';
  TextEditingController searchController = TextEditingController();
  bool searchState = false;

  @override
  void initState() {
    super.initState();
    getUserFromSharedPreferences();
  }

  Future<void> getUserFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final userName = prefs.getString('user_name');
    final userEmail = prefs.getString('user_email');
    setState(() {
      greeting = 'Hello $userName ($userEmail)';
    });
  }

  Widget appBarActionButton(AppbarActionType type) {
    IconData icon = Icons.search;

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.lightGrey,
      ),
      child: searchState
          ? Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'Masukan teks'),
                ),
                IconButton(
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      searchState = !searchState;
                    });
                  },
                  icon: Icon(icon, color: Colors.black),
                ),
              ],
            )
          : IconButton(
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(),
              onPressed: () {
                setState(() {
                  searchState = !searchState;
                });
              },
              icon: Icon(icon, color: Colors.black),
            ),
    );
  }

  PreferredSize get _appBar {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // appBarActionButton(AppbarActionType.leading),
              appBarActionButton(AppbarActionType.trailing),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _recommendedProductListView(BuildContext context) {
  //   return SizedBox(
  //     height: 170,
  //     child: ListView.builder(
  //         padding: const EdgeInsets.symmetric(vertical: 10),
  //         shrinkWrap: true,
  //         scrollDirection: Axis.horizontal,
  //         itemCount: AppData.recommendedProducts.length,
  //         itemBuilder: (_, index) {
  //           return Padding(
  //             padding: const EdgeInsets.only(right: 20),
  //             child: Container(
  //               width: 300,
  //               decoration: BoxDecoration(
  //                 color: AppData.recommendedProducts[index].cardBackgroundColor,
  //                 borderRadius: BorderRadius.circular(15),
  //               ),
  //               // child: Row(
  //               //   children: [
  //               //     Padding(
  //               //       padding: const EdgeInsets.only(left: 20),
  //               //       child: Column(
  //               //         crossAxisAlignment: CrossAxisAlignment.start,
  //               //         mainAxisAlignment: MainAxisAlignment.center,
  //               //         children: [
  //               //           Image.network(
  //               //             "https://images.unsplash.com/photo-1484517586036-ed3db9e3749e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  //               //             width: 200.0,
  //               //             height: 200.0,
  //               //             fit: BoxFit.cover,
  //               //           ),
  //               //           const SizedBox(height: 8),
  //               //           ElevatedButton(
  //               //             onPressed: () {},
  //               //             style: ElevatedButton.styleFrom(
  //               //               backgroundColor: AppData
  //               //                   .recommendedProducts[index]
  //               //                   .buttonBackgroundColor,
  //               //               elevation: 0,
  //               //               padding:
  //               //                   const EdgeInsets.symmetric(horizontal: 18),
  //               //               shape: RoundedRectangleBorder(
  //               //                 borderRadius: BorderRadius.circular(18),
  //               //               ),
  //               //             ),
  //               //             child: Text(
  //               //               "Get Now",
  //               //               style: TextStyle(
  //               //                 color: AppData.recommendedProducts[index]
  //               //                     .buttonTextColor!,
  //               //               ),
  //               //             ),
  //               //           )
  //               //         ],
  //               //       ),
  //               //     ),
  //               //     const Spacer(),
  //               //   ],
  //               // ),
  //             ),
  //           );
  //         }),
  //   );
  // }

  Widget _topCategoriesHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Top categories",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 18, 94, 32)),
            child: Text(
              "SEE ALL",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Color.fromARGB(255, 167, 189, 25).withOpacity(0.7)),
            ),
          )
        ],
      ),
    );
  }

  Widget _topCategoriesListView() {
    return ListItemSelector(
      categories: controller.categories,
      onItemPressed: (index) {
        controller.filterItemsByCategory(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.getAllItems();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greeting,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  "Sedang Mencari Barang ?",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                // _recommendedProductListView(context),
                _topCategoriesHeader(context),
                _topCategoriesListView(),
                GetBuilder(builder: (ProductController controller) {
                  return ProductGridView(
                    items: controller.filteredProducts,
                    likeButtonPressed: (index) => controller.isFavorite(index),
                    isPriceOff: (product) => controller.isPriceOff(product),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
