import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task_flutter/constants/colors.dart';
import 'package:task_flutter/controller/dashboard/dashboard_controller.dart';
import 'package:task_flutter/domain/model/dashboard_model/dashboard_bloc_states.dart';

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
    DashBoardController controller = Get.find<DashBoardController>();
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        // Adjust height as needed
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      itemCount: controller.state.value.filters.length,
                      // Total number of items
                      itemBuilder: (context, index) {
                        return ActiveItemContainer(
                          isActive: controller.selectedFilter.value == index,
                          title: controller.state.value.filters[index].title,
                          onClick: () {
                            controller.changeActiveFilter(index);
                          }, // Adjust condition based on your logic
                        );
                      },
                    ),
                  ),
                  const VerticalDivider(
                      width: 1, thickness: 1, color: Colors.grey),
                  // Right Section
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8,top: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter keywords',
                              hintStyle: TextStyle(fontSize: 14),
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Reduced internal padding// Label text
                              border: OutlineInputBorder(), // Border around the text field
                              hintText: 'e.g. John Doe', // Placeholder text
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: controller.state.value.filters[controller.selectedFilter.value].subFilters.length,
                              itemBuilder: (ctx, index) => CheckboxContainer(
                                    isChecked: true,
                                    subFilter: controller
                                        .state
                                        .value
                                        .filters[controller.selectedFilter.value]
                                        .subFilters[index],
                                    onChanged: (bool value) {
                                      // Handle checkbox state change here
                                    }, onClick:(){
                                      controller.tickSubFilter(index);
                              },
                                  )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class ActiveItemContainer extends StatelessWidget {
  bool isActive;
  String title;
  Function onClick;

  ActiveItemContainer(
      {this.isActive = false, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("clcik");
        onClick();
      },
      child: AbsorbPointer(
        absorbing: true,
        child: Container(
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    title, // Text in the center
                    style:const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Text color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckboxContainer extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final SubFilter subFilter;
  final Function onClick;

  CheckboxContainer(
      {required this.isChecked,
      required this.onChanged,
        required this.onClick,
      required this.subFilter});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
       onClick();

     },
      child: AbsorbPointer(
        absorbing: true,
        child: Container(
          padding:const EdgeInsets.only(left: 2),
          decoration:const BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: subFilter.isActive,
                onChanged: (d) {},
                activeColor: ColorName.primaryRed,
              ),
              Expanded(
                child: Text(
                  subFilter.title,
                  style: TextStyle(
                    fontWeight: isChecked ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
