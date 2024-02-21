import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_end/infrastructure/commons/constants/image_constants.dart';
import 'package:front_end/infrastructure/providers/provider_registration.dart';
import 'package:front_end/infrastructure/utills/route_constants.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:front_end/ui/screens/home/screens/widgets/home_bottom_sheet.dart';
import 'package:front_end/ui/screens/home/widgets/add_guest_tile.dart';
import 'package:front_end/ui/screens/home/widgets/date_range_picker_tile.dart';
import 'package:front_end/ui/screens/home/widgets/login_widget.dart';
import 'package:intl/intl.dart';

class ConfirmPayScreen extends ConsumerStatefulWidget {
  const ConfirmPayScreen({super.key});

  @override
  ConsumerState<ConfirmPayScreen> createState() => _ConfirmPayScreenState();
}

enum PaymentMethod{FullPayment,PrePayment}

class _ConfirmPayScreenState extends ConsumerState<ConfirmPayScreen> {

  // int _countAdults = 0;

  DateTime rangeStartDate = DateTime.now();
  DateTime rangeEndDate = DateTime.now().add(const Duration(days: 2));

  PaymentMethod? _paymentMethod = PaymentMethod.FullPayment;

  void updateDateRange(DateTime startDate, DateTime endDate) {
    setState(() {
      rangeStartDate = startDate;
      rangeEndDate = endDate;
    });
  }

  Widget build(BuildContext context) {
    final authProviderWatch = ref.watch(authProvider);
    final homeProviderRead = ref.read(homeProvider);
    print(ref.watch(homeProvider).recentData);
    print(data[ref.watch(homeProvider).recentData]);
    var cardPrice = data[ref.watch(homeProvider).recentData]['cardPrice'];
    var formattedPrice = cardPrice?.replaceAll(',', '.');
    var multipliedPrice = (formattedPrice != null) ? (double.parse(formattedPrice) * 5).toStringAsFixed(2) : '';
    var cleaningFee = 14.44;
    var airbnbFee = 26.42;
    var total = double.parse(multipliedPrice) + cleaningFee + airbnbFee;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.all(6),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color(0xFFFFFFFF)),
              child: SvgPicture.asset(
                ImageConstants.backIcon,
                width: 20,
                height: 20,
              ),
            ),
          ),    
        ),
        title: const Text(
          'Confirmation and payment',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          // ignore: sort_child_properties_last
          child: Container(
            height: 1,
            color: Colors.grey.shade300,
          ),
          preferredSize: Size.fromHeight(0.5),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  SizedBox(
                    width: 170,
                    child: Hero(
                      tag: data[ref.watch(homeProvider).recentData]['displayImage'] ?? '',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          data[ref.watch(homeProvider).recentData]['displayImage'] ?? '',
                          fit: BoxFit.cover,
                        )
                      ),
                    )
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        title: 'Sunthon, Chang Wat Phuket',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        titleColor: Color.fromARGB(255, 85, 85, 85),
                        overflow: TextOverflow.visible
                      ),
                      AppText(
                        title: data[ref.watch(homeProvider).recentData]['cardName'] ?? '',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      const SizedBox(height: 35),
                      Row(
                        children: [
                          SvgPicture.asset(ImageConstants.startIcon, height: 14),
                          const SizedBox(width: 4),
                          AppText(
                            title: data[ref.watch(homeProvider).recentData]['cardrating'] ?? '',
                            // "5.0.",
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          const AppText(
                            title: ' reviews',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            textDecoration: TextDecoration.underline,
                          )
                        ],
                      ),
                    ],
                  ),
                ]
              )
            ),
            SizedBox(
              height: 7,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(color: Colors.grey.shade300),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: 'Your trips',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)
                          )),
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return DateRangePickerWidget(
                            onDateRangeSelected: updateDateRange,
                          );
                        },
                      );
                    },
                    child: RowWith2Text(textOne: 'Day',textTwo: '${DateFormat('dd').format(rangeStartDate)} - ${DateFormat('dd MMMM').format(rangeEndDate)}'),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)
                          )),
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return AddGuestWidget();
                        },
                      );
                    },
                    child: RowWith2Text(textOne: 'Guest',textTwo: '2 customers, 1 baby'),
                  )
                ]
              )
            ),
            SizedBox(
              height: 7,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(color: Colors.grey.shade300),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    title: 'Choose payment method',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const AppText(title: 'Full payment', fontSize: 17, fontWeight: FontWeight.w500),
                            const Spacer(),
                            Radio<PaymentMethod>(
                              value: PaymentMethod.FullPayment, 
                              groupValue: _paymentMethod,
                              activeColor: Colors.black, 
                              onChanged: (val) {
                                setState(() {
                                  _paymentMethod = val;
                                });
                              }
                            )
                          ],
                        ),
                        const AppText(title: 'pay the full amount (\$213,57) now and \nthat\'s it', fontSize: 14, fontWeight: FontWeight.w400,),
                      ]
                    )
                  ),
                  const Divider(thickness: 2),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const AppText(title: 'Partial prepayment', fontSize: 17, fontWeight: FontWeight.w500),
                            const Spacer(),
                            Radio<PaymentMethod>(
                              value: PaymentMethod.PrePayment,
                              groupValue: _paymentMethod,
                              activeColor: Colors.black, 
                              onChanged: (val) {
                                setState(() {
                                  _paymentMethod = val;
                                });
                              }
                            )
                          ],
                        ),
                        const AppText(title: 'Need to pay \$112.82 today and \$100.75 \non August 19, 2023. No surcharge', fontSize: 14, fontWeight: FontWeight.w400,),
                      ]
                    )
                  ),
                ]
              )
            ),
            SizedBox(
              height: 7,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(color: Colors.grey.shade300),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    title: 'Total price',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      AppText(
                        title: '\$$cardPrice x 5',
                        fontSize: 17, 
                        fontWeight: FontWeight.w400, 
                        titleColor: Colors.black
                      ),
                      const Spacer(),
                      AppText(
                        title: '\$$multipliedPrice', 
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      AppText(title: 'Cleaning fee', fontSize: 17, fontWeight: FontWeight.w400, titleColor: Colors.black),
                      Spacer(),
                      AppText(
                        title: '\$$cleaningFee', 
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      AppText(title: 'Airbnb service fee', fontSize: 17, fontWeight: FontWeight.w400, titleColor: Colors.black),
                      Spacer(),
                      AppText(
                        title: '\$$airbnbFee', 
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child:  const Divider(thickness: 2)
                  ),
                  Row(
                    children: [
                      AppText(title: 'Total (USD)', fontSize: 17, fontWeight: FontWeight.w500, titleColor: Colors.black),
                      Spacer(),
                      AppText(
                        title: '\$${total.toStringAsFixed(2)}', 
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ]
              )
            ),
            SizedBox(
              height: 7,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(color: Colors.grey.shade300),
              ),
            ),
            if(!authProviderWatch.isLoggedIn) 
            Container(
              padding: const EdgeInsets.all(24),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: 'Log in or register to make a reservation',
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 20),
                  LoginWidget()
                ]
              )
            ),
            if(authProviderWatch.isLoggedIn) ...[
              Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      title: 'General standards',
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 10),
                    const AppText(
                      title: 'We ask all our guests to keep in mind a few simple rules to be a great guest',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '• ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ' Comply with house rules',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '• ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ' Preserve the house as if it were your own',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                )
              ),
              SizedBox(
                height: 7,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    const AppText(
                      title: 'By selecting the button below, I agree to the Host\'s House Rules, our General Customer Guidelines, Airbnb\'s Placement and Refund Policy, and agree that Airbnb may charge my payment method. If there is damage I will be responsible for.', 
                      fontSize: 14,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      fontWeight: FontWeight.w400
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              title: const Text('Reserve Successfully'),
                              content: const Text('Go to check your booking'),
                              actions: [
                                GestureDetector(
                                  onTap: () {
                                    return Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: 80,
                                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFFBE1A1F)),
                                    child: const Center(
                                      child: AppText(
                                        title: "OK",
                                        fontSize: 16,
                                        lineHeight: 1,
                                        titleColor: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  )
                                )
                              ],
                            );
                          }
                        );
                        Navigator.pushNamed(context, RouteConstants.homeScreen);
                        homeProviderRead.setIsIndex(2);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xFFBE1A1F)),
                        child:const Align(
                          alignment: Alignment.center,
                          child: AppText(
                            title: "Confirmation and payment",
                            fontSize: 16,
                            lineHeight: 1,
                            titleColor: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              )
            ]
          ],
        )
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFFDDDDDD)))),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 30,
      )
    );
  }
}

class RowWith2Text extends StatelessWidget {
  final String textOne;
  final String textTwo;

  const RowWith2Text({super.key, required this.textOne, required this.textTwo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(title: textOne, fontSize: 17, fontWeight: FontWeight.w500, titleColor: Colors.black),
              const Spacer(),
              const AppText(
                title: 'Change', 
                fontSize: 17,
                fontWeight: FontWeight.w400,
                textDecoration: TextDecoration.underline,
              )
            ],
          ),
          AppText(title: textTwo, fontSize: 14, fontWeight: FontWeight.w400,),
        ],
      ),
    );
  }
}

