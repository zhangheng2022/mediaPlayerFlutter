# Graph Report - media_player_flutter  (2026-07-16)

## Corpus Check
- 204 files · ~142,182 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 1698 nodes · 1835 edges · 173 communities (101 shown, 72 thin omitted)
- Extraction: 98% EXTRACTED · 2% INFERRED · 0% AMBIGUOUS · INFERRED: 31 edges (avg confidence: 0.81)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `737c7b3d`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

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
- Study — extracting design DNA from a screenshot or URL
- 2. Syntax Reference
- Analyzing and Fixing Dart Code
- SKILL.md
- Hero enrichment — when, what, and how much
- Theme — Carnival
- Implementing Adaptive Layouts
- Interaction and states
- Internationalizing Flutter Applications
- Major (looks AI-generated)
- Implementing Flutter Networking
- Slop test — 58 gates + pre-emit self-critique
- Copy
- Critical (ships as slop)
- Typography
- app.dart
- app_shell.dart
- AGENTS.md
- Building Dart CLI Applications
- Implementing Dart Patterns
- Microinteraction tells
- Archetype index — load ONLY the picks you need
- Theme — Cobalt
- Responsive
- The six axes
- Managing Dart Dependencies
- Minor (small taste issues)
- Imagery kit — curated abstract assets, hosted, ready
- Genre — atmospheric
- Genre — modern-minimal
- Genre — playful
- § Multi-page flow — design.md first, then redesign
- Floating nav on scroll — the cross-fade morph
- Genre — editorial (default)
- Layout and space
- Motion
- empty_feature_state.dart
- design.md — opt-in portable design system
- Export formats
- package:forui/forui.dart
- feature_page.dart
- Compiling C Code into Code Assets with Native Assets Hooks
- Colour
- Macrostructures
- Implementing Precompiled Dynamic Downloads
- Method 1: Local Compilation with Linker Tree-Shaking (Recommended)
- Generating FFI Bindings using package:ffigen
- Step-by-Step Workflow
- application_test.dart
- Verification Checklist
- Step-by-Step Workflow
- FFIgen Overview
- Concrete Example: Binding a C Library
- Output contract & scope
- c2-inline-form-as-cta.md
- c3-typographic-link.md
- c4-sticky-bottom-bar.md
- f1-bento-grid.md
- f4-step-sequence.md
- f6-product-card-grid.md
- ft4-dense-typographic.md
- ft5-statement.md
- h2-split-diptych.md
- h7-demo-video-clipped-by-viewport-edge.md
- h9-custom-illustration-centerpiece.md
- n13-inline-cmdk-pill.md
- n1-wordmark-2-links.md
- n3-side-rail.md
- n4-hidden-behind-k.md
- n5-floating-pill.md
- n8-terminal-command.md
- s1-left-margin-numbered.md
- s2-hanging.md
- t1-pull-quote-with-marginalia.md
- t3-single-huge-quote.md
- t4-numbered-stat-strip.md
- app
- copyWith
- hashCode
- lerp
- operator
- icons
- style
- _typography
- String?
- Examples
- MusicLibraryRepository
- How to Use This Skill (The Workflow)
- Matchers with No Direct Replacements
- Q: 继续下个阶段：本地曲库扫描与播放应接入当前项目的哪里？
- local_music_scanner_test.dart
- AppColors
- f5-annotated-screenshot.md
- ft1-mast-headed.md
- ft3-index-style-category-list.md
- ft7-newsletter-first.md
- h4-stat-led.md
- h6-photographic-fold.md
- h8-mockup-split-browser-framed.md
- n11-mega-menu.md
- n2-floating-chip.md
- n7-brutal-slab.md
- s4-inline-no-break.md
- s5-bottom-anchored.md

## God Nodes (most connected - your core abstractions)
1. `Win32Window` - 22 edges
2. `Major (looks AI-generated)` - 20 edges
3. `Slop test — 58 gates + pre-emit self-critique` - 19 edges
4. `Theme — Hum` - 18 edges
5. `Critical (ships as slop)` - 17 edges
6. `Theme — Lumen` - 17 edges
7. `Recipes` - 16 edges
8. `Microinteraction tells` - 14 edges
9. `Responsive` - 13 edges
10. `Theme — Carnival` - 13 edges

## Surprising Connections (you probably didn't know these)
- `Linux Application Build` --semantically_similar_to--> `Windows Application Build`  [INFERRED] [semantically similar]
  linux/CMakeLists.txt → windows/CMakeLists.txt
- `Flutter Linux Build Rules` --semantically_similar_to--> `Flutter Windows Build Rules`  [INFERRED] [semantically similar]
  linux/flutter/CMakeLists.txt → windows/flutter/CMakeLists.txt
- `Linux Runner Target` --semantically_similar_to--> `Windows Runner Target`  [INFERRED] [semantically similar]
  linux/runner/CMakeLists.txt → windows/runner/CMakeLists.txt
- `FakeMusicLibraryRepository` --implements--> `MusicLibraryRepository`  [EXTRACTED]
  test/support/fakes.dart → lib/features/library/domain/music_library_repository.dart
- `FakePlaybackService` --implements--> `PlaybackService`  [EXTRACTED]
  test/support/fakes.dart → lib/features/player/domain/playback_service.dart

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Dart and Flutter Testing Workflows** — agents_skills_dart_add_unit_test_skill_testing_dart_and_flutter_applications, agents_skills_dart_generate_test_mocks_skill_testing_and_mocking_dart_applications, agents_skills_dart_collect_coverage_skill_implementing_dart_and_flutter_test_coverage, agents_skills_flutter_add_integration_test_skill_implementing_flutter_integration_tests, agents_skills_flutter_add_widget_test_skill_writing_flutter_widget_tests [INFERRED 0.85]

## Communities (173 total, 72 thin omitted)

### Community 0 - "Windows Native Windowing"
Cohesion: 0.06
Nodes (53): PluginRegistry, Point, RECT, Size, unique_ptr, RegisterPlugins(), DartProject, HWND (+45 more)

### Community 1 - "Linux Flutter Runner"
Cohesion: 0.09
Nodes (22): FlPluginRegistry, FlView, GApplication, gboolean, gchar, GObject, GtkApplication, fl_register_plugins() (+14 more)

### Community 2 - "iOS Runner Tests"
Cohesion: 0.06
Nodes (29): Any, audio_session, Cocoa, file_picker, Flutter, FlutterAppDelegate, FlutterImplicitEngineBridge, FlutterImplicitEngineDelegate (+21 more)

### Community 3 - "Windows Flutter Window"
Cohesion: 0.03
Nodes (28): C1 · Outlined chip, C2 · Inline form-as-CTA, C3 · Typographic link, C4 · Sticky bottom bar, F1 · Bento grid, F2 · Sticky-scroll stack, F3 · Tabular spec sheet, F4 · Step sequence (+20 more)

### Community 4 - "Flutter Media Player UI"
Cohesion: 0.18
Nodes (11): app/app.dart, build, PlaylistScreen, build, SettingsScreen, main, package:flutter_web_plugins/url_strategy.dart, package:flutter/widgets.dart (+3 more)

### Community 5 - "iOS App Lifecycle"
Cohesion: 0.05
Nodes (44): Abstract backgrounds, App mockups / device frames, Assets — sourcing canon for icons, logos, illustrations, photography, video, Avoid, Avoid, Avoid, Avoid, Avoid (+36 more)

### Community 6 - "Windows Runner Bootstrap"
Cohesion: 0.24
Nodes (9): _In_, _In_opt_, vector, wWinMain(), string, wchar_t, CreateAndAttachConsole(), GetCommandLineArguments() (+1 more)

### Community 7 - "Web App Manifest"
Cohesion: 0.18
Nodes (10): background_color, description, display, icons, name, orientation, prefer_related_applications, short_name (+2 more)

### Community 8 - "Desktop Build Configuration"
Cohesion: 0.47
Nodes (6): Linux Application Build, Flutter Linux Build Rules, Linux Runner Target, Windows Application Build, Flutter Windows Build Rules, Windows Runner Target

### Community 9 - "Dart Testing Practices"
Cohesion: 0.05
Nodes (21): 01 · Bento Grid, 02 · Long Document, 03 · Marquee Hero, 04 · Stat-Led, 05 · Workbench, 06 · Conversational FAQ, 07 · Manifesto, 08 · Photographic (+13 more)

### Community 10 - "macOS Plugin Registration"
Cohesion: 0.12
Nodes (15): 1. Add Dependencies, 1. Run Tests with VM Service, 2. Collect Coverage and Generate LCOV, 2. Collect Raw Coverage, 3. Feedback Loop: Validate Output, 3. Format to LCOV, Contents, Coverage Directives (+7 more)

### Community 11 - "Flutter UI Testing"
Cohesion: 0.18
Nodes (11): 10. Dynamic Map / JSON Lookup Casting, 1. Collection Equality Pitfall (`equals` vs `deepEquals`), 2. The `reason` Parameter is now `because`, 3. Regular Expression Matching (`matches` vs `matchesPattern`), 4. Property Extraction (`TypeMatcher.having` vs `.has`), 5. Synchronous vs. Asynchronous `throws`, 6. RegExp / Pattern Equality, 7. Strict Nullable Boolean Safety (`bool?` fields) (+3 more)

### Community 13 - "Dart Static Analysis"
Cohesion: 0.06
Nodes (31): Contents, Examples, Execution and Profiling, Host Driver Script (`test_driver/integration_test.dart`), Implementing Flutter Integration Tests, Interactive Exploration via MCP, Performance Profiling Driver Script (`test_driver/perf_driver.dart`), Project Setup and Dependencies (+23 more)

### Community 14 - "Dart Native Interop"
Cohesion: 0.06
Nodes (33): 1. Hand-built apparatus (no orb), 2. Lowercase headline with verb-landmark (no italics), 3. Mono eyebrow above every section, 4. Blueprint grid background (4% opacity), 5. Meter strip (below the hero), 6. Hairline cards with inner emission, 7. Three-stat row with Instrument Serif numerals + tabular-nums, Anti-patterns (theme-specific) (+25 more)

### Community 15 - "Flutter App Architecture"
Cohesion: 0.06
Nodes (32): 1. The button system — three variations, the press is the feedback, 2. Multi-accent section bands, 3. Color-shift card grid, 4. Streak / counter tick-up, 5. Character moment — one small reacting mark, 6. Big rounded everything, 7. Star-burst micro-celebration on success, Anti-patterns (theme-specific) (+24 more)

### Community 16 - "Responsive Flutter Layout"
Cohesion: 0.06
Nodes (29): Architecting Flutter Applications, Architectural Layers, Contents, Data Layer, Data Layer: Service and Repository, Examples, Logic Layer (Domain - Optional), Project Structure (+21 more)

### Community 17 - "Flutter Data Networking"
Cohesion: 0.07
Nodes (30): A hand-built SVG with declarative animation, A worked example — the bakery loaf as a single div, Animation choices for SVG in 2026, Anti-patterns of CSS art, Anti-patterns of declarative animation, Anti-patterns of generated stills, Anti-patterns of hand-built SVG, Anti-patterns of Three.js / WebGL (+22 more)

### Community 21 - "Dart CLI Development"
Cohesion: 0.07
Nodes (29): § A · The one follow-up question, B.1 · Anchor accent first, B.2 · Paper, B.3 · Ink, B.4 · Supporting greys, B.5 · Focus, B.6 · Accent-ink (overlay text colour on accent), B.7 · Verification (+21 more)

### Community 22 - "Dart Dependency Management"
Cohesion: 0.08
Nodes (24): AppColors get, AppStyle get, _body, borderRadius, color, darkColors, _display, FColorsExtensions (+16 more)

### Community 23 - "Dart Pattern Matching"
Cohesion: 0.07
Nodes (28): 0. Pre-flight scan, 1. Design-context gate, 2.5. Check project memory, 2.6. Theme route — studied-DNA, catalog, or custom, 2. Pick a macrostructure FIRST, 3. Load the visual ruleset, 4. Decide on hero enrichment, 5. Preview (+20 more)

### Community 25 - "Flutter Localization"
Cohesion: 0.07
Nodes (27): Accessibility ground truth, Button press, Command palette navigation, Copy-to-clipboard, Drag handle, Dropdown / menu, Form validation, Hard rules for default-on motion (+19 more)

### Community 69 - "Study — extracting design DNA from a screenshot or URL"
Cohesion: 0.08
Nodes (26): After the file is written, Emitting a `design.md` from `study`, Image-mode template, Junk-or-blocked detection, Limits and disclaimers, Refusal — when not to study, Remote URL safety, Source mode — image or URL (+18 more)

### Community 70 - "2. Syntax Reference"
Cohesion: 0.08
Nodes (23): 1. Overview, 2.1 Basic Class Header Syntax, 2.2 Declaring, Initializing, and Plain Parameters, 2.3 Constant Primary Constructors, 2.4 Extension Types, 2.5 Empty Body Semicolon Shorthand (`;`), 2.6 The In-Body Part of a Primary Constructor (`this ...`), 2.7 Abbreviated Concise Constructor Syntax (+15 more)

### Community 71 - "Analyzing and Fixing Dart Code"
Cohesion: 0.09
Nodes (21): Contents, Core Concepts & Guidelines, Error Handling, Example: Fixing Dynamic List Assignments, Example: Fixing Method Overrides (Contravariance), Example: Fixing Null Safety with `late`, Examples, Null Safety (+13 more)

### Community 72 - "SKILL.md"
Cohesion: 0.19
Nodes (4): H7 · Demo Video — Clipped-by-viewport-edge, H9 · Custom Illustration Centerpiece, Preview-block worked examples, `hallmark audit`

### Community 73 - "Hero enrichment — when, what, and how much"
Cohesion: 0.09
Nodes (23): Animation discipline (hero specifically), Common mistakes — and the fixes, E1 · Demo Video — Clipped-by-viewport-edge, E2 · Demo Video — Full-bleed muted loop with ghost overlay, E3 · Mock App Screenshot — Browser-framed split, E4 · Mock App Screenshot — Floating no-frame, E5 · Custom Illustration Centerpiece, E6 · Animated Loop — pure CSS / SVG / Motion (+15 more)

### Community 74 - "Theme — Carnival"
Cohesion: 0.09
Nodes (22): Anti-patterns (theme-specific), Axes (diversification), Build hint, Drop 01 · Cold Snap *(default)*, Drop 02 · Citrus Riot, Drop 03 · Diner Sign, Drop 04 · Studio Night, Drop 05 · Aqua Park (+14 more)

### Community 75 - "Implementing Adaptive Layouts"
Cohesion: 0.10
Nodes (19): Adaptive Layout using LayoutBuilder, Constraining Width on Large Screens, Contents, Device and Orientation Behaviors, Examples, Implementing Adaptive Layouts, Space Measurement Guidelines, Widget Sizing and Constraints (+11 more)

### Community 76 - "Interaction and states"
Cohesion: 0.10
Nodes (21): Bans, Computation, Contrast discipline, Don't, list, Dropdowns, tooltips, popovers, Focus rings, Forms, Heights and rhythm (+13 more)

### Community 77 - "Internationalizing Flutter Applications"
Cohesion: 0.10
Nodes (19): 1. Add Dependencies, 1. Define ARB Files, 2. Enable Code Generation, 2. Generate Localization Classes, 3. Consume Localized Strings, 3. Create Configuration File, 4. Configure the App Entry Point, Advanced Formatting (+11 more)

### Community 78 - "Major (looks AI-generated)"
Cohesion: 0.10
Nodes (20): AI-illustration look, Animate-on-scroll on everything, Bounce and elastic easing, Centred everything, Eyebrow on every section, Generic emoji as feature icon, Glassmorphism without purpose, Hover-only affordances (+12 more)

### Community 79 - "Implementing Flutter Networking"
Cohesion: 0.11
Nodes (17): Background Parsing (Large Payload), Contents, Core Guidelines, Examples, High-Fidelity Model Implementation, Serializing JSON Manually in Flutter, Synchronous Parsing (Small Payload), Workflow: Fetching and Parsing JSON (+9 more)

### Community 80 - "Slop test — 58 gates + pre-emit self-critique"
Cohesion: 0.11
Nodes (19): Contrast & readability, Diversification gates, Hero enrichment gates, Honest copy · no fabricated content, Implementation gates, Input-state gate, Layout-safety gates, Microinteractions (+11 more)

### Community 81 - "Copy"
Cohesion: 0.11
Nodes (17): Austere, Banned opening lines (anti-patterns), Brutalist, Buttons, Copy, Editorial, Empty states, Error messages (+9 more)

### Community 82 - "Critical (ships as slop)"
Cohesion: 0.12
Nodes (17): Aurora-blob background, Card-in-card, Critical (ships as slop), Default-attractor sameness, Floating-orb decoration, Full-viewport centred hero, Inter-everywhere, Lazy-loaded LCP (+9 more)

### Community 83 - "Typography"
Cohesion: 0.12
Nodes (17): Banned defaults, Bans, Body text rules, Free body faces, Free display faces, Free mono / outlier faces, Headings rules, Hero headline sizing — match size to copy length (+9 more)

### Community 84 - "app.dart"
Cohesion: 0.20
Nodes (9): ../features/home/presentation/home_screen.dart, ../features/library/presentation/library_screen.dart, ../features/playlist/presentation/playlist_screen.dart, ../features/settings/presentation/settings_screen.dart, GoRouter, appRouter, createRouter, package:go_router/go_router.dart (+1 more)

### Community 85 - "app_shell.dart"
Cohesion: 0.15
Nodes (14): AppShell, build, _desktopNavigationBreakpoint, _DesktopSidebar, _item, _MobileNavigationBar, navigationShell, onSelect (+6 more)

### Community 86 - "AGENTS.md"
Cohesion: 0.14
Nodes (12): Agent 工作流程, UI 与交互, 代码规范, 完成标准, 平台能力, 当前项目基线, 技术选型规则, 播放器领域约定 (+4 more)

### Community 87 - "Building Dart CLI Applications"
Cohesion: 0.14
Nodes (13): Argument Parsing & Command Routing, Building Dart CLI Applications, Compilation & Distribution, Contents, Example: CommandRunner Implementation, Example: Integration Testing with Subprocesses, Examples, Execution & Error Handling (+5 more)

### Community 88 - "Implementing Dart Patterns"
Cohesion: 0.14
Nodes (13): Algebraic Data Types (Sealed Classes), Contents, Core Pattern Implementations, Examples, Feedback Loop: Exhaustiveness Checking, Guard Clauses and Logical-or, Implementing Dart Patterns, JSON Validation and Destructuring (+5 more)

### Community 89 - "Microinteraction tells"
Cohesion: 0.14
Nodes (14): Animated hover gradients, Auto-rotating carousels with no pause, Bouncy overshoot easings on UI, Celebratory success toasts, Confirmation dialogs for reversible actions, Cursor follower dots, Focus rings that animate in, Microinteraction tells (+6 more)

### Community 90 - "Archetype index — load ONLY the picks you need"
Cohesion: 0.14
Nodes (14): Archetype index — load ONLY the picks you need, Component cookbook, CTAs / signups, Feature blocks, Footers, Heroes, Mobile collapse — per archetype, Navigation (+6 more)

### Community 91 - "Theme — Cobalt"
Cohesion: 0.14
Nodes (13): Anti-patterns, Axes (diversification), Build hint, How Cobalt differs from neighbouring themes, Macrostructure affinity, Macrostructure rejection, Motion, Reference register (+5 more)

### Community 92 - "Responsive"
Cohesion: 0.15
Nodes (13): Bans, Breakpoints, Clickable text — never wraps, Fluid scaling, Images, Internationalisation, Mobile — non-negotiable, Pointer and hover queries (+5 more)

### Community 93 - "The six axes"
Cohesion: 0.15
Nodes (13): 1. Section-heading placement, 2. Body composition, 3. Divider language, 4. Button voice, 5. Image treatment, 6. Reveal pattern, Anti-patterns of structural sameness, Domain → trio (offer these three; never default) (+5 more)

### Community 94 - "Managing Dart Dependencies"
Cohesion: 0.18
Nodes (10): Contents, Core Concepts, Examples, Managing Dart Dependencies, Surgical Lockfile Removal, Tightening Constraints, Version Constraints, Workflow: Auditing Dependencies (+2 more)

### Community 95 - "Minor (small taste issues)"
Cohesion: 0.18
Nodes (11): 100vw widths, Anti-patterns — the named tells, Double-hyphen dashes, Every section padded the same, How `hallmark audit` should report, Minor (small taste issues), Placeholder names, Startup-cliché product names (+3 more)

### Community 96 - "Imagery kit — curated abstract assets, hosted, ready"
Cohesion: 0.18
Nodes (11): Anti-patterns, Categories, Decoration, Empty state, Generation pipeline (out-of-band, one-time), Imagery kit — curated abstract assets, hosted, ready, Layered hero composition (the masterclass move), Manifest (placeholder until generation pass ships) (+3 more)

### Community 97 - "Genre — atmospheric"
Cohesion: 0.20
Nodes (10): Genre — atmospheric, Nav and footer voice, Reference register, Stamp signature, Themes that belong, Voice, Voice fixtures, What this genre allows (+2 more)

### Community 98 - "Genre — modern-minimal"
Cohesion: 0.20
Nodes (10): Genre — modern-minimal, Nav and footer voice, Reference register (for the LLM, not credited to anyone), Stamp signature, Themes that belong, Voice, Voice fixtures, What this genre allows (+2 more)

### Community 99 - "Genre — playful"
Cohesion: 0.20
Nodes (10): Genre — playful, Nav and footer voice, Reference register, Stamp signature, Themes that belong, Voice, Voice fixtures, What this genre allows (+2 more)

### Community 100 - "§ Multi-page flow — design.md first, then redesign"
Cohesion: 0.20
Nodes (10): 1. Read the project, then pause, 2. Produce `design.md` at the project root, 3. Redesign each page reading from `design.md`, 4. Diversification rule — INVERTED for multi-page, 5. When to amend `design.md` instead of overriding, `hallmark redesign`, § Multi-page flow — design.md first, then redesign, Non-destructive implementation rule (+2 more)

### Community 101 - "Floating nav on scroll — the cross-fade morph"
Cohesion: 0.33
Nodes (6): Anti-patterns Hallmark refuses, Floating nav on scroll — the cross-fade morph, The four laws — non-negotiable, The property morph (10 properties, one curve), The scroll handler, The structure

### Community 102 - "Genre — editorial (default)"
Cohesion: 0.22
Nodes (9): Genre — editorial (default), Nav and footer voice, Stamp signature, Themes that belong, Voice, Voice fixtures, What this genre allows, What this genre disallows (+1 more)

### Community 103 - "Layout and space"
Cohesion: 0.22
Nodes (9): Asymmetry techniques, Bans, Depth, Grids, Layout and space, Page-edge clipping, Principles, The spacing scale (+1 more)

### Community 104 - "Motion"
Cohesion: 0.22
Nodes (9): Bans, Durations, Easings, Motion, Page-load orchestration, Principles, Reduced motion, Scroll-linked motion (+1 more)

### Community 105 - "empty_feature_state.dart"
Cohesion: 0.22
Nodes (8): IconData, actionLabel, build, description, EmptyFeatureState, icon, onAction, title

### Community 106 - "design.md — opt-in portable design system"
Cohesion: 0.25
Nodes (8): After the file is written, CTA — surface the offer in the Step 5 preview, design.md — opt-in portable design system, Format (the tight version), Scope, Triggers (phrase-only — no new verb), Two emission paths (default vs study), Why opt-in (not auto-emit)

### Community 107 - "Export formats"
Cohesion: 0.25
Nodes (7): Export formats, Format 1 — `tokens.css`, Format 2 — Tailwind v4 `@theme`, Format 3 — DTCG `tokens.json`, Format 4 — shadcn/ui CSS variables, Output rule, Token taxonomy — Hallmark's source of truth

### Community 108 - "package:forui/forui.dart"
Cohesion: 0.13
Nodes (17): ../../app/app_scope.dart, ChangeNotifier, dart:async, ../../../features/library/presentation/track_tile.dart, ../../features/player/application/player_controller.dart, build, _HomeLibrary, HomeScreen (+9 more)

### Community 109 - "feature_page.dart"
Cohesion: 0.22
Nodes (8): actions, build, child, FeaturePage, title, List, package:flutter/material.dart, Widget

### Community 110 - "Compiling C Code into Code Assets with Native Assets Hooks"
Cohesion: 0.29
Nodes (6): Choosing an Integration Approach, Compiling C Code into Code Assets with Native Assets Hooks, Constraints, Contents, Introduction, Native Interop Packages

### Community 111 - "Colour"
Cohesion: 0.29
Nodes (7): Bans, Colour, Contrast, Dark mode recipe, Palette construction, Principles, Use of the accent

### Community 112 - "Macrostructures"
Cohesion: 0.29
Nodes (7): Diversification rule (mandatory), Hero polish patterns, How to pick, Macrostructures, Nav and footer voice, SaaS page sequence, The 21 macrostructures — index

### Community 113 - "Implementing Precompiled Dynamic Downloads"
Cohesion: 0.33
Nodes (6): 1. Defining Target Hashes (`lib/src/hook_helpers/hashes.dart`), 2. Hook Downloader Helper (`lib/src/hook_helpers/download.dart`), 3. Implementing `hook/build.dart`, Implementing Precompiled Dynamic Downloads, Method 2: Downloading Precompiled Dynamic Libraries, Why Download Precompiled Binaries?

### Community 114 - "Method 1: Local Compilation with Linker Tree-Shaking (Recommended)"
Cohesion: 0.33
Nodes (6): C Source and Bindings Setup, Defining the C Library Build Spec, Implementing `hook/build.dart`, Implementing `hook/link.dart`, Method 1: Local Compilation with Linker Tree-Shaking (Recommended), Prerequisite Host Compiler Toolchains

### Community 115 - "Generating FFI Bindings using package:ffigen"
Cohesion: 0.33
Nodes (5): Constraints, Contents, Generating FFI Bindings using package:ffigen, Introduction, Verification Checklist

### Community 116 - "Step-by-Step Workflow"
Cohesion: 0.33
Nodes (6): Step 1: Check/Add Dependencies, Step 2: Formulate Paths Dynamically, Step 3: Write the Script (`tool/ffigen.dart`), Step 4: Run Code Generation, Step 5: Static Analysis, Step-by-Step Workflow

### Community 117 - "application_test.dart"
Cohesion: 0.15
Nodes (14): dart:io, dart:ui, package:flutter_test/flutter_test.dart, package:media_player_flutter/app/app.dart, package:media_player_flutter/app/app_dependencies.dart, package:media_player_flutter/app/router.dart, package:media_player_flutter/features/library/application/library_controller.dart, package:media_player_flutter/features/player/application/player_controller.dart (+6 more)

### Community 118 - "Verification Checklist"
Cohesion: 0.40
Nodes (5): 1. Local Execution Sandbox, 2. Verify Target Outputs, 3. Verify Tree-Shaking Stripping, 4. Verify Offline Compliance (User Defines), Verification Checklist

### Community 119 - "Step-by-Step Workflow"
Cohesion: 0.40
Nodes (5): Step 1: Add Dependencies, Step 2: Define C Specifications, Step 3: Implement Build and Link Hook Scripts, Step 4: Run the Hook Cycle, Step-by-Step Workflow

### Community 120 - "FFIgen Overview"
Cohesion: 0.40
Nodes (5): 1. `FfiGenerator`, 2. `Headers`, 3. `Functions`, 4. `Output`, FFIgen Overview

### Community 121 - "Concrete Example: Binding a C Library"
Cohesion: 0.40
Nodes (5): AFTER: Generating via FFIgen (The Correct Pattern), BEFORE: Manual FFI Binding (The Anti-Pattern), Concrete Example: Binding a C Library, Running the Generator script, The C Header File (`third_party/sqlite/sqlite3.h`)

### Community 122 - "Output contract & scope"
Cohesion: 0.50
Nodes (3): Output contract, Output contract & scope, Scope and limits

### Community 123 - "c2-inline-form-as-cta.md"
Cohesion: 0.05
Nodes (38): AudioPlayer, ../domain/playback_service.dart, _configureSession, currentIndexStream, dispose, durationStream, JustAudioPlaybackService, _mapProcessingState (+30 more)

### Community 124 - "c3-typographic-link.md"
Cohesion: 0.06
Nodes (34): Exception?, package:media_player_flutter/features/library/domain/music_library_repository.dart, package:media_player_flutter/features/player/domain/playback_service.dart, cancelled, currentIndex, currentIndexStream, dispose, _duration (+26 more)

### Community 125 - "c4-sticky-bottom-bar.md"
Cohesion: 0.06
Nodes (30): Duration?, Duration get, int?, canGoNext, canGoPrevious, _currentIndex, dispose, _disposed (+22 more)

### Community 126 - "f1-bento-grid.md"
Cohesion: 0.10
Nodes (20): app_dependencies.dart, app_scope.dart, InheritedWidget, Application, _ApplicationState, build, createState, dependencies (+12 more)

### Community 127 - "f4-step-sequence.md"
Cohesion: 0.14
Nodes (13): bool get, _errorMessage, hasTracks, importMusic, isScanning, LibraryStatus, _repository, _setError (+5 more)

### Community 128 - "f6-product-card-grid.md"
Cohesion: 0.17
Nodes (11): ../domain/audio_track.dart, ../domain/music_library_repository.dart, _filePicker, importTracks, _scanner, chooseAudioFiles, FilePickerMusicFilePickerService, MusicFilePickerService (+3 more)

### Community 130 - "ft5-statement.md"
Cohesion: 0.17
Nodes (11): Contents, Examples, Feedback Loop: Test Failures, Generating Mocks, High-Fidelity Mocking and Testing Example, Implementing Unit Tests, Managing Dependencies, Structuring Code for Testability (+3 more)

### Community 132 - "h7-demo-video-clipped-by-viewport-edge.md"
Cohesion: 0.18
Nodes (11): DateTime, _isSupported, LocalMusicScanner, modifiedAt, MusicScanner, path, ScannedAudioFile, scanPaths (+3 more)

### Community 133 - "h9-custom-illustration-centerpiece.md"
Cohesion: 0.17
Nodes (11): int get, artist, extension, fromFile, hashCode, id, modifiedAt, operator (+3 more)

### Community 135 - "n1-wordmark-2-links.md"
Cohesion: 0.18
Nodes (10): Contents, Examples, Executing Tests, Mocking with Mockito, Standard Unit Test Suite, Structuring Test Files, Task Progress, Test Implementation Workflow (+2 more)

### Community 137 - "n4-hidden-behind-k.md"
Cohesion: 0.20
Nodes (9): 1. Simple Custom Expectations (using `expect`), 2. Nested Property Extraction (using `nest` or `has`), 3. Asynchronous Custom Expectations, Contents, Matcher-to-Checks Mapping Table, Migrating Dart Tests to Package Checks, Strategies for Discovery, When to Use This Skill (+1 more)

### Community 138 - "n5-floating-pill.md"
Cohesion: 0.20
Nodes (9): ../../../features/library/application/library_controller.dart, ../features/library/data/local_music_library_repository.dart, ../features/library/data/local_music_scanner.dart, ../features/library/data/music_file_picker_service.dart, ../features/player/data/just_audio_playback_service.dart, dispose, library, player (+1 more)

### Community 139 - "n8-terminal-command.md"
Cohesion: 0.22
Nodes (8): ../application/library_controller.dart, build, library, _LibraryContent, LibraryScreen, player, ../../player/application/player_controller.dart, track_tile.dart

### Community 144 - "t4-numbered-stat-strip.md"
Cohesion: 0.22
Nodes (8): AudioTrack, build, onPress, playing, selected, track, TrackTile, VoidCallback?

### Community 154 - "Examples"
Cohesion: 0.29
Nodes (7): Asynchronous Futures, Asynchronous Streams, Basic Assertions, Chaining and Cascades, Collection and Deep Equality, Complex Property Matching (has), Examples

### Community 155 - "MusicLibraryRepository"
Cohesion: 0.33
Nodes (5): audio_track.dart, LocalMusicLibraryRepository, importTracks, MusicLibraryRepository, FakeMusicLibraryRepository

### Community 156 - "How to Use This Skill (The Workflow)"
Cohesion: 0.40
Nodes (5): 1. Dependency Setup, 2. Identify and Plan Target Files, 3. Migrating a File (Incremental or Full), 4. Verification and Feedback Loops, How to Use This Skill (The Workflow)

### Community 157 - "Matchers with No Direct Replacements"
Cohesion: 0.40
Nodes (5): 1. Specific Error Matchers, 2. The `anything` Matcher, 3. Specific Numeric Toggles, 4. Numeric Ranges, Matchers with No Direct Replacements

### Community 158 - "Q: 继续下个阶段：本地曲库扫描与播放应接入当前项目的哪里？"
Cohesion: 0.40
Nodes (4): Answer, Outcome, Q: 继续下个阶段：本地曲库扫描与播放应接入当前项目的哪里？, Source Nodes

### Community 159 - "local_music_scanner_test.dart"
Cohesion: 0.40
Nodes (4): package:media_player_flutter/features/library/data/local_music_scanner.dart, package:media_player_flutter/features/library/domain/audio_track.dart, package:path/path.dart, main

### Community 160 - "AppColors"
Cohesion: 1.33
Nodes (3): AppColors, AppStyle, ThemeExtension

## Knowledge Gaps
- **1101 isolated node(s):** `router`, `dependencies`, `_ownsDependencies`, `createState`, `dispose` (+1096 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **72 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Anti-patterns — the named tells` connect `Minor (small taste issues)` to `SKILL.md`, `Microinteraction tells`, `Critical (ships as slop)`, `Major (looks AI-generated)`?**
  _High betweenness centrality (0.024) - this node is a cross-community bridge._
- **Why does `Hallmark` connect `Dart Pattern Matching` to `SKILL.md`?**
  _High betweenness centrality (0.017) - this node is a cross-community bridge._
- **Why does `Microinteractions` connect `Flutter Localization` to `SKILL.md`?**
  _High betweenness centrality (0.013) - this node is a cross-community bridge._
- **What connects `router`, `dependencies`, `_ownsDependencies` to the rest of the system?**
  _1101 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Windows Native Windowing` be split into smaller, more focused modules?**
  _Cohesion score 0.0597567424643046 - nodes in this community are weakly interconnected._
- **Should `Linux Flutter Runner` be split into smaller, more focused modules?**
  _Cohesion score 0.09401709401709402 - nodes in this community are weakly interconnected._
- **Should `iOS Runner Tests` be split into smaller, more focused modules?**
  _Cohesion score 0.05647840531561462 - nodes in this community are weakly interconnected._