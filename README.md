# Web3Sounds 微波山之声

> 永久记录每一个人的声音。

## 产品简介

**名字：** Web3Sounds

根据谐音预取中文名：微波山之声🤔

**Web3Sounds 希望是一个 public goods ，开源公开，永久记录声音的工具。**

- **发声**：希望聚焦 Web3:// 协议构建「未来世界计算机」这一核心主题，记录这条赛博之路上每一个人的声音。
- **记录**：每一个人都可匿名在这里「上传」或「录制」自己的想记录的声音，可以是一个词、一句话、一段音乐等，关键在于是你内心想发出的声音。
- **同频**：我们希望你在这里也能找到你同频的声音，可能是向往、可能是追忆、可能是熟悉、可能是酸甜苦辣等，一切可由大家来创造，来定义。
- **接力**：我们希望这些声音被永久记录在区块链，以某种有趣的算法呈现到这个有趣的世界，像微波一样连接声音接力能量。

## 产品团队

发起者：[Oscar](https://github.com/luffythink) 主产品设计、[Derick](https://github.com/DerickIT) 主智能合约设计、[Cora](https://github.com/CHENFANGC) 主前端



![Web3Sounds](img/Web3Sounds_draft2.png)



## 产品进度

项目 idea 构思：[这里](https://github.com/IntensiveCoLearning/Web3-URL/discussions/153) ，大家头脑风暴，一起不断完善

- 产品开源开放：Web3Sounds Github Repo 
- 拆解产品功能框架，init project
- 产品撰写 User Journey ，设计 UI、UX
- 智能合约设计：已完成部分 [这里](https://candied-ocean-12a.notion.site/web3-audio-app-220f6e41181f4d5ea94a8dafb8ac2dab)
- 根据 UI 实现前端逻辑
- 完成初步 Demo


## 产品功能框架

目前 Demo 版极简功能：

1. **声音图景展示**
   - **网状图设计**：使用图形库（如 D3.js、Three.js 或 PixiJS）来实现声音的网状图。每个节点代表不同的声音，节点之间可能有连接线表示声音的关系或相似度。
   - **动态效果**：当用户访问页面时，图景随机生成，不同的布局和颜色搭配使得每次访问都形成独特的视觉体验。
     - 单个声音图标设计
     - 由声音图标构成一幅图景，或者围绕图景规律性分布
2. **声音记录功能**
   - **声音上传：** 实现声音的上传功能，上传的时候可以选择相关属性对声音进行描述。
   - **声音录制：** 实现声音的录制并上传功能，上传的时候可以选择相关属性对声音进行描述。
   - **声音存储：** 声音会根据相关属性存储在 EthStorage L2 里。
3. **声音播放功能**
   - **点击事件**：当用户点击某个节点时，播放与该节点相关联的声音。
   - **声音切换**：实现声音的淡入淡出效果，提高用户体验。
4. **互动功能**
   - **长按互动**：可以设计为长按某个节点后，弹出一个选项（如喜欢/不喜欢、收藏、分享等）。
   - **未来扩展**：考虑更丰富的互动形式，比如用户可以为声音打分、留言。

## 产品用户旅程

用户访问网站极简旅程：待完善
- HomePage ：
  - 一个由「声音图标」组成的声音图景
    - 默认： 随机 20 个声音，分布在这个图景上面
    - 点击：用户点击每一个块图标，可以听这个声音
    - 长按：可分享该声音
  - 声音图景下面
    - 上传声音——连接钱包(如 MetaMask )
    - 录制声音——连接钱包(如 MetaMask )
  - 网页尾部：
    - 永久记录每一个人的声音。
    - 连接声音，一起探索未来世界计算机。

- 上传声音 页面 ：
  - 注册/登录
    - 连接钱包，用户匿名注册/登录
    - 前端调用合约的注册/登录函数
    - 合约验证用户身份,返回结果

  - 上传音频文件
    - 用户在前端选择音频文件
    - 前端将文件上传到 EthStorage，获得文件哈希
    - 前端调用合约的上传函数，传入文件元数据和 EthStorage 哈希
    - 合约记录文件信息，与用户地址关联

  - 查看/管理音频列表
    - 前端调用合约获取用户的音频列表
    - 展示音频列表，包括播放、编辑、删除等操作
    - 投放到主页声音库里，由声音图景随机呈现

  - 播放音频
    - 用户点击播放按钮
    - 前端从合约获取文件的 EthStorage 哈希
    - 前端从 EthStorage 获取音频文件并播放

## 产品部署

前端框架、FlatDirectory contract，参考[这里](https://github.com/ethstorage/web3url-website/tree/master)：

待完善。

## 产品声明

本产品开源开放，每一个认同此产品愿景的小伙伴，都可以加入进来 Buidl it。

- **目前产品阶段：** 处于完成 Demo 阶段，基于 Web3:// 协议完成开发，巩固 Web3:// 知识，完成 [Web3URL 残酷共学](https://github.com/IntensiveCoLearning/Web3-URL)作业，希望能取得一个好成绩。
- **未来：** 希望能有更多人基于产品愿景一起推动完成「**产品的可持续**」建设。

## 

