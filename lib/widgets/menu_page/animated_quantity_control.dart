import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_item/config/constants/colors_repo.dart';
import 'package:menu_item/config/constants/padding.dart';

class AnimatedQuantityController extends StatefulWidget {
  final Function(int) onQuantityChanged;
  final Color accentColor;
  final double height;

  const AnimatedQuantityController({
    super.key,
    required this.onQuantityChanged,
    this.accentColor = Colors.red,
    this.height = 40,
  });

  @override
  State<AnimatedQuantityController> createState() =>
      _AnimatedQuantityControllerState();
}

class _AnimatedQuantityControllerState
    extends State<AnimatedQuantityController> {
  bool _isExpanded = false;
  int _quantity = 0;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _quantity = 1;
      } else {
        _quantity = 0;
      }
      widget.onQuantityChanged(_quantity);
    });
  }

  void _updateQuantity(int delta) {
    setState(() {
      _quantity = (_quantity + delta).clamp(0, 99);
      if (_quantity == 0) {
        _isExpanded = false;
      }
      widget.onQuantityChanged(_quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: widget.height,
      width: _isExpanded ? 80.w : 104.w,
      decoration: BoxDecoration(
        color: ColorRepo.primeryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: _isExpanded ? _buildExpandedView() : _buildCollapsedView(),
    );
  }

  Widget _buildCollapsedView() {
    return InkWell(
      onTap: _toggleExpanded,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: widget.accentColor,
            size: 18.sp,
          ),
          Text(
            'Add to cart',
            style: TextStyle(
              fontSize: 14.sp,
              color: widget.accentColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildControlButton(Icons.remove, () => _updateQuantity(-1),
            color: Colors.grey),
        Text(
          '$_quantity',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        _buildControlButton(Icons.add, () => _updateQuantity(1)),
      ],
    );
  }

  Widget _buildControlButton(IconData icon, VoidCallback onTap,
      {Color? color}) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: color ?? widget.accentColor,
      ),
    );
  }
}
