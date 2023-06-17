import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_values.dart';

class ButtonWithIcon extends StatefulWidget {
  const ButtonWithIcon({
    super.key,
    required this.firstText,
    required this.secondText,
    this.firstIcon = Icons.add,
    this.secondIcon = Icons.check_rounded,
    required this.onPressed,
  });
  final String firstText;
  final String secondText;
  final IconData firstIcon;
  final IconData secondIcon;
  final VoidCallback onPressed;

  @override
  State<ButtonWithIcon> createState() => _ButtonWithIconState();
}

class _ButtonWithIconState extends State<ButtonWithIcon> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.padding,
      ),
      child: SizedBox(
        width: 1.sw,
        //height: ,
        child: OutlinedButton.icon(
          onPressed: () {
            setState(() {
              _isSelected = !_isSelected;
            });
            widget.onPressed();
          },
          icon: Icon(!_isSelected ? widget.firstIcon : widget.secondIcon),
          label: Text(
            !_isSelected ? widget.firstText : widget.secondText,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: _isSelected ? null : AppColors.primaryColor,
            foregroundColor: _isSelected ? Colors.white : Colors.black,
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            alignment: Alignment.centerLeft,
            side: BorderSide(
              width: 1.2,
              color: !_isSelected
                  ? AppColors.primaryColor
                  : AppColors.lightGreyColor,
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class ButtonWithIcon extends StatefulWidget {
//   const ButtonWithIcon({
//     super.key,
//     required this.firstText,
//     required this.secondText,
//     this.firstIcon = Icons.add,
//      this.secondIcon = Icons.check_rounded,
//   });
//   final String firstText;
//   final String secondText;
//   final IconData firstIcon;
//   final IconData secondIcon;

//   @override
//   State<ButtonWithIcon> createState() => _ButtonWithIconState();
// }

// class _ButtonWithIconState extends State<ButtonWithIcon> {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//       onPressed: () {},
//       icon:  Icon(widget.firstIcon),
//       label: const Text('Add to watchlist'),
//     );
//   }
// }
