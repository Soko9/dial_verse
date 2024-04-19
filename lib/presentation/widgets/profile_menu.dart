import "package:flutter/material.dart";

import "../../core/constants/index.dart";
import "../../core/theme/app_palette.dart";

class ProfileMenu extends StatefulWidget {
  final VoidCallback? editCallback;
  final VoidCallback? callCallback;
  final VoidCallback? smsCallback;

  const ProfileMenu({
    super.key,
    this.editCallback,
    this.callCallback,
    this.smsCallback,
  });

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final Duration _duration = const Duration(milliseconds: 750);
  final Curve _curve = Curves.fastOutSlowIn;
  bool _isOpenEdit = false;
  bool _isOpenCall = false;
  bool _isOpenSms = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      width: size.width * 0.35,
      height: size.width * 0.35,
      top: size.height * 0.085,
      right: size.width * 0.12,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            top: _isOpenEdit ? 0 : 20.0,
            left: _isOpenEdit ? size.width * 0.225 : 20.0,
            child: InkWell(
              onTap: widget.editCallback,
              child: Container(
                width: size.width * 0.125,
                height: size.width * 0.125,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppPalette.darkPrimary.withOpacity(0.6),
                ),
                child: const Center(
                  child: Icon(
                    Icons.edit_outlined,
                    color: AppPalette.black,
                    size: AppDimensions.iconSize,
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            top: _isOpenCall ? size.width * 0.175 : 20.0,
            left: _isOpenCall ? size.width * 0.175 : 20.0,
            child: InkWell(
              onTap: widget.callCallback,
              child: Container(
                width: size.width * 0.125,
                height: size.width * 0.125,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppPalette.darkPrimary.withOpacity(0.6),
                ),
                child: const Center(
                  child: Icon(
                    Icons.call_outlined,
                    color: AppPalette.black,
                    size: AppDimensions.iconSize,
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            top: _isOpenSms ? size.width * 0.225 : 20.0,
            left: _isOpenSms ? 0 : 20.0,
            child: InkWell(
              onTap: widget.smsCallback,
              child: Container(
                width: size.width * 0.125,
                height: size.width * 0.125,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppPalette.darkPrimary.withOpacity(0.6),
                ),
                child: const Center(
                  child: Icon(
                    Icons.sms_outlined,
                    color: AppPalette.black,
                    size: AppDimensions.iconSize,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_animationController.status == AnimationStatus.completed) {
                _animationController.reverse();
                setState(() {
                  _isOpenSms = !_isOpenSms;
                });
                Future.delayed(const Duration(milliseconds: 150), () {
                  setState(() {
                    _isOpenCall = !_isOpenCall;
                  });
                });
                Future.delayed(const Duration(milliseconds: 300), () {
                  setState(() {
                    _isOpenEdit = !_isOpenEdit;
                  });
                });
              } else {
                _animationController.forward();
                setState(() {
                  _isOpenEdit = !_isOpenEdit;
                });
                Future.delayed(const Duration(milliseconds: 150), () {
                  setState(() {
                    _isOpenCall = !_isOpenCall;
                  });
                });
                Future.delayed(const Duration(milliseconds: 300), () {
                  setState(() {
                    _isOpenSms = !_isOpenSms;
                  });
                });
              }
            },
            child: Container(
              width: size.width * 0.2,
              height: size.width * 0.2,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppPalette.darkPrimary,
              ),
              child: Center(
                child: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  color: AppPalette.white,
                  size: AppDimensions.menuIconSize,
                  progress: _animationController,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
