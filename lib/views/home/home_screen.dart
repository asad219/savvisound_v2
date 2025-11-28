import 'package:iconsax/iconsax.dart';
import 'package:savvisound_v2/common/gradient_body.dart';
import 'package:savvisound_v2/constants/app_colors.dart';
import 'package:savvisound_v2/routes/routes_import.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    DashboardScreen(),
    const Center(child: Text('Progress', style: TextStyle(fontSize: 22))),
    const Center(child: Text('Schedule', style: TextStyle(fontSize: 22))),
    const Center(child: Text('Hydrate', style: TextStyle(fontSize: 22))),
    const Center(child: Text('Track', style: TextStyle(fontSize: 22))),
    const Center(child: Text('Journey', style: TextStyle(fontSize: 22))),
  ];

  void _onTap(int idx) => setState(() => _selectedIndex = idx);

  @override
  Widget build(BuildContext context) {
    // Colors tuned to the design in your image
    final Color barColor = AppColors.mainBg; // very dark navy
    final Color selectedColor = Colors.white;
    final Color unselectedColor = Colors.white70;

    return GradientBody(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _pages[_selectedIndex],
        // Use a floating action area so we can have rounded top corners & shadow
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: PhysicalModel(
            color: Colors.transparent,
            elevation: 6,
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: 82,
              decoration: BoxDecoration(
                color: barColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _NavItem(
                    index: 0,
                    selectedIndex: _selectedIndex,
                    onTap: _onTap,
                    icon: Iconsax.music,
                    label: 'Tune',
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                  ),
                  _NavItem(
                    index: 1,
                    selectedIndex: _selectedIndex,
                    onTap: _onTap,
                    icon: Iconsax.chart,
                    label: 'Progress',
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                  ),
                  _NavItem(
                    index: 2,
                    selectedIndex: _selectedIndex,
                    onTap: _onTap,
                    icon: Iconsax.calendar,
                    label: 'Schedule',
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                  ),
                  _NavItem(
                    index: 3,
                    selectedIndex: _selectedIndex,
                    onTap: _onTap,
                    icon: Icons.water_drop_outlined,
                    label: 'Hydrate',
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                  ),
                  _NavItem(
                    index: 4,
                    selectedIndex: _selectedIndex,
                    onTap: _onTap,
                    icon: Icons.map_outlined,
                    label: 'Track',
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                  ),
                  _NavItem(
                    index: 5,
                    selectedIndex: _selectedIndex,
                    onTap: _onTap,
                    icon: Icons.explore_outlined,
                    label: 'Journey',
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Individual navigation item widget.
/// Uses animation to scale icon and show label for the selected item.
class _NavItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final void Function(int) onTap;
  final IconData icon;
  final String label;
  final Color selectedColor;
  final Color unselectedColor;

  const _NavItem({
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    required this.icon,
    required this.label,
    required this.selectedColor,
    required this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = index == selectedIndex;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: isSelected ? 42 : 26,
                height: isSelected ? 42 : 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // subtle background for selected item to match screenshot feel
                  color: isSelected ? Colors.white24 : Colors.transparent,
                ),
                child: Icon(
                  icon,
                  size: isSelected ? 28 : 22,
                  color: isSelected ? selectedColor : unselectedColor,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 220),
                style: TextStyle(
                  fontSize: isSelected ? 11 : 10,
                  color: isSelected ? selectedColor : unselectedColor,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
