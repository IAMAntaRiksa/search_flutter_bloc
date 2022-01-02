import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatelessWidget {
  const ShimmerScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: false,
        itemCount: 5,
        itemBuilder: (_, index) {
          return Shimmer.fromColors(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 12,
                  )
                ],
              ),
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!);
        });
  }
}
