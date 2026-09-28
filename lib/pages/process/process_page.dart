import 'package:flutter/material.dart';

import '../../state/app_state.dart';
import '../../widgets/site_header.dart';
import '../../widgets/site_footer.dart';

class ProcessPage extends StatelessWidget {
  const ProcessPage({super.key});

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

                  _ProcessHero(
                    isArabic: isArabic,
                  ),

                  _ManufacturingProcess(
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


/* =========================================================
   PROCESS HERO
========================================================= */

class _ProcessHero extends StatelessWidget {
  final bool isArabic;

  const _ProcessHero({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF2F7F4),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 72,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 28,
                    height: 2,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFE2B94F),
                          Color(0xFF356C4D),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Text(
                    isArabic
                        ? 'مراحل التصنيع'
                        : 'Process',
                    style: TextStyle(
                      fontFamily:
                          isArabic ? 'Cairo' : 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF356C4D),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 17),

              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 850,
                ),
                child: Text(
                  isArabic
                      ? 'رحلة تصنيع منضبطة تبدأ من التصميم وتنتهي بالعبوة النهائية.'
                      : 'A controlled manufacturing journey from design to finished packaging.',
                  style: TextStyle(
                    fontFamily:
                        isArabic ? 'Cairo' : 'Inter',
                    fontSize: 40,
                    height: 1.25,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1F2D26),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 800,
                ),
                child: Text(
                  isArabic
                      ? 'من تصنيع القوالب عالية الدقة والنفخ الآلي إلى دمج تقنية IML باستخدام الروبوتات واختبارات الجودة والتغليف النهائي، تم تصميم كل مرحلة لتقديم حلول تغليف موثوقة وعالية الأداء.'
                      : 'From precision mold manufacturing and automated blow molding to robotic IML integration, quality testing and final packaging, every stage is designed to deliver reliable and high-performance packaging solutions.',
                  style: TextStyle(
                    fontFamily:
                        isArabic ? 'Cairo' : 'Inter',
                    fontSize: 14,
                    height: 1.85,
                    color: const Color(0xFF6B7D73),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/* =========================================================
   MANUFACTURING PROCESS
========================================================= */

class _ManufacturingProcess extends StatelessWidget {
  final bool isArabic;

  const _ManufacturingProcess({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final mobile =
                  constraints.maxWidth < 760;

              return Column(
                children: [
                  _ProcessStep(
                    number: '01',
                    title: isArabic
                        ? 'التصميم'
                        : 'Design',
                    description: isArabic
                        ? 'تطوير مستمر للتصميم يركز على متطلبات السوق الحديثة واحتياجات المنتج وحلول التغليف المخصصة.'
                        : 'Continuous design development focused on modern market requirements, product needs and customized packaging solutions.',
                    isArabic: isArabic,
                    mobile: mobile,
                    first: true,
                  ),

                  _ProcessStep(
                    number: '02',
                    title: isArabic
                        ? 'تصنيع القالب'
                        : 'Mold Manufacturing',
                    description: isArabic
                        ? 'يتم تصنيع قوالب عالية الدقة لتلبية التصميم المطلوب للعبوة والحفاظ على ثبات جودة الإنتاج.'
                        : 'High-precision molds are manufactured to meet the required container design and maintain consistent production quality.',
                    isArabic: isArabic,
                    mobile: mobile,
                  ),

                  _ProcessStep(
                    number: '03',
                    title: isArabic
                        ? 'النفخ'
                        : 'Blow Molding',
                    description: isArabic
                        ? 'يتم تشكيل العبوة باستخدام أحدث تقنيات النفخ الآلية، مع التحكم في ظروف التشغيل للوصول إلى الشكل والتركيب والأبعاد المطلوبة.'
                        : 'The container is formed using advanced automated blow molding technology, with controlled process conditions to achieve the required shape, structure and dimensions.',
                    isArabic: isArabic,
                    mobile: mobile,
                  ),

                  _ProcessStep(
                    number: '04',
                    title: isArabic
                        ? 'دمج تقنية IML'
                        : 'IML Integration',
                    description: isArabic
                        ? 'يتم إدخال ملصق IML البوليستري بواسطة روبوت ودمجه مع العبوة أثناء عملية التصنيع، للحصول على ملصق متين وثابت وعالي المقاومة.'
                        : 'A polyester IML label is inserted by a robot and integrated with the container during molding, creating a durable, consistent and highly resistant label finish.',
                    isArabic: isArabic,
                    mobile: mobile,
                  ),

                  _ProcessStep(
                    number: '05',
                    title: isArabic
                        ? 'اختبارات الجودة'
                        : 'Quality Testing',
                    description: isArabic
                        ? 'يتم فحص العبوات النهائية من خلال اختبارات جودة عملية، تشمل اختبار الضغط والسقوط والتسريب، للتحقق من القوة والسلامة والأداء.'
                        : 'Finished containers are inspected through practical quality checks, including compression, drop and leak testing, to verify strength, integrity and performance.',
                    isArabic: isArabic,
                    mobile: mobile,
                  ),

                  _ProcessStep(
                    number: '06',
                    title: isArabic
                        ? 'التغليف'
                        : 'Packaging',
                    description: isArabic
                        ? 'يتم تغليف المنتجات بعناية للحفاظ على جودتها النهائية وتجهيزها للتخزين والتداول والتوريد بشكل موثوق.'
                        : 'Products are carefully packaged to preserve their final quality and prepare them for reliable storage, handling and delivery.',
                    isArabic: isArabic,
                    mobile: mobile,
                    last: true,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}


/* =========================================================
   PROCESS STEP
========================================================= */

class _ProcessStep extends StatefulWidget {
  final String number;
  final String title;
  final String description;
  final bool isArabic;
  final bool mobile;
  final bool first;
  final bool last;

  const _ProcessStep({
    required this.number,
    required this.title,
    required this.description,
    required this.isArabic,
    required this.mobile,
    this.first = false,
    this.last = false,
  });

  @override
  State<_ProcessStep> createState() =>
      _ProcessStepState();
}

class _ProcessStepState extends State<_ProcessStep> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.mobile) {
      return _buildMobile();
    }

    return _buildDesktop();
  }


  /* =======================================================
     DESKTOP
  ======================================================= */

  Widget _buildDesktop() {
    return SizedBox(
      width: double.infinity,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 90,
              child: Column(
                children: [
                  if (!widget.first)
                    Container(
                      width: 2,
                      height: 35,
                      color: const Color(0xFFDCE8DF),
                    ),

                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF356C4D),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withValues(
                            alpha: .08,
                          ),
                          blurRadius: 18,
                          offset:
                              const Offset(0, 7),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.number,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),

                  if (!widget.last)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: const Color(0xFFDCE8DF),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(width: 25),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 30,
                ),
                child: _card(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  /* =======================================================
     MOBILE
  ======================================================= */

  Widget _buildMobile() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 18,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF356C4D),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.number,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              if (!widget.last)
                Container(
                  width: 2,
                  height: 120,
                  color: const Color(0xFFDCE8DF),
                ),
            ],
          ),

          const SizedBox(width: 15),

          Expanded(
            child: _card(),
          ),
        ],
      ),
    );
  }


  /* =======================================================
     CARD
  ======================================================= */

  Widget _card() {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 250,
        ),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(20),
          border: Border.all(
            color: hovered
                ? const Color(0xFFCBDCD4)
                : const Color(0xFFDCE8DF),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: hovered ? .08 : .045,
              ),
              blurRadius:
                  hovered ? 32 : 24,
              offset: Offset(
                0,
                hovered ? 14 : 8,
              ),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration:
                      const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFE2B94F),
                  ),
                ),

                const SizedBox(width: 10),

                Text(
                  'STEP ${widget.number}',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    color: Color(0xFF6B7D73),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 13),

            Text(
              widget.title,
              style: TextStyle(
                fontFamily: widget.isArabic
                    ? 'Cairo'
                    : 'Inter',
                fontSize:
                    widget.isArabic ? 21 : 22,
                height: 1.35,
                fontWeight: FontWeight.w800,
                color:
                    const Color(0xFF1F2D26),
              ),
            ),

            const SizedBox(height: 11),

            Text(
              widget.description,
              style: TextStyle(
                fontFamily: widget.isArabic
                    ? 'Cairo'
                    : 'Inter',
                fontSize:
                    widget.isArabic ? 14 : 13,
                height:
                    widget.isArabic ? 1.9 : 1.8,
                color:
                    const Color(0xFF6B7D73),
              ),
            ),
          ],
        ),
      ),
    );
  }
}