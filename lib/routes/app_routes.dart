import 'package:flutter/material.dart';
import '../pages/home/home_page.dart';
import '../pages/about/about_page.dart';
import '../pages/technology/technology_page.dart';
import '../pages/process/process_page.dart';
import '../pages/quality/quality_page.dart';
import '../pages/products/products_page.dart';
import '../pages/contact/contact_page.dart';

class AppRoutes {
  static const home = '/';
  static const about = '/about';
  static const technology = '/technology';
  static const process = '/process';
  static const quality = '/quality';
  static const products = '/products';
  static const contact = '/contact';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case about: return MaterialPageRoute(builder: (_) => const AboutPage());
      case technology: return MaterialPageRoute(builder: (_) => const TechnologyPage());
      case process: return MaterialPageRoute(builder: (_) => const ProcessPage());
      case quality: return MaterialPageRoute(builder: (_) => const QualityPage());
      case products: return MaterialPageRoute(builder: (_) => const ProductsPage());
      case contact: return MaterialPageRoute(builder: (_) => const ContactPage());
      case home:
      default: return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
