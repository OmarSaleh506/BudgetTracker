# BudgetTracker

A Flutter mobile app for tracking income, expenses and savings goals, with an Arabic interface and amounts in Saudi riyals (SR).

> A 2022 team learning project by three contributors, built while we were learning Flutter. It is not maintained and not published to any store.

## Features

- Three-screen onboarding, then a home screen with the total balance and an income vs. expenses overview.
- Add income or expense transactions with a name, a numeric amount (two decimal places) and a category.
  - Expense categories: health, transport, travel, groceries, other.
  - Income categories: salary, real estate, transfers, family, investment.
- Edit or delete a transaction.
- Savings goals: set a target amount and how much you have saved; the app shows the remaining amount and a progress bar. Goals can be edited or deleted.
- Spending by category: a stacked bar on the home screen and a ring chart with the total expenses on the dashboard screen.
- All data is stored on the device in SQLite. There is no backend and no account.

## Built with

Flutter / Dart, [GetX](https://pub.dev/packages/get) (state management and routing), [sqflite](https://pub.dev/packages/sqflite) (local database), [get_storage](https://pub.dev/packages/get_storage), [fl_chart](https://pub.dev/packages/fl_chart), [pie_chart](https://pub.dev/packages/pie_chart), [syncfusion_flutter_charts](https://pub.dev/packages/syncfusion_flutter_charts), [percent_indicator](https://pub.dev/packages/percent_indicator), [sizer](https://pub.dev/packages/sizer), [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) and [google_fonts](https://pub.dev/packages/google_fonts).

## Run it

The project targets the Dart 2.x SDK (`>=2.18.2 <3.0.0`), so use a Flutter release from that era (around 3.3), or expect to update dependencies.

```bash
flutter pub get
flutter run
```

## Layout

`lib/` is split into `controllers/` (GetX), `models/`, `providers/` (SQLite access), `routes/` and `views/` (screens and widgets).
