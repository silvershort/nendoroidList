import 'package:flutter/material.dart';

class ImageSliderControlWidget extends StatefulWidget {
  const ImageSliderControlWidget({
    super.key,
    this.autoPlay = true,
    required this.autoPlayOnTap,
    required this.downloadOnTap,
    required this.downloadOnLongPress,
  });

  final bool autoPlay;
  final Function(bool autoPlay) autoPlayOnTap;
  final VoidCallback downloadOnTap;
  final VoidCallback downloadOnLongPress;

  @override
  State<ImageSliderControlWidget> createState() => _ImageSliderControlWidgetState();
}

class _ImageSliderControlWidgetState extends State<ImageSliderControlWidget> {
  late bool autoPlay;

  @override
  void initState() {
    super.initState();
    autoPlay = widget.autoPlay;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 0.3,
        ),
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ImageSliderControlButton(
            icon: autoPlay ? Icons.pause : Icons.play_arrow,
            onTap: () {
              setState(() {
                autoPlay = !autoPlay;
                widget.autoPlayOnTap(autoPlay);
              });
            },
          ),
          _ImageSliderControlButton(
            icon: Icons.download,
            onTap: widget.downloadOnTap,
            onLongPress: widget.downloadOnLongPress,
          ),
        ],
      ),
    );
  }
}

class _ImageSliderControlButton extends StatelessWidget {
  const _ImageSliderControlButton({
    super.key,
    required this.icon,
    this.onTap,
    this.onLongPress,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      borderRadius: BorderRadius.circular(5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Icon(
          icon,
          color: Colors.grey,
          size: 16,
        ),
      ),
    );
  }
}
