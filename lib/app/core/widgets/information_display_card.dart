import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../utils/utils.dart';

class InformationDisplayCard extends StatelessWidget {
  InformationDisplayCard(
      {Key? key,
      required this.cardName,
      required this.cardTypes,
      this.size = const Size(80, 120),
      required this.data})
      : super(key: key);

  final String cardName;
  final InformationDisplayCardTypes cardTypes;
  final Size size;
  final int data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(80.0),
        ),
        color: cardTypes.getColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: size.height / 2,
              child: SfRadialGauge(axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.1,
                    cornerStyle: CornerStyle.bothCurve,
                    color: Colors.white.withOpacity(0.5),
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  annotations: [
                    GaugeAnnotation(
                      positionFactor: 0.05,
                      widget: Container(
                        width: size.height / 3,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                  pointers: <GaugePointer>[
                    RangePointer(
                      color: Colors.white,
                      value: data.toDouble(),
                      pointerOffset: -0.03,
                      cornerStyle: CornerStyle.bothCurve,
                      width: 0.2,
                      sizeUnit: GaugeSizeUnit.factor,
                    )
                  ],
                )
              ])),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: '$data',
                  style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              const TextSpan(
                  text: '%',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
            ]),
          ),
          Text(
            cardName,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
