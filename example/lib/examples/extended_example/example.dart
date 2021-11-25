import 'package:example/examples/extended_example/helper_widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

part 'radio_example_part.dart';
part 'checkbox_example_part.dart';
part 'custom_example_part.dart';

class GroupButtonExtendedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        buttonTheme: ButtonThemeData(
          colorScheme: Theme.of(context).buttonTheme.colorScheme.copyWith(
                primary: Colors.green,
                secondary: Colors.white,
              ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _Example(),
    );
  }
}

class _Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<_Example> {
  Axis direction = Axis.horizontal;
  var _selectedGroupingType = 0;

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildTitle(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GroupButton(
                  spacing: 7.5,
                  mainGroupAlignment: MainGroupAlignment.start,
                  groupingType: GroupingType.row,
                  buttons: const [
                    "Wrap",
                    "Column",
                    "Row",
                  ],
                  onSelected: (i, selected) {
                    setState(() => _selectedGroupingType = i);
                  },
                ),
                GroupButton(
                  spacing: 7.5,
                  mainGroupAlignment: MainGroupAlignment.start,
                  groupingType: GroupingType.row,
                  buttons: const [
                    "Radio",
                    "CheckBox",
                    "Custom",
                  ],
                  onSelected: (i, selected) {
                    _pageController.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _getSelectedPagesGroup(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _selectedGroupingType == 0
          ? FloatingActionButton(
              onPressed: () => setState(() {
                direction = direction == Axis.horizontal
                    ? Axis.vertical
                    : Axis.horizontal;
              }),
              child: const Icon(Icons.refresh),
            )
          : null,
    );
  }

  GroupButton _buildTitle() {
    return GroupButton(
      spacing: 7.5,
      mainGroupAlignment: MainGroupAlignment.start,
      groupingType: GroupingType.row,
      buttons: const [
        "group_button: 3.3.1",
      ],
      selectedTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
      onSelected: (_, __) {},
    );
  }

  List<Widget> _getSelectedPagesGroup() {
    switch (_selectedGroupingType) {
      case 1:
        return [
          _buildRadioExample(GroupingType.column),
          _buildCheckboxExample(GroupingType.column),
          _buildCustomExample(GroupingType.column),
        ];
      case 2:
        return [
          _buildRadioExample(GroupingType.row),
          _buildCheckboxExample(GroupingType.row),
          _buildCustomExample(GroupingType.row),
        ];
      case 0:
      default:
        return [
          _buildRadioExample(GroupingType.wrap, direction: direction),
          _buildCheckboxExample(GroupingType.wrap, direction: direction),
          _buildCustomExample(GroupingType.wrap, direction: direction),
        ];
    }
  }
}
