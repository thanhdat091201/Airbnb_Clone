import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:front_end/infrastructure/providers/provider_registration.dart';
import 'package:flutter/material.dart';
import 'package:front_end/ui/screens/home/widgets/login_widget.dart';

class WishlistScreen extends ConsumerStatefulWidget {
  const WishlistScreen({super.key});

  @override
  ConsumerState<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends ConsumerState<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final authProviderWatch = ref.watch(authProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(authProviderWatch.isLoggedIn) ...[
                  const SizedBox(height: 50),
                  const AppText(
                    title: "Wishlists",
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 14),
                  const Divider(),
                  const SizedBox(height: 14),
                  const AppText(
                    title: 'Create your first wishlist',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    titleColor: Color(0xFF222222),
                  ),
                  const SizedBox(height: 8),
                  const AppText(
                    title: 'As you search, tap the heart icon to save your favorite places to stay or things to do to a wishlist.',
                    fontSize: 16,
                    overflow: TextOverflow.visible,
                  ),
                ],
                if(!authProviderWatch.isLoggedIn) ...[
                  const SizedBox(height: 50),
                  const AppText(
                    title: "Wishlists",
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 14),
                  const Divider(),
                  const SizedBox(height: 14),
                  const AppText(
                    title: 'Login to see your Wishlists !!!',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    titleColor: Color(0xFF222222),
                  ),
                  const SizedBox(height: 8),
                  const AppText(
                    title: 'Whenever you login, you can create, view or edit a Wishlists after logging in.',
                    fontSize: 16,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(height: 20),
                  const LoginWidget(width: 150)
                ]
              ]
            )
          ),
        ],
      )
    );
  }
}

