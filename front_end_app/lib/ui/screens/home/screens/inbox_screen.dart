import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_end/infrastructure/commons/constants/image_constants.dart';
import 'package:front_end/infrastructure/providers/provider_registration.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:front_end/ui/screens/home/screens/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_end/ui/screens/home/widgets/login_widget.dart';

class InboxScreen extends ConsumerStatefulWidget {
  const InboxScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InboxScreenState();
}

class _InboxScreenState extends ConsumerState<InboxScreen> {
  bool isMessageSelected = true;
  @override
  Widget build(BuildContext context) {
  final authProviderWatch = ref.watch(authProvider);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                const AppText(
                  title: 'Inbox',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
                if(authProviderWatch.isLoggedIn) ...[
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      ImageConstants.bellEmptyIcon,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      ImageConstants.menuIcon,
                      height: 20,
                      width: 20,
                    ),
                  )
                ]
              ],
            ),
            if(authProviderWatch.isLoggedIn) ...[
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      //  color: Colors.black,
                      color: Color.fromARGB(255, 201, 201, 201),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMessageSelected = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2.5, color: isMessageSelected ? Colors.black : Colors.transparent,
                              // color: Color.fromARGB(255, 201, 201, 201),
                            ),
                          ),
                        ),
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const AppText(
                          title: "Messages",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMessageSelected = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2.5, color: !isMessageSelected ? Colors.black : Colors.transparent,
                              // color: Color.fromARGB(255, 201, 201, 201),
                            ),
                          ),
                        ),
                        margin: const EdgeInsets.only(right: 8, left: 16),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const AppText(
                          title: "Notifications",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const NotificationTile(title: "Connect with Facebook to complete your profile and make it easy to log in."),
              const NotificationTile(
                  title:
                      "Please confirm your email address by clicking on the link we've just emailed you. If you cannot find the email, you can request a new confirmation email or change your email address."),         
            ],
            if(!authProviderWatch.isLoggedIn) ...[
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
                title: 'Whenever you login, you can see the message from the house owner after logging in.',
                fontSize: 16,
                overflow: TextOverflow.visible,
              ),
              const SizedBox(height: 20),
              const LoginWidget(width: 150)
            ]
          ],
        ),
      ),
    );
  }
}
