import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_end/infrastructure/commons/constants/image_constants.dart';
import 'package:front_end/infrastructure/providers/provider_registration.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:front_end/ui/screens/home/screens/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_end/ui/screens/home/widgets/login_widget.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
  final authProviderWatch = ref.watch(authProvider);
  final authProviderRead = ref.read(authProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 50),
              const SizedBox(height: 48),
              const AppText(
                title: 'Profile',
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
              if(authProviderWatch.isLoggedIn) ...[
                const SizedBox(height: 32),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.asset(
                        ImageConstants.profileAvatar,
                        height: 56,
                        width: 56,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        AppText(title: "Nguyen Thanh Dat", fontSize: 16),
                        AppText(
                          title: "Show profile",
                          fontSize: 14,
                          titleColor: Color(0xFF717171),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      ImageConstants.arrowRightIcon,
                      height: 16,
                      width: 16,
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
              ],
              if(!authProviderWatch.isLoggedIn) ...[
                const SizedBox(height: 20),
                const Text(
                  'Sign in to start planning your next vacation after logging in.',
                  style: TextStyle(
                    fontSize: 16,
                    overflow: TextOverflow.visible,
                  ),
                ),
                const SizedBox(height: 16),
                const LoginWidget(width: double.infinity),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                          text: "Don’t have account? ",
                          style: TextStyle(fontSize: 14, color: Color(0xFF222222)),
                          children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ]))
                  ],
                ),
              ],
              Container(
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.symmetric(vertical: 24),
                // color: Color(0xFFFFFFFF),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffDDDDDD),
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                      offset: Offset(0.0, 0.0),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText(
                          title: "Airbnb houser rental",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          titleColor: Color(0xFF222222),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 200,
                          child: const AppText(
                            title: "It's simple to get set up and start earning.",
                            overflow: TextOverflow.visible,
                            fontSize: 14,
                            titleColor: Color(0xFF222222),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      ImageConstants.profilePlaceImage,
                      height: 88,
                      width: 104,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
              ),
              if(authProviderWatch.isLoggedIn) ...[
                const ProfileTile(icon: ImageConstants.profileIcon, title: 'Personal info'),
                const ProfileTile(icon: ImageConstants.accountSettingIcon, title: 'Account'),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 24),
                  child: AppText(title: 'Hosting', fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const ProfileTile(icon: ImageConstants.hostHomeIcon, title: 'Host a home'),
                const ProfileTile(icon: ImageConstants.experienceIcon, title: 'Host an experience'),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 24),
                  child: AppText(title: 'Referrals & credits', fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const ProfileTile(icon: ImageConstants.referIcon, title: 'Refer a Host'),
                const Divider(),
              ],    
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 24),
                child: AppText(title: 'Support', fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const ProfileTile(icon: ImageConstants.tripsIcon, title: 'How front_end works'),
              const ProfileTile(icon: ImageConstants.helpIcon, title: 'Get help'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ImageConstants.contactIcon,
                      // ImageConstants.profileIcon,
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 102,
                                child: const AppText(title: "Contact Neighbourhood Support", fontSize: 16)),
                            SvgPicture.asset(
                              ImageConstants.arrowRightIcon,
                              height: 16,
                              width: 16,
                            )
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 88,
                          child: const AppText(
                            title: "Let our team know about concerns related to home-sharing activity in your area.",
                            overflow: TextOverflow.visible,
                            fontSize: 14,
                            titleColor: Color(0xFF717171),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              if(authProviderWatch.isLoggedIn) ...[
                const SizedBox(height: 20),
                Row(
                  children: [
                    SvgPicture.asset(ImageConstants.earthIcon, height: 16, width: 16),
                    const SizedBox(width: 8),
                    const AppText(title: "English (IN)", fontSize: 14, fontWeight: FontWeight.w600),
                    const SizedBox(width: 24),
                    const AppText(title: "₹ INR", fontSize: 14, fontWeight: FontWeight.w600),
                  ],
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    authProviderRead.changeLoggedIn(false);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const AppText(
                      title: "Log out",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      titleTextAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              Center(
                child: RichText(
                    text: const TextSpan(
                        text: "",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF222222),
                          // decoration: TextDecoration.underline,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                        text: 'Help & support',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: ' · ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: ' · ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ])),
              ),
              const SizedBox(height: 4),
              const Center(
                child: AppText(
                  title: '© 2023 front_end, Inc. All rights reserved.',
                  fontSize: 12,
                  titleColor: Color(0xFF767676),
                ),
              ),
              const SizedBox(height: 54),
            ],
          ),
        ),
      ),
    );
  }
}
