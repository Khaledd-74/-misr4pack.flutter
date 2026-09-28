import 'package:flutter/material.dart';

import '../../state/app_state.dart';
import '../../widgets/site_header.dart';
import '../../widgets/site_footer.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int currentIndex = 0;

  final List<ProductData> products = const [
    ProductData(
      id: 'B104',
      size: '100 ML',
      image: 'assets/images/100ml.webp',
      label: '18 g',
      height: '110 mm',
      thread: '37.5 mm',
      volume: '100 ml',
      material: 'HDPE/Co-Ex',
      diameter: '47.1 mm',
    ),
    ProductData(
      id: 's105',
      size: '100 ML',
      image: 'assets/images/100ml-1.webp',
      label: '18 g',
      height: '75.7 mm',
      thread: '46 mm',
      volume: '100 ml',
      material: 'HDPE/Co-Ex',
      diameter: '56 mm',
    ),
    ProductData(
      id: 's108',
      size: '100 ML',
      image: 'assets/images/100ml-2.webp',
      label: '18 g',
      height: '90 mm',
      thread: '44.2 mm',
      volume: '100 ml',
      material: 'HDPE/Co-Ex',
      diameter: '50 mm',
    ),
    ProductData(
      id: 'B103',
      size: '250 ML',
      image: 'assets/images/250ml.webp',
      label: '30 g',
      height: '145.3 mm',
      thread: '37.7 mm',
      volume: '250 ml',
      material: 'HDPE/Co-Ex',
      diameter: '61 mm',
    ),
    ProductData(
      id: 'S107',
      size: '250 ML',
      image: 'assets/images/250ml-1.webp',
      label: '35 g',
      height: '135 mm',
      thread: '46 mm',
      volume: '250 ml',
      material: 'HDPE/Co-Ex',
      diameter: '62 mm',
    ),
    ProductData(
      id: 'IS102',
      size: '250 ML',
      image: 'assets/images/250ml-2.webp',
      label: '35 g',
      height: '135 mm',
      thread: '62 mm',
      volume: '250 ml',
      material: 'HDPE/Co-Ex',
      diameter: '62 mm',
    ),
    ProductData(
      id: 'B102',
      size: '500 ML',
      image: 'assets/images/500ml.webp',
      label: '50 g',
      height: '186 mm',
      thread: '37.4 mm',
      volume: '500 ml',
      material: 'HDPE/Co-Ex',
      diameter: '73 mm',
    ),
    ProductData(
      id: 'S106',
      size: '500 ML',
      image: 'assets/images/500ml-1.webp',
      label: '55 g',
      height: '188 mm',
      thread: '46 mm',
      volume: '500 ml',
      material: 'HDPE/Co-Ex',
      diameter: '68.6 mm',
    ),
    ProductData(
      id: 'B101',
      size: '1000 ML',
      image: 'assets/images/1000ml.webp',
      label: '95 g',
      height: '240 mm',
      thread: '37.3 mm',
      volume: '1000 ml',
      material: 'HDPE/Co-Ex',
      diameter: '90 mm',
    ),
    ProductData(
      id: 'BS105',
      size: '1000 ML',
      image: 'assets/images/1000ml-2.webp',
      label: '95 g',
      height: '240 mm',
      thread: '37.3 mm',
      volume: '1000 ml',
      material: 'HDPE/Co-Ex',
      diameter: '90 mm',
    ),
    ProductData(
      id: 'S101',
      size: '1000 ML',
      image: 'assets/images/1000ml-3.webp',
      label: '95 g',
      height: '225 mm',
      thread: '46 mm',
      volume: '1000 ml',
      material: 'HDPE/Co-Ex',
      diameter: '88.5 mm',
    ),
    ProductData(
      id: 'J1000',
      size: '5000 ML',
      image: 'assets/images/5000ml.webp',
      label: '300 g',
      height: '300 mm',
      thread: '62 mm',
      volume: '5000 ml',
      material: 'HDPE/Co-Ex',
      diameter: '',
    ),
  ];

  ProductData get currentProduct => products[currentIndex];

  void nextProduct() {
    setState(() {
      currentIndex = (currentIndex + 1) % products.length;
    });
  }

  void previousProduct() {
    setState(() {
      currentIndex =
          (currentIndex - 1 + products.length) % products.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppState.isArabic,
      builder: (context, isArabic, _) {
        return Directionality(
          textDirection:
              isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SiteHeader(),

                  _ProductsHero(
                    isArabic: isArabic,
                  ),

                  _ProductShowcase(
                    isArabic: isArabic,
                    product: currentProduct,
                    currentIndex: currentIndex,
                    totalProducts: products.length,
                    products: products,
                    onSelect: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    onPrevious: previousProduct,
                    onNext: nextProduct,
                  ),

                  _PackagingOptions(
                    isArabic: isArabic,
                  ),

                  _PackagingTypes(
                    isArabic: isArabic,
                  ),

                  const SiteFooter(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ============================================================
// PRODUCT MODEL
// ============================================================

class ProductData {
  final String id;
  final String size;
  final String image;
  final String label;
  final String height;
  final String thread;
  final String volume;
  final String material;
  final String diameter;

  const ProductData({
    required this.id,
    required this.size,
    required this.image,
    required this.label,
    required this.height,
    required this.thread,
    required this.volume,
    required this.material,
    required this.diameter,
  });
}

// ============================================================
// HERO
// ============================================================

class _ProductsHero extends StatelessWidget {
  final bool isArabic;

  const _ProductsHero({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 78,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Color(0xFFF7FAF8),
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductsEyebrow(
                text: isArabic
                    ? 'AGRO-SHIELD / مجموعة المنتجات'
                    : 'AGRO-SHIELD / Product Range',
                isArabic: isArabic,
              ),

              const SizedBox(height: 16),

              Text(
                isArabic
                    ? 'حلول تعبئة مصممة وفقًا لمتطلبات كل منتج.'
                    : 'Packaging solutions designed for specific product requirements.',
                style: const TextStyle(
                  color: Color(0xFF16322A),
                  fontSize: 39,
                  height: 1.22,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 17),

              Text(
                isArabic
                    ? 'استكشف حلول التعبئة لدينا للتطبيقات الزراعية والكيميائية، والمصممة وفقًا للمتطلبات الخاصة بكل منتج.'
                    : 'Explore our packaging solutions for agricultural and chemical applications, developed around the specific requirements of each product.',
                style: const TextStyle(
                  color: Color(0xFF71807B),
                  fontSize: 15,
                  height: 1.9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// PRODUCT SHOWCASE
// ============================================================

class _ProductShowcase extends StatelessWidget {
  final bool isArabic;
  final ProductData product;
  final int currentIndex;
  final int totalProducts;
  final List<ProductData> products;
  final ValueChanged<int> onSelect;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _ProductShowcase({
    required this.isArabic,
    required this.product,
    required this.currentIndex,
    required this.totalProducts,
    required this.products,
    required this.onSelect,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        24,
        35,
        24,
        70,
      ),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final mobile = constraints.maxWidth < 800;

                  final visual = _ProductVisual(
                    product: product,
                  );

                  final information = _ProductInformation(
                    isArabic: isArabic,
                    product: product,
                    currentIndex: currentIndex,
                    totalProducts: totalProducts,
                    products: products,
                    onSelect: onSelect,
                    onPrevious: onPrevious,
                    onNext: onNext,
                  );

                  if (mobile) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color(0xFFE1EAE5),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withValues(alpha: .06),
                            blurRadius: 35,
                            offset: const Offset(0, 15),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          visual,
                          information,
                        ],
                      ),
                    );
                  }

                  return Container(
                    constraints: const BoxConstraints(
                      minHeight: 590,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: const Color(0xFFE1EAE5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withValues(alpha: .07),
                          blurRadius: 60,
                          offset: const Offset(0, 22),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 48,
                          child: visual,
                        ),
                        Expanded(
                          flex: 52,
                          child: information,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// PRODUCT VISUAL
// ============================================================

class _ProductVisual extends StatelessWidget {
  final ProductData product;

  const _ProductVisual({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 590,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.0,
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFECF4F0),
            Color(0xFFDEEBE5),
          ],
          stops: [
            0.12,
            0.55,
            1.0,
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 390,
            height: 390,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0x1C1F5D4A),
              ),
            ),
          ),

          Container(
            width: 335,
            height: 335,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0x0D1F5D4A),
              ),
            ),
          ),

          Positioned(
            bottom: 58,
            child: Container(
              width: 245,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0x2614372D),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Image.asset(
              product.image,
              key: ValueKey(product.image),
              height: 440,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PRODUCT INFORMATION
// ============================================================

class _ProductInformation extends StatelessWidget {
  final bool isArabic;
  final ProductData product;
  final int currentIndex;
  final int totalProducts;
  final List<ProductData> products;
  final ValueChanged<int> onSelect;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _ProductInformation({
    required this.isArabic,
    required this.product,
    required this.currentIndex,
    required this.totalProducts,
    required this.products,
    required this.onSelect,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 590,
      padding: const EdgeInsets.symmetric(
        horizontal: 45,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.size,
            style: const TextStyle(
              color: Color(0xFF123F33),
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 28),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2.4,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _SpecItem(
                  label: isArabic
                      ? 'مساحة الملصق'
                      : 'Label Area',
                  value: product.label,
                ),
                _SpecItem(
                  label: isArabic ? 'الارتفاع' : 'Height',
                  value: product.height,
                ),
                _SpecItem(
                  label: isArabic
                      ? 'القلاوظ الخارجي'
                      : 'External Thread',
                  value: product.thread,
                ),
                _SpecItem(
                  label: isArabic ? 'السعة' : 'Volume',
                  value: product.volume,
                ),
                _SpecItem(
                  label: isArabic ? 'الخامة' : 'Material',
                  value: product.material,
                ),
                _SpecItem(
                  label: isArabic ? 'القطر' : 'Diameter',
                  value: product.diameter.isEmpty
                      ? '—'
                      : product.diameter,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 42,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: 7),
              itemBuilder: (context, index) {
                final active = index == currentIndex;

                return GestureDetector(
                  onTap: () => onSelect(index),
                  child: AnimatedContainer(
                    duration:
                        const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: active
                          ? const Color(0xFF123F33)
                          : const Color(0xFFF3F7F5),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: active
                            ? const Color(0xFF123F33)
                            : const Color(0xFFDCE7E1),
                      ),
                    ),
                    child: Text(
                      products[index].size,
                      style: TextStyle(
                        color: active
                            ? Colors.white
                            : const Color(0xFF587067),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 25),

          Row(
            children: [
              _ArrowButton(
                icon: Icons.arrow_back,
                onPressed: onPrevious,
                isArabic: isArabic,
              ),

              const SizedBox(width: 15),

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 3,
                    child: Stack(
                      children: [
                        Container(
                          color: const Color(0xFFE6EEE9),
                        ),
                        FractionallySizedBox(
                          widthFactor:
                              (currentIndex + 1) /
                                  totalProducts,
                          child: Container(
                            color: const Color(0xFF1F5D4A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 15),

              _ArrowButton(
                icon: Icons.arrow_forward,
                onPressed: onNext,
                isArabic: isArabic,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SpecItem extends StatelessWidget {
  final String label;
  final String value;

  const _SpecItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAF9),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE5ECE8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF71807B),
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF16322A),
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isArabic;

  const _ArrowButton({
    required this.icon,
    required this.onPressed,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 42,
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFDCE7E1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 17,
            color: const Color(0xFF123F33),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// PACKAGING OPTIONS
// ============================================================

class _PackagingOptions extends StatelessWidget {
  final bool isArabic;

  const _PackagingOptions({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 70,
      ),
      color: const Color(0xFFF7FAF8),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: const Color(0xFFDCE7E1),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .035),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final mobile = constraints.maxWidth < 700;

                final heading = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isArabic
                          ? 'خيارات العبوات'
                          : 'Packaging Options',
                      style: const TextStyle(
                        color: Color(0xFF1F5D4A),
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      isArabic
                          ? 'عبواتك. مواصفاتك.'
                          : 'Your Packaging. Your Specifications.',
                      style: const TextStyle(
                        color: Color(0xFF16322A),
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                );

                final options = [
                  isArabic ? 'IML' : 'IML',
                  isArabic ? 'الطباعة المباشرة' : 'Direct Printing',
                  isArabic
                      ? 'عبوات بدون طباعة'
                      : 'Unprinted Packaging',
                ];

                final optionWidget = Column(
                  children: [
                    for (int i = 0; i < options.length; i++)
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: i == options.length - 1
                              ? 0
                              : 12,
                        ),
                        child: _PackagingOption(
                          number: '0${i + 1}',
                          text: options[i],
                        ),
                      ),
                  ],
                );

                if (mobile) {
                  return Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      heading,
                      const SizedBox(height: 30),
                      optionWidget,
                    ],
                  );
                }

                return Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  children: [
                    Expanded(child: heading),
                    const SizedBox(width: 50),
                    Expanded(child: optionWidget),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _PackagingOption extends StatelessWidget {
  final String number;
  final String text;

  const _PackagingOption({
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAF8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE0E9E4),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF123F33),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF16322A),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PACKAGING TYPES
// ============================================================

class _PackagingTypes extends StatelessWidget {
  final bool isArabic;

  const _PackagingTypes({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 90,
      ),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductsEyebrow(
                text: isArabic
                    ? '02 / أنواع العبوات'
                    : '02 / PACKAGING TYPES',
                isArabic: isArabic,
              ),

              const SizedBox(height: 15),

              Text(
                isArabic
                    ? 'اختر هيكل العبوة المناسب لطبيعة منتجك.'
                    : 'Packaging structures designed around your product.',
                style: const TextStyle(
                  color: Color(0xFF16322A),
                  fontSize: 30,
                  height: 1.3,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                isArabic
                    ? 'حلول HDPE وCo-Ex مصممة لتلبية متطلبات الحماية والمقاومة والأداء.'
                    : 'HDPE and Co-Ex solutions designed to meet different protection, resistance and performance requirements.',
                style: const TextStyle(
                  color: Color(0xFF71807B),
                  fontSize: 15,
                  height: 1.8,
                ),
              ),

              const SizedBox(height: 35),

              LayoutBuilder(
                builder: (context, constraints) {
                  final mobile = constraints.maxWidth < 750;

                  final card = _PackagingTypeCard(
                    number: '01 / Co-Ex',
                    title: isArabic
                        ? 'عبوات متعددة الطبقات'
                        : 'Multilayer Containers',
                    description: isArabic
                        ? 'عبوات متعددة الطبقات من HDPE وPA وEVOH توفر حماية متقدمة ضد التسرب ونفاذ الغازات والرطوبة.'
                        : 'Multilayer containers combining HDPE, PA and EVOH to provide enhanced protection against leakage and the permeation of gases and moisture.',
                  );

                  final hdpe = _PackagingTypeCard(
                    number: '02 / HDPE',
                    title: isArabic
                        ? 'عبوات HDPE'
                        : 'HDPE Containers',
                    description: isArabic
                        ? 'حلول HDPE للتطبيقات التي تتطلب عبوات قوية وموثوقة.'
                        : 'HDPE solutions for applications requiring strong and reliable packaging.',
                  );

                  if (mobile) {
                    return Column(
                      children: [
                        card,
                        const SizedBox(height: 18),
                        hdpe,
                      ],
                    );
                  }

                  return Row(
                    children: [
                      Expanded(child: card),
                      const SizedBox(width: 18),
                      Expanded(child: hdpe),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PackagingTypeCard extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const _PackagingTypeCard({
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 245,
      ),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAF8),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFDCE7E1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(
              color: Color(0xFF1F5D4A),
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.1,
            ),
          ),

          const SizedBox(height: 22),

          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF16322A),
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            description,
            style: const TextStyle(
              color: Color(0xFF71807B),
              fontSize: 14,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SHARED EYEBROW
// ============================================================

class _ProductsEyebrow extends StatelessWidget {
  final String text;
  final bool isArabic;

  const _ProductsEyebrow({
    required this.text,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 34,
          height: 2,
          decoration: BoxDecoration(
            color: const Color(0xFF1F5D4A),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: const Color(0xFF1F5D4A),
            fontSize: isArabic ? 14 : 12,
            fontWeight: FontWeight.w900,
            letterSpacing: isArabic ? 0 : 1.4,
          ),
        ),
      ],
    );
  }
}