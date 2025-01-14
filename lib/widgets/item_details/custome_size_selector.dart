import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_item/config/constants/padding.dart';

class SizeOption {
  final String size;
  final String price;
  final bool isSelected;

  SizeOption({
    required this.size,
    required this.price,
    this.isSelected = false,
  });
}

class CustomSizeSelector extends StatelessWidget {
  final List<SizeOption> options;
  final Function(String) onSizeSelected;

  const CustomSizeSelector({
    Key? key,
    required this.options,
    required this.onSizeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose your size',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: PaddingRepo.p8.h,
          ),
          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 6.h),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildSizeOption(options[index], context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSizeOption(SizeOption option, BuildContext context) {
    return InkWell(
      onTap: () => onSizeSelected(option.size),
      child: Container(
        height: 24.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option.size,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight:
                    option.isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Row(
              children: [
                Text(
                  option.price,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(width: 12),
                _buildCustomRadio(option.isSelected),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomRadio(bool isSelected) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.pink : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink,
                ),
              ),
            )
          : null,
    );
  }
}
