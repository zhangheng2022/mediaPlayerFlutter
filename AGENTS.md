# AGENTS.md

## 项目目标

本项目要开发为跨平台 Flutter 音乐播放器。优先保证 Android 和 iOS 的播放体验，再根据需求完善 Windows、macOS、Linux 和 Web 支持。

应用 UI 统一采用 Forui 作为主要组件库和设计系统。除 Forui 暂未覆盖的能力或 Flutter 平台集成需求外，不新增另一套通用 UI 组件体系。

所有 Agent 默认使用中文沟通、说明设计和编写文档；代码标识符、文件名和公开 API 使用清晰的英文命名。

## 当前项目基线

- 当前代码仍是 Flutter 默认计数器模板，应用入口集中在 `lib/main.dart`。
- `pubspec.yaml` 目前只有 Flutter SDK 和 `cupertino_icons`，尚未实际引入 Forui、播放器、状态管理、路由、网络、数据库或序列化依赖。
- `test/widget_test.dart` 仍是默认计数器测试。
- Android、iOS、桌面端和 Web 目录基本保持 Flutter 模板状态，尚未配置后台播放、媒体通知、音频焦点、网络访问或媒体库权限。
- 不要把规划中的目录、依赖或能力描述成已经实现。开始任务前必须先检查实际文件和 `git status`。

## 目标架构

采用按功能分组、分层依赖的结构。目录可以随功能逐步创建，不要一次性生成空目录或空抽象。

```text
lib/
  main.dart
  app/
    app.dart
    bootstrap.dart
    router.dart
    theme/
  core/
    error/
    logging/
    platform/
    utils/
  features/
    player/
      domain/
      application/
      data/
      presentation/
    library/
      domain/
      application/
      data/
      presentation/
    playlist/
      domain/
      application/
      data/
      presentation/
    settings/
      domain/
      application/
      data/
      presentation/
  shared/
    widgets/
    extensions/
```

各层职责：

- `presentation`：页面、组件和仅与视图相关的状态，不直接调用播放器插件、数据库或 HTTP 客户端。
- `application`：用例、状态协调和用户操作编排，例如播放、暂停、切歌、拖动进度、修改播放队列。
- `domain`：纯 Dart 实体、值对象和仓库/服务接口，不依赖 Flutter UI 和具体插件。
- `data`：播放器插件适配器、数据库、文件扫描、网络 API、DTO 及仓库实现。
- `core`：真正跨功能且稳定的基础能力。不要把某个功能的杂项代码随意放入 `core`。

依赖方向必须保持为：

```text
presentation -> application -> domain
data ------------------------> domain
```

`domain` 不得反向依赖 `application`、`presentation` 或 `data`。

## 播放器领域约定

播放器内核与 UI 必须解耦。UI 只能通过应用层公开的状态和命令操作播放，不得直接持有第三方播放器实例。

逐步建立以下核心概念，命名可以根据实现微调：

- `Track`：歌曲稳定 ID、标题、艺术家、专辑、时长、封面和媒体来源。
- `MediaSource`：本地文件、远程 URL 或其他可扩展来源；不要用裸字符串在各层传递来源类型。
- `PlaybackQueue`：当前队列、当前索引和队列变更规则。
- `PlaybackState`：idle、loading、ready、playing、paused、completed、error 等明确状态。
- `RepeatMode`：off、one、all。
- `PlaybackController` 或等价接口：load、play、pause、seek、skip、setQueue、setVolume、setSpeed 等能力。

时间进度、总时长、缓冲位置和播放状态应来自同一状态模型，避免页面分别订阅多个流后产生瞬时不一致。高频进度更新只重建必要的小组件，不要导致整个页面刷新。

切歌、拖动进度和快速连续点击必须考虑竞态：旧请求完成后不能覆盖新请求状态。所有异步命令都要定义 loading、失败和取消/被替代时的行为。

## 技术选型规则

- UI 组件库确定为 Forui。开始首个 UI 实现任务时使用 `flutter pub add forui` 安装当前稳定版，不在文档或 `pubspec.yaml` 中手工猜测版本号。
- 应用根节点保留 `MaterialApp` 或 `MaterialApp.router` 提供路由和 Flutter 平台基础能力，并按照 Forui 官方接入方式通过 `builder` 在其下配置 `FTheme`。
- Forui 主题集中放在 `lib/app/theme/`，颜色、文字、圆角、间距和组件变体应来自统一主题或语义化设计令牌，不在业务页面散落硬编码样式。
- 页面优先使用 Forui 的 Scaffold、Button、Slider、Tabs、Sheet、Toast、Dialog、Bottom Navigation 等组件。Forui 没有对应能力时才使用 Material/Cupertino 或自定义组件，并保持视觉风格一致。
- 不允许同一交互在不同页面分别使用 Forui、Material 和 Cupertino 三套外观。必要的 Material/Cupertino 组件应封装在 `shared/widgets/`，避免实现细节扩散。
- 不默认引入 `forui_hooks`；只有项目已经明确采用 Flutter Hooks 且确实需要 Forui controller hooks 时才添加。
- 引入播放器、后台音频、状态管理、路由、数据库或网络包前，先检查现有依赖和目标平台支持情况。
- 一类能力只保留一个主要实现，避免同时引入多个状态管理或播放器方案。
- 第三方音频插件必须封装在 `data` 或平台适配层，不能扩散到页面和领域模型。
- 新增依赖时说明用途、平台限制和替代方案，并使用 `flutter pub add` 或 `dart pub add`，不要手工猜测版本号。
- 需要代码生成时，把生成命令、输入文件和生成文件约定写入 README；生成文件不得手工修改。
- 不为“以后可能需要”提前添加依赖或抽象。

## 平台能力

涉及音频功能时必须分别检查目标平台，而不是只让 Dart 代码通过编译：

- Android：网络权限、前台服务、媒体通知、音频焦点、耳机拔出、蓝牙控制和 Android 版本差异。
- iOS：音频会话、后台音频 capability、控制中心、耳机/蓝牙事件和中断恢复。
- 桌面端：文件选择、文件系统权限、窗口生命周期和媒体快捷键支持。
- Web：浏览器自动播放限制、CORS、媒体格式支持和后台标签页行为。

只修改本次任务涉及的平台文件。平台配置变更必须说明原因，并尽可能在真实设备或对应模拟器上验证。

## UI 与交互

- Forui 是视觉和交互基线，但领域状态、播放控制和业务逻辑不得依赖 Forui 类型。
- 音乐播放器应建立自己的 Forui 主题：深浅色模式、品牌强调色、背景层级、封面占位样式和播放控件状态必须统一定义。
- 复用 Forui 组件时优先通过主题和组件提供的样式接口定制，不复制组件源码，也不依赖包内部未公开 API。
- 图标优先使用与 Forui 主题一致的公开图标体系；播放、暂停、上一首、下一首、随机和循环图标必须具备明确语义与选中状态。
- 页面优先拆分为可测试的小组件；复杂页面不得把业务逻辑堆在 `build` 方法中。
- 播放条、完整播放页和队列页应共享同一个播放状态来源。
- 所有播放按钮都要覆盖不可用、加载中和失败状态，避免重复提交命令。
- 进度条拖动时区分预览位置与真实播放位置，拖动结束后再提交 seek；失败时恢复到播放器真实位置。
- 长标题、缺失封面、未知艺术家、零时长、网络中断和空播放列表都是正常状态，必须有合理 UI。
- 新界面至少适配窄屏手机；涉及平板或桌面任务时使用响应式布局，不依赖固定宽高。
- 保持无障碍语义、可读对比度和足够的点击区域。

## 错误处理与日志

- 不吞掉播放器、文件系统、数据库或网络异常。
- data 层异常应转换为应用可理解的失败类型，再交给 presentation 层显示。
- 用户提示使用可操作的中文信息；日志保留必要上下文，但不得记录访问令牌、完整隐私路径或用户敏感信息。
- 对可恢复错误提供重试或降级；不可恢复错误要安全停止当前操作，不能让 UI 保持虚假的 playing 状态。

## 测试要求

新增或修改逻辑时，测试应与变更一起提交：

- 领域模型、队列规则、播放状态转换和用例使用 Dart 单元测试。
- 页面渲染、按钮状态、进度交互和错误状态使用 Widget 测试。
- 第三方播放器、数据库和网络接口在单元测试中使用 fake 或 mock，不依赖真实网络和音频设备。
- 后台播放、通知栏控制、音频焦点和平台中断属于集成测试或真实设备验证范围。
- 修复 bug 时先补充能复现问题的回归测试，除非平台限制使自动化不可行；无法自动化时记录手工验证步骤。
- 删除默认计数器功能时同步替换 `test/widget_test.dart`，不要留下失效模板测试。

## 代码规范

- 遵循 `analysis_options.yaml` 和 `flutter_lints`。
- 优先使用不可变模型、`const` 构造和小而明确的函数。
- 不在 Widget 中创建长期存活的播放器、订阅、计时器或控制器；它们必须有明确所有者并正确释放。
- 每个文件聚焦一个主要职责。避免 `utils.dart`、`helpers.dart` 这类无边界集合。
- 注释解释设计原因和边界条件，不重复代码字面含义。
- 不使用 `print` 作为正式日志方案。
- 不修改生成文件、构建产物、`.dart_tool/`、`build/` 或平台生成的插件注册文件。

## Agent 工作流程

1. 阅读本文件、任务相关代码、`pubspec.yaml` 和 `git status`。
2. 明确本次改动属于哪个功能和层，先复用已有结构，避免建立平行实现。
3. 对播放行为或公共接口的重大变化，先简要说明状态模型和依赖方向。
4. 以最小完整改动实现功能，同时添加相称的测试。
5. 格式化改动文件并执行适用检查。
6. 最终说明改了什么、验证结果、尚未覆盖的平台风险和后续建议。

常用检查命令：

```powershell
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
```

涉及 Android 构建时，先确认 JDK 和 Gradle 网络配置可用，再执行：

```powershell
flutter build apk --debug
```

不要为了让检查通过而批量改动无关文件。若现有失败与本次任务无关，应保留现场并在结果中明确说明。

## 完成标准

一个功能只有在以下条件满足后才算完成：

- 代码位于正确层级，依赖方向没有被破坏。
- UI 状态与真实播放状态一致，异步失败和边界情况已处理。
- 新逻辑有相称的自动化测试，或记录了无法自动化的原因和手工验证结果。
- `dart format`、`flutter analyze` 和相关测试通过。
- 涉及平台能力时，平台配置和验证情况已明确说明。
- 没有覆盖用户未提交的改动，没有提交密钥、构建产物或无关格式化修改。
