import 'package:flutter/material.dart';
import 'package:storybook_flutter/src/knobs/knobs.dart';
import 'package:storybook_flutter/src/knobs/utils.dart';

class SliderKnob extends Knob<double> {
  SliderKnob(String label, {double value, this.max, this.min})
      : super(label, value);
  final double max;
  final double min;

  @override
  Widget build() =>
      SliderKnobWidget(label: label, value: value, min: min, max: max);
}

class SliderKnobWidget extends StatelessWidget {
  const SliderKnobWidget({
    Key key,
    this.label,
    this.value,
    this.min,
    this.max,
  }) : super(key: key);

  final String label;
  final double min;
  final double max;
  final double value;

  @override
  Widget build(BuildContext context) => ListTile(
        subtitle: Slider(
          value: value,
          onChanged: (v) => context.knobs.update(label, v),
          max: max,
          min: min,
        ),
        title: Text('$label (${value.toStringAsFixed(2)})'),
      );
}
