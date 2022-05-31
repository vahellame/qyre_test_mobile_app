import 'package:flutter/material.dart';

class SlidingAppBar extends StatefulWidget {
  final bool visible;

  const SlidingAppBar({
    Key? key,
    required this.visible,
  }) : super(key: key);

  @override
  State<SlidingAppBar> createState() => _SlidingAppBarState();
}

class _SlidingAppBarState extends State<SlidingAppBar> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.visible ? _controller.reverse() : _controller.forward();
    return Column(
      children: [
        Container(
          height: 50,
          color: Colors.red.withOpacity(0.5),
        ),
        SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -3)).animate(
            CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
          ),
          child: Container(
            height: 50,
            color: Colors.green.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool _visible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SlidingAppBar(
            visible: _visible,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 44),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                for (int i = 0; i < 100; i++) Text('$i'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(_visible ? 'Hide' : 'Show'),
        onPressed: () => setState(() => _visible = !_visible),
      ),
    );
  }
}
