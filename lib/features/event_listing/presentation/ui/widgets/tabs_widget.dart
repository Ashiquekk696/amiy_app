import 'package:amiy_app/core/utils/colors.dart';
import 'package:amiy_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/responive.dart';

/// A widget that displays a set of tabs for navigating different categories of content.
class TabsWidget extends StatelessWidget {
  /// Creates a [TabsWidget].
  ///
  /// The [responsive] parameter is required for responsive design,
  /// and [tabController] is required to control the tab selection.
  const TabsWidget({
    super.key,
    required this.responsive,
    required TabController tabController,
  }) : _tabController = tabController;

  /// The responsive design helper.
  final Responsive responsive;

  /// The controller for the tabs.
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsive.blockSizeHorizontal * 12),
      child: AnimatedBuilder(
        animation: _tabController,
        builder: (context, _) {
          return TabBar(
            indicatorColor: const Color(AppColors.primaryColor),
            controller: _tabController,
            tabs: [
              Tab(
                child: Center(
                  child: Text(
                    AppConstants.$new.toUpperCase(),
                    style: GoogleFonts.montserrat(
                      color: _tabController.index == 0
                          ? const Color(AppColors.black)
                          : const Color(0xFFB0BEC5),
                      fontSize: responsive.isSmallScreen() ||
                              responsive.isExtraSmallScreen()
                          ? responsive.fontSize(10)
                          : responsive.fontSize(12),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Center(
                  child: Text(
                    AppConstants.trending.toUpperCase(),
                    style: GoogleFonts.montserrat(
                      color: _tabController.index == 1
                          ? const Color(AppColors.black)
                          : const Color(0xFFB0BEC5),
                      fontSize: responsive.isSmallScreen() ||
                              responsive.isExtraSmallScreen()
                          ? responsive.fontSize(10)
                          : responsive.fontSize(12),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Center(
                  child: Text(
                    AppConstants.waitingRoom.toUpperCase(),
                    style: GoogleFonts.montserrat(
                      color: _tabController.index == 2
                          ? const Color(AppColors.black)
                          : const Color(0xFFB0BEC5),
                      fontSize: responsive.isSmallScreen() ||
                              responsive.isExtraSmallScreen()
                          ? responsive.fontSize(10)
                          : responsive.fontSize(12),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
            isScrollable: responsive.isSmallScreen(),
          );
        },
      ),
    );
  }
}
