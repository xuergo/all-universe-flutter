part of refresh;

const _kDefaultSquatsTriggerOffset = 48.00;

/// Squats indicator.
/// Base widget for [SquatsHeader] and [SquatsFooter].
class _SquatsIndicator extends StatefulWidget {
  final IndicatorState state;
  final bool reverse;

  /// Background color.
  final Color? backgroundColor;

  const _SquatsIndicator({
    Key? key,
    required this.state,
    required this.reverse,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<_SquatsIndicator> createState() => _SquatsIndicatorState();
}

class _SquatsIndicatorState extends State<_SquatsIndicator>
    with TickerProviderStateMixin {
  IndicatorResult get _result => widget.state.result;
  IndicatorMode get _mode => widget.state.mode;
  double get _actualTriggerOffset => widget.state.actualTriggerOffset;
  double? get _value {
    if (_result == IndicatorResult.noMore) {
      return 0;
    }
    if (_mode == IndicatorMode.drag || _mode == IndicatorMode.armed) {
      const noneOffset = _kDefaultSquatsTriggerOffset * 0.25;
      if (_offset < noneOffset) {
        return 0;
      }
      var num = math.min(
              (_offset - noneOffset) /
                  (_actualTriggerOffset * 1.25 - noneOffset),
              1) *
          0.75;
      return num < 0.3 ? num : 0.3;
    }
    return 0;
  }

  late AnimationController _idleController;
  double get _offset => widget.state.offset;
  @override
  void initState() {
    super.initState();
    _idleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    _idleController.dispose();
    super.dispose();
  }

  //动画样式
  Widget _buildIndicator() {
    if (_mode == IndicatorMode.drag) {
      _idleController.value = _value!;
    } else if (_mode == IndicatorMode.ready) {
      _idleController.repeat();
    }
    return Column(
      children: [
        Container(
          height: _offset / 3,
        ),
        Lottie.asset(
          'lib/assets/lottie/lottie_list_pull_refresh.json',
          controller: _idleController,
          width: 30,
          height: _offset,
          alignment: Alignment.center,
          fit: BoxFit.fitWidth,
        ),
        Container(
          height: _offset / 3,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: _offset * 2,
      color: widget.backgroundColor,
      child: _buildIndicator(),
    );
  }
}
