import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class CarOnRoadWidget extends StatelessWidget {
  const CarOnRoadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 466,
        height: 200,
        child: Center(
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/road_052.png',
                      ),
                    ),
                  ),
                  child: Container(
                    width: 466,
                    height: 150,
                  ),
                ),
              ),
              Positioned(
                top: -10,
                left: 80,
                child: StreamBuilder(
                    stream: dataSubjects.parentCarModelStream,
                    builder: (context, snapshot) {
                      final car = snapshot.data!;
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              car['image'],
                            ),
                          ),
                        ),
                        child: Container(
                          width: 169,
                          height: 88,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
