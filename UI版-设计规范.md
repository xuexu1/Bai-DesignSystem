# UI版-设计规范

> 目的：接入UI高保真资源，让AI调用项目资源，未来可实现与程序联动

# 1.基础规范

#### 1.1 字体&字号

| 字体名 | 字号 | 字体 | 字重 | 使用场景 |
| --- | --- | --- | --- | --- |
| head | 44px | inter | Medium | 标题文本，常用于界面标题、弹窗标题 |
| tab | 34px | inter | Medium | 页签文字 |
| content | 34px | inter | Regular | 内容文本，常用于卡片正文、规则弹窗内容、按钮文字 |
| explain | 28px | inter | Regular | 游戏内最小字号，常用玉货币栏数值，道具名称，文本提示，辅助说明文本等 |

#### 1.2 颜色

###### 底板色

| 颜色名 | 色值\-暗色模式 | 颜色描述 |
| --- | --- | --- |
| panel-bg | #333131 | 界面容器背景色 |
| panel-1 | #2A2A2B，透明度20% | 1层容器，在背景之上的容器底板色 |
| panel-2 | #101010，透明度20% | 2层容器，在1层容器之上的容器底板色 |
| panel-3 | #101010，透明度30% | 3层容器，在弹窗上的容器底板 |
| pop-mask | #000000，透明度80% | 弹窗蒙版 |
| pop\_content | #FFFFFF，透明度30% | 弹窗内容底板色 |

###### 字体色

| 颜色名 | 色值\-暗色模式 | 色值\-亮色模式 | 颜色描述 |
| --- | --- | --- | --- |
| title | #FFF9DA | #935515 | 界面标题、弹窗标题 |
| content | #BAAB8A | #935515 | 页签字色、内容文本 |
| explain | #BAAB8A，透明度50% | #935515，透明度50% | 备注说明文本色 |
| select | #FFF9DA | #C86600 | 界面页签选中字色 |
| primary-text | #BAAB8A | #4B2323 | 1级，主按键文本色 |
| secondly-text | #BAAB8A | #4B2323 | 2级，次级按键文本色 |
| disable | #717171 | #424242 | 按键不可使用文本字色 |

备注说明：1)暗色模式：底板为暗色， 2)亮色模式：底板为亮色。

本游戏内所有界面背景底板为暗色的，所有弹窗底板为亮色的。因此为了保证辨识度，（如无特殊标注）在界面上使用暗色模式的色值，在弹窗上使用亮色模式色值。

###### 功能色

| 颜色名 | 颜色-暗色模式 | 颜色描述 |
| --- | --- | --- |
| special-green | #3FC371 | 增益，加成类数字 |
| special-red | #FD8A8A | 负面，消耗不足，警告 |
| special-yellow | #FCCE5F | 信息强调字色，可点击文本按键 |

#### 1.3 尺寸

###### 界面尺寸

| 分类名称 | 尺寸 | 使用说明 |
| --- | --- | --- |
| nrw | 1920px\*1080px | 窄屏适配，PC适配 |
| wid | 2400px\*1080px | 宽屏适配，手机适配 |

###### 弹窗尺寸

| 分类 | 尺寸 | 使用说明 |
| --- | --- | --- |
| pop\_midium | 1290px\*742px | 常用于规则说明、道具兑换、道具使用弹窗 |
| pop\_small | 994px\*604px | 纯文本的二次确认弹窗 |

###### 按键尺寸

| 分类名称 | 尺寸 | 使用说明 |
| --- | --- | --- |
| primary | 高80px，宽度320px | 1级-主按键 |
| secondary | 高80px，宽度320px | 2级-次级按键 |
| third | 高64px，宽度180px | 3级-辅助按键 |

###### 页签尺寸

| 分类名称 | 尺寸 | 使用说明 |
| --- | --- | --- |
| tab1 | 高度124px；宽度220px | 1级页签，界面的1级分类导航 |
| tab2 | 高度96px；宽度220px | 2级页签，在1级页签下的2级细分导航 |

######  图标尺寸 

| 分类 | 尺寸 | 使用说明 |
| --- | --- | --- |
| item-coin | 44px\*44px | 在货币栏上出现的货币图标尺寸 |
| item-medium-110 | 110px\*110px | 游戏内常规道具尺寸 |
| item-medium-156 | 156px\*156px | 在商城、背包、道具获取时显示尺寸 |

###### 头像尺寸

| 分类 | 尺寸 | 使用说明 |
| --- | --- | --- |
| ava-item-90 | 90px\*90px | 玩家头像尺寸，头像样式为方形 |
| hero-item-110 | 110px\*110px | 游戏英雄、角色头像 |

# 2 全局布局要求

资源调用链接地址：[Figma](https://www.figma.com/design/XXFSnWpG7kd2xjXngvJaZG/%E8%AE%BE%E8%AE%A1%E7%B3%BB%E7%BB%9F?node-id=0-1&t=Jr4JrlFY4igH8QTe-1)

#### 2.1 界面

基础组件：界面背景、返回按键、标题文本、规则按键、货币栏

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/579fcdae-f5a1-4bcf-b4df-4848f7ee5029.png)

| 样式 | Figma中组件名称 | 界面位置 | 适配规则 | 交互说明 |
| --- | --- | --- | --- | --- |
| ![common-game-bg.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/e99c2ab3-04eb-468b-995e-6e034b9b2663.png) | com-game-bg | x=0, y=0 | 宽度:Fill container 高度:Fill container | 界面背景 |
| ![common-btn-back.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/8dcc9cb3-7ec1-478d-a450-d91e0c5ef0ee.png) | com-btn-back | x=20, y=20 | 与屏幕左侧和上方固定距离 | 界面返回按键，点击后可回到上一层界面 |
| ![dialog-head.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/b0ddf243-e411-47e7-8b1f-3bb534932121.png) | page-head | x=在返回按键右侧固定0px处, y=20px | 与屏幕左侧和上方固定距离 | 界面标题文本，支持配置，将界面标题填入文本text-head中 |
| ![common-btn-rule.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/f00a3183-d8dc-48d0-b77b-bc9b1183528c.png) | com-btn-rule | x=在标题文本后方0px处, y=20px | 与屏幕左侧和上方固定距离 | 规则按键，点击后弹出规则弹窗，可滑动查看规则详情 |
| ![coin_bar.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/55cbe566-2398-4f3b-93e2-f342569d9f18.png) | coin\_bar | x=1975-220(n-1),y=20（n=货币栏显示数量） | 与屏幕右侧和上方固定距离 | 货币栏的显示和隐藏可配置；<br>点击道具图标可查看道具详情tip；<br>货币右侧的“+”为货币获取途径，支持配置控制显示或隐藏；点击可“+”可跳转到对应获取路径，获取路径支持配置 |

#### 2.2 弹窗

2级弹窗，基础组件：关闭按键、标题文本、规则按键、货币栏

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/7f5ede6f-bd4b-41f3-9249-71ae3342893b.png)

| 样式 | Figma中组件名称 | 位置 | 适配方式 | 交互说明 |
| --- | --- | --- | --- | --- |
| ![Windows_midium.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/af7a2622-d5fd-495c-99d8-e37019aab9fe.png) | com-pop-midium-bg | x=315；y=169 | 居中适配 | 2级弹窗，没有分类的内容承载。 |
| ![dialog-head.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/b0ddf243-e411-47e7-8b1f-3bb534932121.png) | page-head | x=343；y=190 | 居中适配 | 弹窗标题，将弹窗标题填入文本text-head中 |
| ![btn-windows-close.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/9fba3701-b473-436c-b399-2f600580153c.png) | com-btn-close | 当弹窗为2级时位置x=1605；y=180 | 居中适配 | 弹窗的关闭按键 |
|  | pop-m-content | x=376；y=310 | 居中适配 | 弹窗内容区域，内容尺寸1168\*558当内容超出内容区域时，支持上下滑动查看 |

3级弹窗，基础组件：关闭按键、标题文本

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/8f829d03-5772-4ce9-85f3-601f6ead48f4.png)

| 样式 | Figma中组件名称 | 位置 | 适配方式 | 交互说明 |
| --- | --- | --- | --- | --- |
| ![Windows_small.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/3fa66b17-5a46-4072-af21-79c00a196668.png) | com-pop-small-bg | x=463；y=238 | 居中适配 | 3级弹窗，纯文本+二次确认按键承载。 |
| ![Com_BtnCom_2j_Yellow 2.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/2e471a81-e580-4f75-8455-1f52fc5d75ba.png) | Com\_BtnCom\_2j\_Yellow 1 | x=1023；y=92 | 居中适配 | 1级按键，确认按键 |
| ![Com_BtnCom_2j_Blue 1.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/0b73d622-e370-4980-b582-96ce5ff08675.png) | Com\_BtnCom\_2j\_Blue 1 | x=617；y=712 | 居中适配 | 2级按键，点击关闭弹窗 |
| ![dialog-head.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/b0ddf243-e411-47e7-8b1f-3bb534932121.png) | page-head | x=507；y=276 | 居中适配 | 标题文本，将弹窗标题填入文本text-head中 |
|  | pop-s-content | x=518；y=379 | 居中适配 | 弹窗内容区域，内容尺寸886\*310，内容文本上下居中适配 |

#### 2.3 页签

###### 状态

页签有2个状态

| 分类 | 状态命名 |
| --- | --- |
| 常态 | nml |
| 选中态 | sel |
| 未解锁 | lock |

###### 组件调用

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/1318e2f1-a8bd-484f-bd58-ab5aa568a8e2.png)

| 样式 | Figma中组件名称 | 位置 | 适配规则 | 使用说明 |
| --- | --- | --- | --- | --- |
| ![Property 1=sel.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/bb302566-b2e0-48a2-9e08-46628708ddcd.png) | tab1-sel | x=0, y=124+(n-1)\*124(n=页签数) | 与屏幕左侧和上方固定距离，当页签数超过屏幕高度时，可上下滑动 | 纵向排列的1级页签，选中态 |
| ![Property 1=nml.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/e31d16f0-2580-4225-95b8-cc69c4b0d918.png) | tab1-nml |  |  | 纵向排列的1级页签，常态 |
| ![Property 1=sel.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/f8e2bb05-c488-42d9-947a-b27de971cea6.png) | tab2-sel | x=220+(n-1)\*220(n=页签数), y=120 | 与屏幕左侧和上方固定距离，当页签数超过屏幕高度时，可左右滑动 | 横向排列的2级页签，选中态 |
| ![Property 1=nml.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/adab6c63-31c5-4adc-a43c-3fe59736cfd8.png) | tab2-nml |  |  | 横向排列的2级页签，常态 |

###### 使用判定

读取《需求文档》后，识别当前界面需要展示的信息是否存在分类，以及分类的层级数。 根据层级数自动决策： 层级 = 1（仅一级分类）： 自动调用 Tab1-Bar/{N}tab，N = 分类数量。 不调用 Tab2-Bar。 示例：排行榜界面，分“成就榜、荣誉榜、积分榜”3个一级分类。 层级 = 2（一级分类下含二级分类）： 自动调用 Tab1-Bar/{N1}tab，N1 = 一级分类数量。 默认显示第一个一级分类，并自动调用 Tab2-Bar/{N2}tab，N2 = 该一级分类下的二级分类数量。 用户切换一级页签时，二级页签和内容区联动刷新。 示例：商城界面，一级分类为“皮肤、英雄、道具”，其中“皮肤”下含二级分类“传说、史诗、稀有”。 层级 > 2（信息分类超过两层）： 不生成三层页签。 自动将当前界面拆分为“入口界面 + 详情界面”的组合。 入口界面展示前两层分类（用一级+二级页签承载），第三层分类作为列表项展示在内容区，点击后跳转到新的详情界面。 例外情况： 若策划文档中无任何分类信息 → 不调用任何页签组件，内容区直接占满。

#### 2.4 按键

###### 状态

| 分类 | 状态命名 |
| --- | --- |
| 常态 | nml |
| 可领取 | rcv |
| 已领取 | got |
| 不可点击状态 | disable |

###### 组件调用

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/14f4a843-6308-4f08-8bb1-dc8c402bc63e.png)

| 样式 | Figma中组件名称 | 适配方式 | 交互说明 |
| --- | --- | --- | --- |
| ![Com_BtnCom_2j_Yellow 2.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/2e471a81-e580-4f75-8455-1f52fc5d75ba.png) | Com\_BtnCom\_2j\_Yellow 1 | 居中适配 | 1级按键，确认按键，可领取状态 |
| ![Com_BtnCom_2j_Blue 1.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/0b73d622-e370-4980-b582-96ce5ff08675.png) | Com\_BtnCom\_2j\_Blue 1 | 居中适配 | 2级按键，点击关闭弹窗 |
| ![Com_BtnCom_2j_gray 1.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/3669e72b-fbc4-45e3-bbb8-99a997b19419.png) | Com\_BtnCom\_2j\_gray 1 | 居中适配 | 1级按键，置灰状态，点击给与引导提示 |
| ![Com_BtnCom_2j_dis 1.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/1d31d579-ec30-41a9-818f-aedd4e90103d.png) |  |  | 1级按键，不可点击状态，纯文本显示 |

操作按键不固定位置，根据需求使用。优先分布在屏幕的下侧半部分，右侧优于左侧（便于手操作）

###### 使用判定

1.  1级按键可独立使用，当需要一个高于2级别按键的存在时，1级按键和2级按键组合可使用
    
2.  当1级按键和2级按键同时存在时，1级按键永远在2级按键的右侧，两个按键之间间隙为24px
    
3.  整个界面可以有多个2级或者3级按键，但只会有1个1级主按键。
    
4.  1级按键、2级按键、3级按键都可独立使用。独立使用时，优先使用2级按键，只有当需要特别强调的重要按键（例如购买按键、玩法开启等，或需求文档中明确指明需要时），独立使用1级按键。
    
5.  在任务设计中，同样可将1级按键作为可领取状态，2级按键作为前往按键。
    

#### 2.3 道具

###### 状态

| 分类 | 状态命名 |
| --- | --- |
| 常态 | nml |
| 选中态 | sel |
| 可领取 | act |
| 已领取 | got |
| 锁状态 | lock |

###### 组件调用

| 样式 | Figma中组件名称 | 组件变量-道具数目 | 交互说明 |
| --- | --- | --- | --- |
| ![item-medium-110.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/5eddb1a2-852f-4f92-bec1-9f8d3f642938.png) | item-medium-110 | item-number | 包含道具数量（右下角） |

##### 图标资源

| 样式 | 资源名称 | 交互说明 |
| --- | --- | --- |
| ![Property 1=box1.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/cb0c5412-cf97-4a55-9218-869928cb7947.png) | items\_icon\_baoxiang | 配置资源 |
| ![Property 1=libao.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/Mp7ld7bvDgkRpOBQ/img/8b5a53ee-f13f-4e35-b4fb-d9545a6d1d3e.png) | items\_icon\_putongkabei\_hong 1 | 配置资源 |