import 'package:flutter/material.dart';

class DragHandleBottomSheet extends StatelessWidget {
  const DragHandleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        width: 32,
        height: 4,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black),
      ),
    );
  }
}
