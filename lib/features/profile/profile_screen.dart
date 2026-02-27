import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text.dart';
import 'models/user_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late UserProfile user;

  bool isEditing = false;

  final usernameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final goalWeightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    user = UserProfile.mock();

    _syncControllers();
  }

  void _syncControllers() {
    usernameController.text = user.name;
    ageController.text = user.age?.toString() ?? "";
    heightController.text = user.heightCm.toString();
    weightController.text = user.currentWeightKg.toString();
    goalWeightController.text = user.goalWeightKg.toString();
  }

  double _calculateCompleteness() {
    int filled = 0;
    int total = 6;

    if (user.name.isNotEmpty) filled++;
    if (user.age != null) filled++;
    if (user.heightCm > 0) filled++;
    if (user.currentWeightKg > 0) filled++;
    if (user.goalWeightKg > 0) filled++;
    if (user.nutritionGoals.dailyCalories > 0) filled++;

    return filled / total;
  }

  void _toggleEdit() {
    if (isEditing) {
      setState(() {
        user = user.copyWith(
          name: usernameController.text,
          age: int.tryParse(ageController.text),
          heightCm:
              double.tryParse(heightController.text) ?? user.heightCm,
          currentWeightKg:
              double.tryParse(weightController.text) ??
                  user.currentWeightKg,
          goalWeightKg:
              double.tryParse(goalWeightController.text) ??
                  user.goalWeightKg,
        );
        isEditing = false;
      });
    } else {
      setState(() {
        isEditing = true;
      });
    }
  }

  Widget _sectionCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 28),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppText.title),
          const SizedBox(height: 18),
          ...children,
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppText.smallLabel),
          Text(value, style: AppText.body),
        ],
      ),
    );
  }

  Widget _cleanInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: AppText.smallLabel,
            border: InputBorder.none,
          ),
          style: AppText.body,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final completeness = _calculateCompleteness();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("Profile", style: AppText.title),
        actions: [
          TextButton(
            onPressed: _toggleEdit,
            child: Text(
              isEditing ? "Save" : "Edit",
              style:
                  AppText.button.copyWith(color: AppColors.accent),
            ),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.accent,
          labelColor: AppColors.accent,
          unselectedLabelColor: AppColors.textSecondary,
          tabs: const [
            Tab(text: "Overview"),
            Tab(text: "Goals"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [

          // =========================
          // OVERVIEW TAB
          // =========================

          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [

                _sectionCard("Profile Completeness", [
                  Text("${(completeness * 100).toInt()}% Complete",
                      style: AppText.smallLabel),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: completeness,
                    minHeight: 6,
                    backgroundColor: AppColors.background,
                    color: AppColors.accent,
                  ),
                ]),

                _sectionCard("Profile Overview", [

                  // PROFILE PICTURE
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 42,
                          backgroundColor: AppColors.background,
                          child: Icon(Icons.person,
                              size: 40,
                              color: AppColors.textSecondary),
                        ),
                        if (isEditing)
                          TextButton(
                            onPressed: () {},
                            child: Text("Change Photo",
                                style: AppText.smallLabel),
                          )
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: isEditing
                        ? Column(
                            children: [
                              _cleanInput(
                                  "Username", usernameController),
                              _cleanInput("Age", ageController),
                              _cleanInput(
                                  "Height (cm)", heightController),
                              _cleanInput(
                                  "Current Weight (kg)",
                                  weightController),
                              _cleanInput(
                                  "Goal Weight (kg)",
                                  goalWeightController),
                            ],
                          )
                        : Column(
                            children: [
                              _infoRow("Username", user.name),
                              _infoRow("Age",
                                  "${user.age ?? "-"}"),
                              _infoRow("Height",
                                  "${user.heightCm} cm"),
                              _infoRow("Current Weight",
                                  "${user.currentWeightKg} kg"),
                              _infoRow("Goal Weight",
                                  "${user.goalWeightKg} kg"),
                              _infoRow("Goal Type",
                                  user.goalType.name),
                            ],
                          ),
                  ),
                ]),

                _sectionCard("Account", [
                  _infoRow("Email", user.accountSettings.email),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      // placeholder for future auth logic
                    },
                    child: Text("Log Out",
                        style: AppText.button.copyWith(
                            color: Colors.redAccent)),
                  )
                ]),
              ],
            ),
          ),

          // =========================
          // GOALS TAB (EXPANDED)
          // =========================

          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [

                _sectionCard("Body Goals", [
                  _infoRow("Goal Type", user.goalType.name),
                  _infoRow("Target Weight",
                      "${user.bodyGoals.targetWeightKg} kg"),
                  _infoRow("Weekly Rate",
                      "${user.bodyGoals.weeklyRateKg} kg/week"),
                  _infoRow("Target Date",
                      user.bodyGoals.targetDate?.toString() ?? "-"),
                ]),

                _sectionCard("Nutrition Goals", [
                  _infoRow("Daily Calories",
                      "${user.nutritionGoals.dailyCalories} kcal"),
                  _infoRow("Protein",
                      "${user.nutritionGoals.proteinGrams} g"),
                  _infoRow("Carbs",
                      "${user.nutritionGoals.carbsGrams} g"),
                  _infoRow("Fats",
                      "${user.nutritionGoals.fatsGrams} g"),
                  _infoRow("Diet Preference",
                      user.preferences.dietPreference.name),
                ]),

                _sectionCard("Activity & Lifestyle", [
                  _infoRow("Activity Level",
                      user.activityProfile.activityLevel.name),
                  _infoRow("Training Days",
                      "${user.activityProfile.trainingDaysPerWeek}/week"),
                  _infoRow("Daily Step Goal",
                      "${user.activityProfile.dailyStepGoal ?? "-"}"),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    usernameController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    goalWeightController.dispose();
    super.dispose();
  }
}