import 'package:flutter/material.dart';

class StepperCounter extends StatefulWidget {
  final Color color;
  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final int startingValue;
  final void Function(int value) onChange;

  const StepperCounter({
    super.key,
    required this.color,
    required this.lowerLimit,
    required this.upperLimit,
    required this.onChange,
    required this.startingValue,
    this.stepValue = 1,
  });

  @override
  State<StepperCounter> createState() => _StepperCounterState();
}

class _StepperCounterState extends State<StepperCounter> {
  late final ValueNotifier<int> currentValue;

  @override
  void initState() {
    currentValue = ValueNotifier(widget.startingValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 45,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: BorderSide(
            width: 1,
            color: widget.color,
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: InkWell(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  onTap: () {
                    if (widget.lowerLimit == currentValue.value) {
                      return;
                    }
                    currentValue.value -= 1;
                    widget.onChange(currentValue.value);
                  },
                  child: const Icon(Icons.remove),
                ),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: currentValue,
                builder: (context, value, child) {
                  return Text(
                    '$value',
                    style: TextStyle(
                      color: widget.color,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: InkWell(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  onTap: () {
                    if (widget.upperLimit == currentValue.value) {
                      return;
                    }
                    currentValue.value += widget.stepValue;
                    widget.onChange(currentValue.value);
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
