import 'dart:ui';

import 'package:flafee/theme.dart';
import 'package:flafee/widget/widget_form.dart';
import 'package:flafee/widget/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _counter = 1;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  late double heightScreen;
  late double widthScreen;
  int selectedIndex = 0;
  String selectedOrderType = "Dine In";
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    heightScreen = MediaQuery.of(context).size.height;
    widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppPallete.background,
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: SizedBox(
            height: heightScreen,
            width: widthScreen,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                topTab(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        height: heightScreen - 100,
                        child: Column(
                          children: [
                            searchTab(),
                            Gap(15),
                            categoryTab(),
                            Gap(15),
                            listProducts()
                          ],
                        ),
                      ),
                    ),
                    orderTab()
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Expanded listProducts() {
    // Contoh data produk - sesuaikan dengan data asli Anda
    List<Map<String, dynamic>> products = [
      {
        'name': 'Ice Americano Salalalala ',
        'price': 'Rp 21.000',
        'image': 'assets/png/coffee1.png',
        'category': 'Coffee'
      },
      {
        'name': 'Ice Americano Salalalala ',
        'price': 'Rp 21.000',
        'image': 'assets/png/coffee1.png',
        'category': 'Coffee'
      },
      {
        'name': 'Ice Americano Salalalala ',
        'price': 'Rp 21.000',
        'image': 'assets/png/coffee1.png',
        'category': 'Coffee'
      },
      {
        'name': 'Ice Americano ',
        'price': 'Rp 21.000',
        'image': 'assets/png/coffee1.png',
        'category': 'Coffee'
      },
      {
        'name': 'Ice Americano ',
        'price': 'Rp 21.000',
        'image': 'assets/png/coffee1.png',
        'category': 'Coffee'
      },
      {
        'name': 'Ice Americano ',
        'price': 'Rp 21.000',
        'image': 'assets/png/coffee1.png',
        'category': 'Coffee'
      },
      {
        'name': 'Ice Americano ',
        'price': 'Rp 21.000',
        'image': 'assets/png/coffee1.png',
        'category': 'Coffee'
      },
      {
        'name': 'Ice Americano',
        'price': 'Rp 21.000',
        'image': 'assets/png/coffee1.png',
        'category': 'Coffee'
      },
      {
        'name': 'Cappuccino',
        'price': 'Rp 25.000',
        'image': 'assets/png/coffee2.png',
        'category': 'Coffee'
      },

      // Tea
      {
        'name': 'Green Tea',
        'price': 'Rp 18.000',
        'image': 'assets/png/coffee2.png',
        'category': 'Tea'
      },
      {
        'name': 'Bubble Tea',
        'price': 'Rp 22.000',
        'image': 'assets/png/coffee2.png',
        'category': 'Tea'
      },

      // Snack
      {
        'name': 'French Fries',
        'price': 'Rp 15.000',
        'image': 'assets/png/coffee2.png',
        'category': 'Snack'
      },
      {
        'name': 'Donut',
        'price': 'Rp 12.000',
        'image': 'assets/png/coffee2.png',
        'category': 'Snack'
      },

      // Food
      {
        'name': 'Fried Rice',
        'price': 'Rp 30.000',
        'image': 'assets/png/coffee2.png',
        'category': 'Food'
      },
      {
        'name': 'Spaghetti',
        'price': 'Rp 35.000',
        'image': 'assets/png/coffee2.png',
        'category': 'Food'
      },
      // Tambahkan data produk lainnya...
    ];

    // Filter produk berdasarkan searchQuery
    // Daftar kategori sesuai urutan index
    List<String> categories = ['', 'Coffee', 'Tea', 'Snack', 'Food'];

    // Filter berdasarkan kategori dan pencarian
    List<Map<String, dynamic>> filteredProducts = products.where((product) {
      bool matchesCategory = selectedIndex == 0 || // Jika All dipilih (index 0)
          product['category'] == categories[selectedIndex];
      bool matchesSearch =
          product['name'].toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppPallete.white,
        ),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 15,
            childAspectRatio: 1.2,
            mainAxisSpacing: 15,
          ),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              // height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppPallete.greywhite,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Image.asset(
                      filteredProducts[index]['image'],
                      fit: BoxFit.fitHeight,
                      // height: heightScreen * 0.1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: widthScreen * 0.09,
                            child: TxtCustom(
                              tittle: filteredProducts[index]['name'],
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TxtCustom(
                            tittle: filteredProducts[index]['price'],
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          // Tambahkan ke keranjang
                        },
                        child: Container(
                          height: heightScreen * 0.05,
                          width: heightScreen * 0.05,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(heightScreen * 0.05),
                            color: AppPallete.main,
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppPallete.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container categoryTab() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ScrollConfiguration(
        behavior: HorizontalScrollBehavior(),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Scroll horizontally
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              categoryCard(
                index: 0,
                title: "All Menu",
                itemCount: "35 items",
                svgAsset: 'assets/svg/category1.svg',
                svgBottom: -50,
                svgRight: -30,
                svgHeight: 180,
              ),
              Gap(12),
              categoryCard(
                index: 1,
                title: "Coffee",
                itemCount: "20 items",
                svgAsset: 'assets/svg/category1.svg',
                svgBottom: -50,
                svgRight: -30,
                svgHeight: 180,
              ),
              Gap(12),
              categoryCard(
                index: 2,
                title: "Tea",
                itemCount: "20 items",
                svgAsset: 'assets/svg/category2.svg',
                svgBottom: -20,
                svgRight: -5,
                svgHeight: 150,
              ),
              Gap(12),
              categoryCard(
                index: 3,
                title: "Snack",
                itemCount: "20 items",
                svgAsset: 'assets/svg/category3.svg',
                svgBottom: -40,
                svgRight: -10,
                svgHeight: 160,
              ),
              Gap(12),
              categoryCard(
                index: 4,
                title: "Food",
                itemCount: "20 items",
                svgAsset: 'assets/svg/category4.svg',
                svgBottom: -10,
                svgRight: -0,
                svgHeight: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryCard({
    required int index,
    required String title,
    required String itemCount,
    required String svgAsset,
    required double svgBottom,
    required double svgRight,
    required double svgHeight,
  }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? AppPallete.main : AppPallete.white,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: svgBottom,
              right: svgRight,
              child: Transform.rotate(
                angle: -0.6,
                child: SvgPicture.asset(
                  svgAsset,
                  height: svgHeight,
                  color: isSelected ? AppPallete.mainsub : AppPallete.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    height: 20,
                    width: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: isSelected ? AppPallete.white : AppPallete.main,
                    ),
                    child: Center(
                      child: Text(
                        "Available",
                        style: TextStyle(
                          color:
                              isSelected ? AppPallete.main : AppPallete.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: isSelected ? AppPallete.white : AppPallete.main,
                    ),
                  ),
                  Text(
                    itemCount,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? AppPallete.white : AppPallete.main,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container searchTab() {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 12),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppPallete.white,
      ),
      child: Center(
        child: TextField(
          controller: searchController,
          onChanged: (value) {
            setState(() {
              searchQuery = value.toLowerCase();
            });
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: AppPallete.main),
            hintText: "Search your menu name...",
            hintStyle: GoogleFonts.plusJakartaSans(
                color: AppPallete.mainsub, fontWeight: FontWeight.w500),
            suffixIcon: searchQuery.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.close, color: AppPallete.mainsub),
                    onPressed: () {
                      setState(() {
                        searchController.clear();
                        searchQuery = '';
                      });
                    },
                  )
                : null,
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
          style: TextStyle(
            color: AppPallete.main,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Padding topTab() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TxtCustom(
              tittle: "Flaafee",
              color: AppPallete.main,
              fontSize: 48,
              fontWeight: FontWeight.w800),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: AppPallete.white,
                    borderRadius: BorderRadius.circular(25)),
                child: const Icon(
                  Icons.notifications,
                  color: AppPallete.black,
                ),
              ),
              Gap(15),
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppPallete.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    children: [
                      Gap(5),
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: AppPallete.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Icon(
                            Icons.person,
                          )),
                      Gap(5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TxtCustom(
                              tittle: "Susi Semilikiti",
                              fontSize: 16,
                              color: AppPallete.main,
                              fontWeight: FontWeight.bold),
                          TxtCustom(
                              tittle: "Cashier",
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                      Gap(20),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Container orderTab() {
    return Container(
      padding: const EdgeInsets.only(bottom: 15, right: 15),
      height: heightScreen - 85,
      width: widthScreen * 0.3,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppPallete.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TxtCustom(
              tittle: "New Order",
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            Gap(15),
            orderTye(),
            Gap(15),
            Row(
              children: [
                Gap(10),
                TxtCustom(
                  tittle: "Name",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppPallete.greyfont,
                ),
                Gap(20),
                Expanded(
                    child: InputForm(tittle: "Name", hinttext: "Write a name")),
              ],
            ),
            Gap(15),
            //! =================
            //! ORDER
            //! =================
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppPallete.greywhite),
                child: Column(
                  children: [
                    SizedBox(
                      height: heightScreen * 0.11,
                      child: Row(
                        children: [
                          Container(
                            width: widthScreen * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppPallete.white,
                            ),
                            child: Image.asset("assets/png/coffee1.png",
                                fit: BoxFit.fitWidth),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: widthScreen * 0.1,
                                        child: TxtCustom(
                                          alignment: TextAlign.start,
                                          tittle: "Ice Americano Salalala",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: AppPallete.main,
                                        ),
                                      ),
                                      TxtCustom(
                                        tittle: "Rp 21.000 - Regular",
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: AppPallete.greyfont,
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/svg/memo.svg",
                                      height: 12,
                                      color: AppPallete.main,
                                    ),
                                    TxtCustom(
                                      tittle: "Less Sugar",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: AppPallete.greyfont,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TxtCustom(
                                  alignment: TextAlign.start,
                                  tittle: "Rp 42.000",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: AppPallete.black,
                                ),
                                Spacer(),
                                Container(
                                  height: 26,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: AppPallete.grey,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          color: AppPallete.white,
                                        ),
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          onPressed: _decrement,
                                          icon: const Icon(
                                            Icons.remove,
                                            size: 15,
                                            color: AppPallete.main,
                                          ),
                                        ),
                                      ),
                                      TxtCustom(
                                        tittle: "$_counter",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppPallete.main,
                                      ),
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          color: AppPallete.white,
                                        ),
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          onPressed: _increment,
                                          icon: const Icon(
                                            Icons.add,
                                            size: 15,
                                            color: AppPallete.main,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(15),
            Column(
              children: [
                TxtCustom(
                    tittle: "Payment Details",
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TxtCustom(
                        tittle: "Subtotal",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppPallete.greyfont),
                    TxtCustom(
                      tittle: "Rp 150.000",
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TxtCustom(
                        tittle: "Tax",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppPallete.greyfont),
                    TxtCustom(
                      tittle: "Rp 15.000",
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                Gap(4),
                Divider(
                  color: AppPallete.grey,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TxtCustom(
                        tittle: "Total",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppPallete.greyfont),
                    TxtCustom(
                      tittle: "Rp 165.000",
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
            Gap(15),
            GradientSlideToAct(
              width: 300,
              text: "Slide to make an Order",
              dragableIconBackgroundColor: AppPallete.mainsubsub,
              submittedIcon: Icons.check,
              textStyle: GoogleFonts.plusJakartaSans(
                  color: AppPallete.greyfont, fontSize: 15),
              backgroundColor: AppPallete.main,
              onSubmit: () {},
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppPallete.main,
                    AppPallete.mainsub,
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Container orderTye() {
    return Container(
      padding: EdgeInsets.all(4),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppPallete.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedOrderType = "Dine In";
              });
            },
            child: Container(
              height: 48,
              width: ((widthScreen * 0.3) - 55) * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: selectedOrderType == "Dine In"
                    ? AppPallete.main
                    : AppPallete.grey,
              ),
              child: Center(
                child: TxtCustom(
                  tittle: "Dine In",
                  color: selectedOrderType == "Dine In"
                      ? AppPallete.white
                      : AppPallete.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedOrderType = "Take Away";
              });
            },
            child: Container(
              height: 48,
              width: ((widthScreen * 0.3) - 55) * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: selectedOrderType == "Take Away"
                    ? AppPallete.main
                    : AppPallete.grey,
              ),
              child: Center(
                child: TxtCustom(
                  tittle: "Take Away",
                  color: selectedOrderType == "Take Away"
                      ? AppPallete.white
                      : AppPallete.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
      };

  @override
  Widget buildScrollbar(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
