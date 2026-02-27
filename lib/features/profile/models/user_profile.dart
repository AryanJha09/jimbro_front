/// =============================
/// ENUMS
/// =============================

enum GoalType { cut, bulk, maintain, recomposition }

enum ActivityLevel {
  sedentary,
  lightlyActive,
  moderatelyActive,
  veryActive,
}

enum UnitSystem { metric, imperial }

enum DietPreference { vegetarian, vegan, nonVegetarian }


/// =============================
/// CORE PROFILE MODEL
/// =============================

class UserProfile {
  final String id;
  final String name;
  final String? avatarUrl;

  final int? age;
  final double heightCm;
  final double currentWeightKg;
  final double goalWeightKg;

  final GoalType goalType;

  final BodyGoals bodyGoals;
  final NutritionGoals nutritionGoals;
  final ActivityProfile activityProfile;

  final Preferences preferences;
  final AccountSettings accountSettings;

  final List<WeightEntry> weightHistory;
  final List<MeasurementEntry> measurementHistory;

  const UserProfile({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.age,
    required this.heightCm,
    required this.currentWeightKg,
    required this.goalWeightKg,
    required this.goalType,
    required this.bodyGoals,
    required this.nutritionGoals,
    required this.activityProfile,
    required this.preferences,
    required this.accountSettings,
    required this.weightHistory,
    required this.measurementHistory,
  });

  /// =============================
  /// COPY WITH (Immutable Updates)
  /// =============================

  UserProfile copyWith({
    String? name,
    String? avatarUrl,
    int? age,
    double? heightCm,
    double? currentWeightKg,
    double? goalWeightKg,
    GoalType? goalType,
    BodyGoals? bodyGoals,
    NutritionGoals? nutritionGoals,
    ActivityProfile? activityProfile,
    Preferences? preferences,
    AccountSettings? accountSettings,
    List<WeightEntry>? weightHistory,
    List<MeasurementEntry>? measurementHistory,
  }) {
    return UserProfile(
      id: id,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      age: age ?? this.age,
      heightCm: heightCm ?? this.heightCm,
      currentWeightKg: currentWeightKg ?? this.currentWeightKg,
      goalWeightKg: goalWeightKg ?? this.goalWeightKg,
      goalType: goalType ?? this.goalType,
      bodyGoals: bodyGoals ?? this.bodyGoals,
      nutritionGoals: nutritionGoals ?? this.nutritionGoals,
      activityProfile: activityProfile ?? this.activityProfile,
      preferences: preferences ?? this.preferences,
      accountSettings: accountSettings ?? this.accountSettings,
      weightHistory: weightHistory ?? this.weightHistory,
      measurementHistory:
          measurementHistory ?? this.measurementHistory,
    );
  }

  /// =============================
  /// MOCK (Frontend-Only State)
  /// =============================

  factory UserProfile.mock() {
    return UserProfile(
      id: "1",
      name: "JimBro",
      avatarUrl: null,
      age: 22,
      heightCm: 178,
      currentWeightKg: 82,
      goalWeightKg: 78,
      goalType: GoalType.cut,
      bodyGoals: const BodyGoals(
        targetWeightKg: 78,
        weeklyRateKg: -0.5,
        targetDate: null,
      ),
      nutritionGoals: const NutritionGoals(
        dailyCalories: 2400,
        proteinGrams: 180,
        carbsGrams: 250,
        fatsGrams: 70,
      ),
      activityProfile: const ActivityProfile(
        activityLevel: ActivityLevel.moderatelyActive,
        trainingDaysPerWeek: 5,
        dailyStepGoal: 8000,
      ),
      preferences: const Preferences(
        unitSystem: UnitSystem.metric,
        dietPreference: DietPreference.nonVegetarian,
        allergies: null,
      ),
      accountSettings: const AccountSettings(
        email: "jim@jimbro.app",
        notificationsEnabled: true,
        darkMode: false,
      ),
      weightHistory: const [],
      measurementHistory: const [],
    );
  }
}

/// =============================
/// BODY GOALS
/// =============================

class BodyGoals {
  final double targetWeightKg;
  final double weeklyRateKg;
  final DateTime? targetDate;

  const BodyGoals({
    required this.targetWeightKg,
    required this.weeklyRateKg,
    this.targetDate,
  });

  BodyGoals copyWith({
    double? targetWeightKg,
    double? weeklyRateKg,
    DateTime? targetDate,
  }) {
    return BodyGoals(
      targetWeightKg:
          targetWeightKg ?? this.targetWeightKg,
      weeklyRateKg: weeklyRateKg ?? this.weeklyRateKg,
      targetDate: targetDate ?? this.targetDate,
    );
  }
}

/// =============================
/// NUTRITION GOALS
/// =============================

class NutritionGoals {
  final int dailyCalories;
  final int proteinGrams;
  final int carbsGrams;
  final int fatsGrams;

  const NutritionGoals({
    required this.dailyCalories,
    required this.proteinGrams,
    required this.carbsGrams,
    required this.fatsGrams,
  });

  NutritionGoals copyWith({
    int? dailyCalories,
    int? proteinGrams,
    int? carbsGrams,
    int? fatsGrams,
  }) {
    return NutritionGoals(
      dailyCalories:
          dailyCalories ?? this.dailyCalories,
      proteinGrams:
          proteinGrams ?? this.proteinGrams,
      carbsGrams: carbsGrams ?? this.carbsGrams,
      fatsGrams: fatsGrams ?? this.fatsGrams,
    );
  }
}

/// =============================
/// ACTIVITY PROFILE
/// =============================

class ActivityProfile {
  final ActivityLevel activityLevel;
  final int trainingDaysPerWeek;
  final int? dailyStepGoal;

  const ActivityProfile({
    required this.activityLevel,
    required this.trainingDaysPerWeek,
    this.dailyStepGoal,
  });

  ActivityProfile copyWith({
    ActivityLevel? activityLevel,
    int? trainingDaysPerWeek,
    int? dailyStepGoal,
  }) {
    return ActivityProfile(
      activityLevel:
          activityLevel ?? this.activityLevel,
      trainingDaysPerWeek:
          trainingDaysPerWeek ??
              this.trainingDaysPerWeek,
      dailyStepGoal:
          dailyStepGoal ?? this.dailyStepGoal,
    );
  }
}

/// =============================
/// USER PREFERENCES
/// =============================

class Preferences {
  final UnitSystem unitSystem;
  final DietPreference dietPreference;
  final List<String>? allergies;

  const Preferences({
    required this.unitSystem,
    required this.dietPreference,
    this.allergies,
  });
}

/// =============================
/// ACCOUNT SETTINGS
/// =============================

class AccountSettings {
  final String email;
  final bool notificationsEnabled;
  final bool darkMode;

  const AccountSettings({
    required this.email,
    required this.notificationsEnabled,
    required this.darkMode,
  });
}

/// =============================
/// HISTORICAL DATA MODELS
/// =============================

class WeightEntry {
  final DateTime date;
  final double weightKg;

  const WeightEntry({
    required this.date,
    required this.weightKg,
  });
}

class MeasurementEntry {
  final DateTime date;
  final double? bodyFat;
  final double? waistCm;
  final double? chestCm;
  final double? armsCm;
  final double? thighsCm;

  const MeasurementEntry({
    required this.date,
    this.bodyFat,
    this.waistCm,
    this.chestCm,
    this.armsCm,
    this.thighsCm,
  });
}