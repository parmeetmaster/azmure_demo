import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flutter/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:task_flutter/constants/colors.dart';

import '../../../bloc/dashboard_bloc/dashboard_bloc_states.dart';

class FilterBottomSheet extends StatelessWidget {
  static void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => FilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider.value(
      value: context.read<DashBoardBloc>(),
      child: BlocBuilder<DashBoardBloc, DashBoardBlocState>(
        builder: (blocContext, state) {
          return Container(
            height: MediaQuery.of(context).size.height *
                0.6, // Adjust height as needed
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                // Custom AppBar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sort and Filters",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                // Row with Left and Right Sections
                Expanded(
                  child: Row(
                    children: [
                      // Left Section
                      Expanded(
                        child: ListView.builder(
                          itemCount:state.filters.length, // Total number of items
                          itemBuilder: (context, index) {
                            return ActiveItemContainer(
                              isActive: index == 1,
                              title:state.filters[index].title, // Adjust condition based on your logic
                            );
                          },
                        ),
                      ),
                      const VerticalDivider(
                          width: 1, thickness: 1, color: Colors.grey),
                      // Right Section
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(state.filters.length, (index) {
                              return CheckboxContainer(
                                isChecked: true,
                                onChanged: (bool value) {
                                  // Handle checkbox state change here
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ActiveItemContainer extends StatelessWidget {
  bool isActive;
  String title;

  ActiveItemContainer({this.isActive = false, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Adjust the width of the container
      height: 50, // Adjust the height of the container
      decoration: BoxDecoration(
        color: this.isActive ? Colors.white : Colors.grey.shade200,
      ),
      child: Row(
        children: [
          // Orange vertical line indicating active item
          Container(
            width: 5,
            // Width of the vertical line
            height: double.infinity,
            // Makes the line take full height of the container
            color: this.isActive
                ? ColorName.primaryRed
                : null, // Orange color for the line
          ),
          // Centered Text
          Expanded(
            child: Center(
              child: Text(
                title, // Text in the center
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckboxContainer extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  CheckboxContainer({required this.isChecked, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 2),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (d) {},
            activeColor: ColorName.primaryRed,
          ),
          Text(
            'Label Text',
            style: TextStyle(
              fontWeight: isChecked ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
