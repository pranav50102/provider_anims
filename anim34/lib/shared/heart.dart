import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {

  late AnimationController _controller ;
  late Animation _animation;
   bool isHeart = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: Duration(milliseconds: 300),
        vsync: this
    );
    
    _animation = ColorTween(begin: Colors.grey[200] ,end: Colors.pink).animate(_controller);
    
    // _controller.addListener((){
    // });

    _controller.addStatusListener((status){
      if(status == AnimationStatus.completed){
        setState(() {
          isHeart = true;
        });
      }
      else if(status == AnimationStatus.dismissed){
        setState(() {
          isHeart  = false;
        });
      }
    });
    }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context , _){
        return IconButton(
          icon: Icon(
            Icons.favorite_outlined,
            color: _animation.value,
            size: 30,
          ),
          onPressed: () {
            isHeart ? _controller.reverse() : _controller.forward();
          },
        );
      },
    );
  }
}

