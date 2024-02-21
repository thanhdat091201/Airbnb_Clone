import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_end/infrastructure/providers/provider_registration.dart';
import 'package:front_end/ui/screens/home/widgets/login_widget.dart';


class TripsScreen extends ConsumerStatefulWidget {
  const TripsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TripsScreenState();
}

class _TripsScreenState extends ConsumerState<TripsScreen> {

  @override
  Widget build(BuildContext context) {
    final authProviderWatch = ref.watch(authProvider);
    final homeProviderRead = ref.read(homeProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const AppText(
              title: 'Trips',
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 14),
            const Divider(),
            const SizedBox(height: 14),
            const AppText(
              title: 'No trips booked ... yet!',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.visible,
            ),
            const SizedBox(height: 8),
            const AppText(
              title: 'Time to dust off your bags and start planning your next adventure',
              fontSize: 16,
              overflow: TextOverflow.visible,
            ),
            const SizedBox(height: 20),
            if(authProviderWatch.isLoggedIn)
              GestureDetector(
                onTap: () {
                  homeProviderRead.setIsIndex(0);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black)),
                  child: const AppText(
                    title: 'Start searching',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            if(!authProviderWatch.isLoggedIn) 
            const LoginWidget(width: 150),
            const SizedBox(height: 14),
            const Divider(),
            const SizedBox(height: 14),
            RichText(
                text: const TextSpan(
                    text: "Can’t find your reservation here? ",
                    style: TextStyle(fontSize: 14, color: Color(0xFF222222)),
                    children: <TextSpan>[
                  TextSpan(
                    text: 'Visit the Help Centre',
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
      ),
    );
  }


}
