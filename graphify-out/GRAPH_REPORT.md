# Graph Report - .  (2026-07-16)

## Corpus Check
- Corpus is ~37,065 words - fits in a single context window. You may not need a graph.

## Summary
- 250 nodes · 264 edges · 69 communities (16 shown, 53 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 31 edges (avg confidence: 0.81)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Windows Native Windowing
- Linux Flutter Runner
- iOS Runner Tests
- Windows Flutter Window
- Flutter Media Player UI
- iOS App Lifecycle
- Windows Runner Bootstrap
- Web App Manifest
- Desktop Build Configuration
- Dart Testing Practices
- macOS Plugin Registration
- Flutter UI Testing
- Android Runner Activity
- Dart Static Analysis
- Dart Native Interop
- Flutter App Architecture
- Responsive Flutter Layout
- Flutter Data Networking
- Flutter Package Configuration
- Flutter Build Environment
- Swift Package Configuration
- Dart CLI Development
- Dart Dependency Management
- Dart Pattern Matching
- Dart Primary Constructors
- Flutter Localization
- Android Launcher Icon
- Android Launcher Icon
- Android Launcher Icon
- Android Launcher Icon
- Android Launcher Icon
- iOS App Icon
- iOS App Icon
- iOS App Icon
- iOS App Icon
- iOS App Icon
- iOS App Icon
- iOS App Icon
- iOS App Icon
- iOS App Icon
- iOS App Icon
- iOS App Icon
- iOS App Icon
- iOS App Icon
- iOS App Icon
- iOS App Icon
- iOS Launch Assets
- iOS Launch Assets
- iOS Launch Assets
- iOS Launch Customization
- macOS App Icon
- macOS App Icon
- macOS App Icon
- macOS App Icon
- macOS App Icon
- macOS App Icon
- macOS App Icon
- Project Overview
- Web Favicon
- Web App Icon
- Web App Icon
- Web Maskable Icon
- Web Maskable Icon
- Flutter Web Entrypoint

## God Nodes (most connected - your core abstractions)
1. `Win32Window` - 22 edges
2. `MessageHandler` - 12 edges
3. `FlutterWindow` - 10 edges
4. `Create` - 10 edges
5. `WndProc` - 10 edges
6. `MessageHandler` - 9 edges
7. `_MyApplication` - 7 edges
8. `OnCreate` - 7 edges
9. `WindowClassRegistrar` - 7 edges
10. `Destroy` - 7 edges

## Surprising Connections (you probably didn't know these)
- `Linux Application Build` --semantically_similar_to--> `Windows Application Build`  [INFERRED] [semantically similar]
  linux/CMakeLists.txt → windows/CMakeLists.txt
- `Flutter Linux Build Rules` --semantically_similar_to--> `Flutter Windows Build Rules`  [INFERRED] [semantically similar]
  linux/flutter/CMakeLists.txt → windows/flutter/CMakeLists.txt
- `Linux Runner Target` --semantically_similar_to--> `Windows Runner Target`  [INFERRED] [semantically similar]
  linux/runner/CMakeLists.txt → windows/runner/CMakeLists.txt
- `OnCreate` --calls--> `RegisterPlugins()`  [INFERRED]
  windows/runner/flutter_window.h → windows/flutter/generated_plugin_registrant.cc
- `wWinMain()` --calls--> `CreateAndAttachConsole()`  [INFERRED]
  windows/runner/main.cpp → windows/runner/utils.cpp

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Dart and Flutter Testing Workflows** — _agents_skills_dart_add_unit_test_skill_dart_add_unit_test, _agents_skills_dart_generate_test_mocks_skill_dart_generate_test_mocks, _agents_skills_dart_collect_coverage_skill_dart_collect_coverage, _agents_skills_flutter_add_integration_test_skill_flutter_add_integration_test, _agents_skills_flutter_add_widget_test_skill_flutter_add_widget_test [INFERRED 0.85]

## Communities (69 total, 53 thin omitted)

### Community 0 - "Windows Native Windowing"
Cohesion: 0.12
Nodes (26): Point, Size, HWND, LPARAM, LRESULT, UINT, wchar_t, WPARAM (+18 more)

### Community 1 - "Linux Flutter Runner"
Cohesion: 0.09
Nodes (22): FlPluginRegistry, FlView, GApplication, gboolean, gchar, GObject, GtkApplication, fl_register_plugins() (+14 more)

### Community 2 - "iOS Runner Tests"
Cohesion: 0.10
Nodes (16): Cocoa, Flutter, FlutterMacOS, FlutterPluginRegistry, FlutterSceneDelegate, FlutterViewController, Foundation, SceneDelegate (+8 more)

### Community 3 - "Windows Flutter Window"
Cohesion: 0.11
Nodes (25): RECT, unique_ptr, DartProject, HWND, LPARAM, LRESULT, UINT, WPARAM (+17 more)

### Community 4 - "Flutter Media Player UI"
Cohesion: 0.12
Nodes (16): build, _counter, createState, _incrementCounter, main, MyApp, MyHomePage, _MyHomePageState (+8 more)

### Community 5 - "iOS App Lifecycle"
Cohesion: 0.16
Nodes (10): Any, FlutterAppDelegate, FlutterImplicitEngineBridge, FlutterImplicitEngineDelegate, AppDelegate, Bool, AppDelegate, Bool (+2 more)

### Community 6 - "Windows Runner Bootstrap"
Cohesion: 0.22
Nodes (9): _In_, _In_opt_, string, vector, wWinMain(), wchar_t, CreateAndAttachConsole(), GetCommandLineArguments() (+1 more)

### Community 7 - "Web App Manifest"
Cohesion: 0.18
Nodes (10): background_color, description, display, icons, name, orientation, prefer_related_applications, short_name (+2 more)

### Community 8 - "Desktop Build Configuration"
Cohesion: 0.47
Nodes (6): Linux Application Build, Flutter Linux Build Rules, Linux Runner Target, Windows Application Build, Flutter Windows Build Rules, Windows Runner Target

### Community 9 - "Dart Testing Practices"
Cohesion: 0.50
Nodes (4): Testing Dart and Flutter Applications, Implementing Dart and Flutter Test Coverage, Testing and Mocking Dart Applications, Migrating Dart Tests to Package Checks

### Community 11 - "Flutter UI Testing"
Cohesion: 0.67
Nodes (3): Implementing Flutter Integration Tests, Previewing Flutter Widgets, Writing Flutter Widget Tests

## Knowledge Gaps
- **89 isolated node(s):** `title`, `_counter`, `main`, `build`, `createState` (+84 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **53 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `FlutterWindow` connect `Windows Flutter Window` to `iOS Runner Tests`, `Windows Runner Bootstrap`?**
  _High betweenness centrality (0.107) - this node is a cross-community bridge._
- **Why does `Win32Window` connect `Windows Flutter Window` to `Windows Native Windowing`, `Windows Runner Bootstrap`?**
  _High betweenness centrality (0.078) - this node is a cross-community bridge._
- **Are the 4 inferred relationships involving `MessageHandler` (e.g. with `Destroy` and `GetClientArea`) actually correct?**
  _`MessageHandler` has 4 INFERRED edges - model-reasoned connections that need verification._
- **Are the 2 inferred relationships involving `Create` (e.g. with `Destroy` and `UpdateTheme`) actually correct?**
  _`Create` has 2 INFERRED edges - model-reasoned connections that need verification._
- **Are the 2 inferred relationships involving `WndProc` (e.g. with `GetThisFromHandle` and `MessageHandler`) actually correct?**
  _`WndProc` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `title`, `_counter`, `main` to the rest of the system?**
  _89 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Windows Native Windowing` be split into smaller, more focused modules?**
  _Cohesion score 0.12183908045977011 - nodes in this community are weakly interconnected._