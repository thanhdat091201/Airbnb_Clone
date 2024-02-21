import 'package:front_end/infrastructure/commons/constants/image_constants.dart';
import 'package:front_end/infrastructure/providers/provider_registration.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:front_end/ui/commons/text_widget/text_field/round_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_end/ui/screens/home/widgets/add_guest_tile.dart';
import 'package:front_end/ui/screens/home/widgets/date_range_picker_tile.dart';
import 'package:intl/intl.dart';


class SearchWidget extends ConsumerStatefulWidget {
  const SearchWidget({super.key});

  @override
  ConsumerState<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends ConsumerState<SearchWidget> {
  double height = 56;
  bool isSearchSelected = false;
  bool isStaysSelected = true;
  double _slideValue = 0.0;
  // int isMapSelected = 0;
  final FocusNode _focusNode = FocusNode();

  DateTime rangeStartDate = DateTime.now();
  DateTime rangeEndDate = DateTime.now().add(const Duration(days: 2));

  @override
  Widget build(BuildContext context) {
    final homeProviderWatch = ref.watch(homeProvider);
    final homeProviderRead = ref.read(homeProvider);
    final bool hasTopNotch = MediaQuery.of(context).padding.top > 24.0;

    void updateDateRange(DateTime startDate, DateTime endDate) {
      setState(() {
        rangeStartDate = startDate;
        rangeEndDate = endDate;
      });
    }

    // return Container(
    //   height: isSearchSelected ? MediaQuery.of(context).size.height : 56,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(isSearchSelected ? 0 : 32),
    //     boxShadow: [
    //       !isSearchSelected
    //           ? const BoxShadow(blurRadius: 25.0, color: Color(0xFFB0B0B0))
    //           : const BoxShadow(blurRadius: 0, color: Colors.transparent)
    //     ],
    //   ),
    //   // child: !isSearchSelected
    // ? GestureDetector(
    //     onTap: () {
    //       homeProviderWatch.changeBottombarVisiblity(false);
    //       setState(() {
    //         // height = !isSearchSelected ? 56 : 300;
    //         isSearchSelected = true;
    //       });
    //     },
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 12),
    //       height: 56,
    //       decoration: BoxDecoration(
    //         color: const Color(0xFFF7F7F7),
    //         borderRadius: BorderRadius.circular(32),
    //       ),
    //       child: Row(
    //         children: [
    //           const SizedBox(width: 6),
    //           SvgPicture.asset(
    //             ImageConstants.exploreIcon,
    //             width: 18,
    //             height: 18,
    //           ),
    //           const SizedBox(width: 16),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: const [
    //               AppText(title: "Anywhere", fontSize: 14, fontWeight: FontWeight.w500),
    //               AppText(
    //                   title: "Any week • Add guests",
    //                   fontSize: 12,
    //                   fontWeight: FontWeight.w500,
    //                   titleColor: Color(0xFF717171)),
    //             ],
    //           ),
    //           const Spacer(),
    //           Container(
    //             padding: const EdgeInsets.all(10),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(50), border: Border.all(color: const Color(0xFF717171))),
    //             child: SvgPicture.asset(
    //               ImageConstants.filterIcon,
    //               width: 22,
    //               height: 22,
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   )
    //   //     : Container(
    //   //         color: const Color(0xFFF7F7F7),
    //   //         child: Column(
    //   //           children: [
    // Row(
    //   children: [
    //     GestureDetector(
    //       onTap: () {
    //         homeProviderWatch.changeBottombarVisiblity(true);
    //         setState(() {
    //           // height = !isSearchSelected ? 56 : 300;
    //           isSearchSelected = false;
    //         });
    //       },
    //       child: Container(
    //         padding: const EdgeInsets.all(8),
    //         decoration:
    //             BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: Colors.black)),
    //         child: SvgPicture.asset(
    //           ImageConstants.closeIcon,
    //           height: 12,
    //         ),
    //       ),
    //     ),
    //     const Spacer(),
    //     GestureDetector(
    //       onTap: () {
    //         setState(() {
    //           isStaysSelected = true;
    //         });
    //       },
    //       child: AnimatedContainer(
    //           curve: Curves.linear,
    //           duration: const Duration(seconds: 1),
    //           decoration: BoxDecoration(
    //             border: Border(
    //               bottom: BorderSide(width: 2.0, color: isStaysSelected ? Colors.black : Colors.transparent),
    //             ),
    //           ),
    //           child: AppText(
    //               title: "Stays",
    //               fontSize: 16,
    //               fontWeight: FontWeight.w500,
    //               titleColor: !isStaysSelected ? const Color(0xFF717171) : Colors.black)),
    //     ),
    //     const SizedBox(width: 20),
    //     GestureDetector(
    //       onTap: () {
    //         setState(() {
    //           isStaysSelected = false;
    //         });
    //       },
    //       child: AnimatedContainer(
    //         duration: const Duration(seconds: 1),
    //         decoration: BoxDecoration(
    //           border: Border(
    //             bottom: BorderSide(width: 2.0, color: !isStaysSelected ? Colors.black : Colors.transparent),
    //           ),
    //         ),
    //         child: AppText(
    //             title: "Experiences",
    //             fontSize: 16,
    //             fontWeight: FontWeight.w500,
    //             titleColor: isStaysSelected ? const Color(0xFF717171) : Colors.black),
    //       ),
    //     ),
    //     const Spacer(),
    //   ],
    // ),
    //   //             const SizedBox(height: 22),
    //   //             Container(
    //   //               decoration: BoxDecoration(
    //   //                 borderRadius: BorderRadius.circular(20),
    //   //                 boxShadow: const [BoxShadow(blurRadius: 25.0, color: Color(0xFFB0B0B0))],
    //   //               ),
    //   //               child: Container(
    //   //                 padding: const EdgeInsets.all(16),
    //   //                 decoration: BoxDecoration(
    //   //                   color: const Color(0xFFFFFFFF),
    //   //                   borderRadius: BorderRadius.circular(20),
    //   //                 ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       const AppText(
    //         title: "Where to?",
    //         fontSize: 22,
    //         fontWeight: FontWeight.w700,
    //       ),
    //       const SizedBox(height: 12),
    //       Container(
    //         // margin: EdgeInsets.symmetric(horizontal: 24),
    //         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    //         decoration: BoxDecoration(
    //             border: Border.all(color: const Color(0xFF717171)), borderRadius: BorderRadius.circular(12)),
    //         child: Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             SvgPicture.asset(
    //               ImageConstants.exploreIcon,
    //               width: 14,
    //               height: 14,
    //             ),
    //             const SizedBox(width: 12),
    //             const AppText(
    //               lineHeight: 1,
    //               title: "Search destinations",
    //               fontSize: 14,
    //               titleColor: Color(0xFF717171),
    //             ),
    //           ],
    //         ),
    //       ),
    //       const SizedBox(height: 12),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Container(
    //             height: 126,
    //             width: 126,
    //             color: Colors.blueAccent,
    //           ),
    //           const SizedBox(height: 6),
    //           const AppText(title: "I'm flexible", fontSize: 14),
    //         ],
    //       ),
    //     ],
    //   ),
    // ),
    //   //             ),
    //   //             const SizedBox(height: 14),
    // Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20),
    //     boxShadow: const [BoxShadow(blurRadius: 25.0, color: Color(0xFFB0B0B0))],
    //   ),
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    //     decoration: BoxDecoration(
    //       color: const Color(0xFFFFFFFF),
    //       borderRadius: BorderRadius.circular(16),
    //     ),
    //     child: Row(
    //       children: const [
    //         AppText(title: "When", fontSize: 14, fontWeight: FontWeight.w500, titleColor: Color(0xFF717171)),
    //         Spacer(),
    //         AppText(title: "Add dates", fontSize: 14, fontWeight: FontWeight.w500),
    //       ],
    //     ),
    //   ),
    // ),
    // const SizedBox(height: 14),
    // Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20),
    //     boxShadow: const [BoxShadow(blurRadius: 25.0, color: Color(0xFFB0B0B0))],
    //   ),
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    //     decoration: BoxDecoration(
    //       color: const Color(0xFFFFFFFF),
    //       borderRadius: BorderRadius.circular(16),
    //     ),
    //     child: Row(
    //       children: const [
    //         AppText(title: "Who", fontSize: 14, fontWeight: FontWeight.w500, titleColor: Color(0xFF717171)),
    //         Spacer(),
    //         AppText(title: "Add guests", fontSize: 14, fontWeight: FontWeight.w500),
    //       ],
    //     ),
    //   ),
    // ),
    //   //             const Spacer(),
    //   //             const Divider(),
    // Row(
    //   children: [
    //     const AppText(title: "Clear all", fontSize: 16, fontWeight: FontWeight.w500),
    //     const Spacer(),
    //     Container(
    //       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xFFD90E65)),
    //       child: Row(
    //         children: [
    //           SvgPicture.asset(
    //             ImageConstants.exploreIcon,
    //             width: 14,
    //             height: 14,
    //             color: const Color(0xFFFFFFFF),
    //           ),
    //           const SizedBox(width: 8),
    //           const AppText(
    //             title: "Search",
    //             fontSize: 16,
    //             lineHeight: 1,
    //             titleColor: Color(0xFFFFFFFF),
    //           )
    //         ],
    //       ),
    //     )
    //   ],
    // ),
    //   //             const SizedBox(height: 24),
    //   //           ],
    //   //         ),
    //   //       ),

    // );
    return Column(
      children: [
        Container(
          // color: const Color(0xFFFFFFFF),
          padding: EdgeInsets.only(
              left: homeProviderWatch.isSearchDestination ? 0 : 24,
              right: homeProviderWatch.isSearchDestination ? 0 : 24,
              top: hasTopNotch ? 70 : 48),
          child: Column(
            children: [
              // stays and experience
              if (isSearchSelected)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: homeProviderWatch.isSearchDestination ? 24 : 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (isSearchSelected && !homeProviderWatch.isSearchDestination) {
                            homeProviderWatch.changeBottombarVisiblity(true);
                            setState(() {
                              isSearchSelected = false;
                            });
                          } else {
                            homeProviderWatch.changeSearchDestination(false);
                          }
                        },
                        child: AnimatedContainer(
                          curve: Curves.bounceIn,
                          duration: const Duration(seconds: 1),
                          padding: const EdgeInsets.all(8),
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: Colors.black)),
                          child: SvgPicture.asset(
                            homeProviderWatch.isSearchDestination ? ImageConstants.backArrowIcon : ImageConstants.closeIcon,
                            height: 12,
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          homeProviderRead.changeSearchDestination(false);
                          setState(() {
                            isStaysSelected = true;
                            _slideValue = 0.0;
                          });
                        },
                        child: AnimatedContainer(
                            curve: Curves.linear,
                            duration: const Duration(seconds: 1),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 2.0, color: isStaysSelected ? Colors.black : Colors.transparent),
                              ),
                            ),
                            child: AppText(
                                title: "Stays",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                titleColor: !isStaysSelected ? const Color(0xFF717171) : Colors.black)),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          homeProviderRead.changeSearchDestination(false);
                          setState(() {
                            isStaysSelected = false;
                            _slideValue = 1.0;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 2.0, color: !isStaysSelected ? Colors.black : Colors.transparent),
                            ),
                          ),
                          child: AppText(
                              title: "Experiences",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              titleColor: isStaysSelected ? const Color(0xFF717171) : Colors.black),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),

              Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    // curve: Curves.easeInOut,
                    transform: Matrix4.translationValues(
                      MediaQuery.of(context).size.width * (_slideValue - 1),
                      0,
                      0,
                    ),
                    child: Column(
                      children: [
                        if (isSearchSelected) const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            homeProviderRead.changeBottombarVisiblity(false);
                            setState(() {
                              // height = !isSearchSelected ? 56 : 300;
                              isSearchSelected = true;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 120),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            height: homeProviderWatch.isSearchDestination
                                ? MediaQuery.of(context).size.height - 300
                                : !isSearchSelected
                                    ? 56
                                    : 278,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xffDDDDDD),
                                  blurRadius: 6.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (!isSearchSelected)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 6),
                                          SvgPicture.asset(
                                            ImageConstants.exploreIcon,
                                            width: 18,
                                            height: 18,
                                          ),
                                          const SizedBox(width: 16),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              AppText(title: "Anywhere", fontSize: 14, fontWeight: FontWeight.w500),
                                              AppText(
                                                  title: "Any week • Add guests",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  titleColor: Color(0xFF717171)),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                border: Border.all(color: const Color(0xFF717171))),
                                            child: SvgPicture.asset(
                                              ImageConstants.filterIcon,
                                              width: 22,
                                              height: 22,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  if (isSearchSelected)
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          if (!homeProviderWatch.isSearchDestination)
                                            const AppText(
                                              title: "Where to?",
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          const SizedBox(height: 12),
                                          if (!homeProviderWatch.isSearchDestination)
                                            GestureDetector(
                                              onTap: () {
                                                homeProviderRead.changeSearchDestination(true);
                                                Future.delayed(const Duration(milliseconds: 10), () {
                                                  FocusScope.of(context).requestFocus(_focusNode);
                                                });
                                              },
                                              child: Container(
                                                // margin: EdgeInsets.symmetric(horizontal: 24),
                                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: const Color(0xFF717171)),
                                                    borderRadius: BorderRadius.circular(12)),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      ImageConstants.exploreIcon,
                                                      width: 14,
                                                      height: 14,
                                                    ),
                                                    const SizedBox(width: 12),
                                                    const AppText(
                                                      lineHeight: 1,
                                                      title: "Search destinations",
                                                      fontSize: 14,
                                                      titleColor: Color(0xFF717171),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          if (homeProviderWatch.isSearchDestination)
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 17),
                                              child: RoundedTextFormFieldWidget(
                                                focusNode: _focusNode,
                                                hintText: "Search destinations",
                                                fillColor: const Color(0xFFF7F7F7),
                                                borderRadius: BorderRadius.circular(10),
                                                prefixIconWidget: Padding(
                                                  padding: const EdgeInsets.all(16.0),
                                                  child: SvgPicture.asset(
                                                    ImageConstants.exploreIcon,
                                                    width: 14,
                                                    height: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          const SizedBox(height: 12),
                                          if (!homeProviderWatch.isSearchDestination) const MapListWidget()
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),

                        // three
                        if (!homeProviderWatch.isSearchDestination)
                        RowWithText(isSearchSelected: isSearchSelected, textOne: 'When', textTwo: 'Add dates'),

                        if (!homeProviderWatch.isSearchDestination)
                          RowWithText(isSearchSelected: isSearchSelected, textOne: 'Who', textTwo: 'Add guests')
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    // curve: Curves.easeInOut,
                    transform: Matrix4.translationValues(
                      MediaQuery.of(context).size.width * _slideValue,
                      0,
                      0,
                    ),
                    child: Column(
                      children: [
                        if (isSearchSelected) const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            homeProviderRead.changeBottombarVisiblity(false);
                            setState(() {
                              // height = !isSearchSelected ? 56 : 300;
                              isSearchSelected = true;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 120),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            height: homeProviderWatch.isSearchDestination
                                ? MediaQuery.of(context).size.height - 300
                                : !isSearchSelected
                                    ? 56
                                    : 278,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xffDDDDDD),
                                  blurRadius: 6.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (!isSearchSelected)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 6),
                                          SvgPicture.asset(
                                            ImageConstants.exploreIcon,
                                            width: 18,
                                            height: 18,
                                          ),
                                          const SizedBox(width: 16),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              AppText(title: "Anywhere", fontSize: 14, fontWeight: FontWeight.w500),
                                              AppText(
                                                  title: "Any week • Add guests",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  titleColor: Color(0xFF717171)),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                border: Border.all(color: const Color(0xFF717171))),
                                            child: SvgPicture.asset(
                                              ImageConstants.filterIcon,
                                              width: 22,
                                              height: 22,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  if (isSearchSelected)
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          if (!homeProviderWatch.isSearchDestination)
                                            const AppText(
                                              title: "Where to?",
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          const SizedBox(height: 12),
                                          if (!homeProviderWatch.isSearchDestination)
                                            GestureDetector(
                                              onTap: () {
                                                homeProviderRead.changeSearchDestination(true);
                                                Future.delayed(const Duration(milliseconds: 10), () {
                                                  FocusScope.of(context).requestFocus(_focusNode);
                                                });
                                              },
                                              child: Container(
                                                // margin: EdgeInsets.symmetric(horizontal: 24),
                                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: const Color(0xFF717171)),
                                                    borderRadius: BorderRadius.circular(12)),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      ImageConstants.exploreIcon,
                                                      width: 14,
                                                      height: 14,
                                                    ),
                                                    const SizedBox(width: 12),
                                                    const AppText(
                                                      lineHeight: 1,
                                                      title: "Search destinations",
                                                      fontSize: 14,
                                                      titleColor: Color(0xFF717171),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          if (homeProviderWatch.isSearchDestination)
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 17),
                                              child: RoundedTextFormFieldWidget(
                                                focusNode: _focusNode,
                                                hintText: "Search destinations",
                                                fillColor: const Color(0xFFF7F7F7),
                                                borderRadius: BorderRadius.circular(10),
                                                prefixIconWidget: Padding(
                                                  padding: const EdgeInsets.all(16.0),
                                                  child: SvgPicture.asset(
                                                    ImageConstants.exploreIcon,
                                                    width: 14,
                                                    height: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          const SizedBox(height: 12),
                                          if (!homeProviderWatch.isSearchDestination) const MapListWidget()
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),

                        // three
                        if (!homeProviderWatch.isSearchDestination)
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
                            child: RowWithText(isSearchSelected: isSearchSelected, textOne: 'When', textTwo: '${DateFormat('dd').format(rangeStartDate)} - ${DateFormat('dd MMMM').format(rangeEndDate)}')
                          ),

                        if (!homeProviderWatch.isSearchDestination)
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
                                  return const AddGuestWidget();
                                },
                              );
                            },
                            child: RowWithText(isSearchSelected: isSearchSelected, textOne: 'Who', textTwo: 'Add guests')
                          )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SearchMaps extends StatelessWidget {
  final String mapImage;
  final String title;
  final bool isSelected;
  const SearchMaps({super.key, required this.mapImage, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? const Color(0xFF222222) : Colors.transparent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.asset(
                mapImage,
                // ImageConstants.europeMap,
                height: 126,
                width: 126,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 6),
          AppText(
            title: title,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ],
      ),
    );
  }
}

const data = [
  {
    "title": "I'm flexible",
    "mapImage": ImageConstants.iMFlexibleMap,
  },
  {
    "title": "Europe",
    "mapImage": ImageConstants.europeMap,
  },
  {
    "title": "United Kingdom",
    "mapImage": ImageConstants.unitedKingdomMap,
  },
  {
    "title": "Southeast Asia",
    "mapImage": ImageConstants.southEastAsiaMap,
  },
  {
    "title": "Thailand",
    "mapImage": ImageConstants.thilandMap,
  },
  {
    "title": "Middle East",
    "mapImage": ImageConstants.middleEastMap,
  },
  {
    "title": "Indonesia",
    "mapImage": ImageConstants.indonesiaMap,
  },
  {
    "title": "United States",
    "mapImage": ImageConstants.unitedKingdomMap,
  },
  {
    "title": "Canada",
    "mapImage": ImageConstants.canadaMap,
  },
];

class RowWithText extends StatelessWidget {
  final bool isSearchSelected;
  final String textOne;
  final String textTwo;

  const RowWithText({super.key, required this.isSearchSelected, required this.textOne, required this.textTwo});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(top: 14),
      duration: const Duration(milliseconds: 120),
      height: isSearchSelected ? 70 : 0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(blurRadius: 25.0, color: Color(0xFFB0B0B0))],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            AppText(title: textOne, fontSize: 14, fontWeight: FontWeight.w500, titleColor: const Color(0xFF717171)),
            const Spacer(),
            AppText(title: textTwo, fontSize: 14, fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}

class MapListWidget extends StatefulWidget {
  const MapListWidget({super.key});

  @override
  State<MapListWidget> createState() => _MapListWidgetState();
}

class _MapListWidgetState extends State<MapListWidget> {
  int isMapSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < data.length; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  isMapSelected = i;
                });
              },
              child: SearchMaps(
                mapImage: data[i]['mapImage']!,
                title: data[i]['title'] ?? '',
                isSelected: isMapSelected == i ? true : false,
              ),
            )
        ],
      ),
    );
  }
}
