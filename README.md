![录制_2024_07_01_20_58_26_626](https://github.com/Davidtian0905/ReaScripts_SampleSolo/assets/122532842/84b9717d-0763-422a-8a7d-9cac874d693b)

MuteOthersUnmuteSelected.lua 功能介绍：

这个脚本提供了一种快速且精确的方法来控制同一层级轨道的静音状态。当在任何轨道上运行此脚本时，它会执行以下操作：

首先检查并取消选中轨道所在层级的所有solo状态，而不影响其他层级的solo。
将选中轨道所在层级的所有其他轨道设置为静音（mute）状态。
确保选中的轨道保持非静音状态。

这个脚本特别适用于需要快速隔离某个轨道进行编辑或听音的情况，同时不影响项目其他层级的轨道状态。它提供了一种比传统solo更灵活的方式来聚焦于特定轨道，因为它不会影响其他层级的轨道状态。

UnmuteAllSameLevel.lua 功能介绍：

这个脚本提供了一种快速取消同一层级所有轨道静音的方法。当在任何轨道上运行此脚本时，它会执行以下操作：

识别选中轨道所在的层级。
将该层级的所有轨道（包括选中的轨道）设置为非静音（unmute）状态。
不影响其他层级轨道的静音状态。

这个脚本特别有用于在完成特定层级的编辑或听音后，快速恢复该层级所有轨道的可听状态。它提供了一种高效的方式来管理复杂项目中的轨道状态，使用户能够专注于特定层级的音轨，而不影响整体项目结构。
这两个脚本配合使用，可以为REAPER用户提供更精细和高效的轨道静音控制，特别适合处理有多个层级的复杂项目。

使用方法：
在REAPER中创建一个新的自定义动作。
将这个Lua脚本导入到自定义动作中。
保存这个自定义动作。
为这个自定义动作分配一个快捷键（例如 'Shift+U'）。

https://github.com/Davidtian0905/ReaScripts_SampleSolo/assets/122532842/722c3378-a0c9-459a-96de-8654b6fae0df

