import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_item/config/constants/colors_repo.dart';
import 'package:menu_item/config/constants/padding.dart';

class Addition {
  final String name;
  final double price;
  bool isSelected;

  Addition({
    required this.name,
    required this.price,
    this.isSelected = false,
  });
}

class AdditionsSelector extends StatefulWidget {
  final Function(List<Addition>) onSelectionsChanged;

  const AdditionsSelector({
    super.key,
    required this.onSelectionsChanged,
  });

  @override
  State<AdditionsSelector> createState() => _AdditionsSelectorState();
}

class _AdditionsSelectorState extends State<AdditionsSelector> {
  final List<Addition> _additions = [
    Addition(name: 'Herbs', price: 1.00),
    Addition(name: 'Chicken', price: 5.00),
    Addition(name: 'Egg', price: 5.00),
  ];

  int get _selectedCount => _additions.where((a) => a.isSelected).length;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Choose additions',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: PaddingRepo.p12.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Text(
                'Select up to ${_additions.length}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 6.h),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _additions.length,
          itemBuilder: (context, index) {
            final addition = _additions[index];
            return _buildAdditionOption(addition, context);
          },
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }

  GestureDetector _buildAdditionOption(
      Addition addition, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          addition.isSelected = !addition.isSelected;
          widget.onSelectionsChanged(
              _additions.where((a) => a.isSelected).toList());
        });
      },
      child: SizedBox(
        height: 24.h,
        child: Row(
          children: [
            SizedBox(
              width: 20.r,
              height: 20.r,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r)),
                value: addition.isSelected,
                activeColor: ColorRepo.primeryColor,
                onChanged: (bool? value) {
                  setState(() {
                    addition.isSelected = value ?? false;
                    widget.onSelectionsChanged(
                        _additions.where((a) => a.isSelected).toList());
                  });
                },
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              addition.name,
              style: addition.isSelected
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold)
                  : Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Text(
              '+ SAR ${addition.price.toStringAsFixed(2)}',
              style: addition.isSelected
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: ColorRepo.primeryColor)
                  : Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
