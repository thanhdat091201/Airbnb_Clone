import 'package:flutter/material.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';

class AddGuestWidget extends StatefulWidget {
  const AddGuestWidget({Key? key}) : super(key: key);

  @override
  State<AddGuestWidget> createState() => _AddGuestWidgetState();
}

class _AddGuestWidgetState extends State<AddGuestWidget> with TickerProviderStateMixin{
  bool hasBottomNotch = false;
  int _adultsCount = 0;
  int _babyCount = 0;

  @override
  Widget build(BuildContext context) {
    
    final bool hasTopNotch = MediaQuery.of(context).padding.top > 24.0;
    final maxHeight = MediaQuery.of(context).size.height * (0.60);
    return Container(
      padding: EdgeInsets.only(
        top: hasTopNotch ? 20 : 8),
      height:maxHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20)
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const AppText(
                  title: 'Who is coming?',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.visible,
                ),
                const SizedBox(height: 15),
                ManagedNumberWidget(
                  textOne: 'Adults', 
                  textTwo: 'From 13 years old and up',
                  countCallback: (count) {
                    _adultsCount = count;
                  }
                ),
                ManagedNumberWidget(
                  textOne: 'Children', 
                  textTwo: 'Age between 2 - 12',
                  countCallback: (count) {
                    _babyCount = count;
                  }
                ),
                ManagedNumberWidget(textOne: 'Baby', textTwo: 'Under 2 months'),
                ManagedNumberWidget(textOne: 'Pets', textTwo: 'Will you bring service animals?'),
              ]
            )
          ),
          Expanded(
            child: Container(), // Widget nằm ở giữa màn hình
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            height: hasBottomNotch ? 80 : 70,
            decoration: const BoxDecoration(
              color:  Color(0xFFFFFFFF),
              border: Border(
                top: BorderSide(width: 1.0, color: Color.fromARGB(255, 201, 201, 201)),
              ),
            ),
            // height: 100,
            // color: Colors.amberAccent,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    return Navigator.of(context).pop();
                  },
                  child: const AppText(title: "Skip", fontSize: 16, fontWeight: FontWeight.w500, textDecoration: TextDecoration.underline),
                ),
                const Spacer(),
                Container(
                  width: 100,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        return Navigator.of(context).pop();
                      },
                      child: const AppText(
                        title: "Done",
                        fontSize: 16,
                        lineHeight: 1,
                        titleColor: Color(0xFFFFFFFF),
                      ),
                    )
                  ),
                )
              ],
            ),
          )
        ]
      )
    );
  }
}

class ManagedNumberWidget extends StatefulWidget {
  final String textOne;
  final String textTwo;
  final ValueChanged<int>? countCallback;
  const ManagedNumberWidget({super.key, required this.textOne, required this.textTwo, this.countCallback});

  @override
  State<ManagedNumberWidget> createState() => _ManagedNumberWidgetState();
}

class _ManagedNumberWidgetState extends State<ManagedNumberWidget> {
  bool hasBottomNotch = false;
  int _count = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final padding = MediaQuery.of(context).padding;
      if (padding.bottom > 0) {
        setState(() {
          hasBottomNotch = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isRemoveButtonDisabled = (_count == 0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),      
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(title: widget.textOne, fontSize: 17, fontWeight: FontWeight.w500),
              AppText(title: widget.textTwo, fontSize: 15, fontWeight: FontWeight.w300),
            ]
          ),
          const Spacer(),
          BumpButton(iconData: Icons.remove, isDisabled: isRemoveButtonDisabled, count: _count, onMinusPressed: () {
            if(_count<1)
              { return; }
            setState(() {
              _count--;
            });
            if (widget.countCallback != null) {
              widget.countCallback!(_count);
            }
          }),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: AppText(title: '$_count', fontSize: 20, fontWeight: FontWeight.w500)
          ),
          BumpButton(iconData: Icons.add, isDisabled: false, count: _count, onPlusPressed: () {
            setState(() {
              _count++;
            });
            if (widget.countCallback != null) {
              widget.countCallback!(_count);
            }
          })
        ],
      ),
    );
  }
}

class BumpButton extends StatefulWidget {
  final bool isDisabled;
  final int count;
  final IconData iconData;
  final VoidCallback? onMinusPressed;
  final  VoidCallback? onPlusPressed;
  const BumpButton({super.key, required this.iconData, this.onMinusPressed, this.onPlusPressed, required this.count, required this.isDisabled});

  @override
  // ignore: library_private_types_in_public_api
  _BumpButtonState createState() => _BumpButtonState();
}

class _BumpButtonState extends State<BumpButton>
    with SingleTickerProviderStateMixin {
  bool isDisabled = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Kiểm tra và cập nhật trạng thái disable ban đầu
    if (widget.iconData == Icons.remove && widget.onMinusPressed != null) {
      setState(() {
        isDisabled = (widget.count == 0);
      });
    }

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onButtonPressed() {
    _animationController.reset();
    _animationController.forward();

    if (widget.iconData == Icons.remove && widget.onMinusPressed != null) {
      widget.onMinusPressed!();
    } else if (widget.iconData == Icons.add && widget.onPlusPressed != null) {
      widget.onPlusPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isDisabled ? null : _onButtonPressed,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: widget.isDisabled ? Colors.grey : Colors.black,
                ),
              ),
              child: Center(
                child: Icon(
                  widget.iconData,
                  color: widget.isDisabled ? Colors.grey : Colors.black,
                  size: 19,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
