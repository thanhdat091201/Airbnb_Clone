import 'package:front_end/infrastructure/providers/auth_provider/auth_provider.dart';
import 'package:front_end/infrastructure/providers/home_provider/home_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider((ref) => HomeProvider());
final authProvider = ChangeNotifierProvider((ref) => AuthProvider());

