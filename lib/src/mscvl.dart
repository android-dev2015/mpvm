import "package:flutter/material.dart";
import 'dart:math';

class MSCVL extends StatelessWidget {
  const MSCVL({
    super.key,
    this.c = Colors.redAccent,
    this.w = 10,
    this.h = 50,
    this.r = 3,
    this.a = true,
  });

  final Color? c;
  final double? w;
  final double? h;
  final bool a;
  final double r;

  @override
  Widget build(BuildContext context) {
    final List<int> d = [555, 900, 650, 750];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
        4,
        (i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: VUC(
            cv: Curves.bounceOut,
            d: d[i % 5],
            c: c ?? Theme.of(context).colorScheme.secondary,
            w: w,
            h: h,
            r: r,
            a: a,
          ),
        ),
      ),
    );
  }
}

class VUC extends StatefulWidget {
  const VUC({
    Key? key,
    required this.d,
    required this.c,
    required this.cv,
    this.w,
    this.h,
    this.r = 0,
    this.a = false,
  }) : super(key: key);

  final int d;
  final Color c;
  final Curve cv;
  final double? w;
  final double? h;
  final double r;
  final bool a;

  @override
  State<VUC> createState() => _VUCState();
}

class _VUCState extends State<VUC> with SingleTickerProviderStateMixin {
  late Animation<double> a;
  late AnimationController ac;
  late double w;
  late double h;
  late double r;

  T? abgt<T>(T? value) => value;

  @override
  void initState() {
    super.initState();
    w = widget.w ?? 4;
    h = widget.h ?? 15;
    r = min(widget.r, h / 2);
    ada();
    if (widget.a) {
      st();
    } else {
      pu();
    }
  }

  @override
  void didUpdateWidget(VUC oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.a != widget.a) {
      if (widget.a) {
        st();
      } else {
        pu();
      }
    }
  }

  void ada() {
    ac = AnimationController(
      duration: Duration(milliseconds: widget.d),
      vsync: this,
    );
    final cva = CurvedAnimation(parent: ac, curve: widget.cv);
    a = Tween<double>(begin: 2, end: h).animate(cva)
      ..addListener(() {
        upt();
      });
  }

  void st() {
    ac.repeat(reverse: true);
  }

  void pu() {
    ac.stop();
    ac.reverse();
  }

  void upt() {
    abgt(WidgetsBinding.instance)!.addPostFrameCallback((timeStamp) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: a.value,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(min(r, a.value / 2)),
            color: widget.c,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    a.removeListener(() {});
    a.removeStatusListener((status) {});
    ac.stop();
    ac.reset();
    ac.dispose();
    super.dispose();
  }
}
