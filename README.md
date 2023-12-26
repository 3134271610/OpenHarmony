#### 端云一体化开发在线文档：
https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/agc-harmonyos-clouddev-overview-0000001443209792-V3?catalogVersion=V3

# OpenHarmony 快订APP

## 一、简介

#### 1.样例效果

  快订app是基于企业内的订餐app，可以通过登录密码和手机号来查看企业每天的餐食情况。

- 服务卡片

![image-20231226120243784.png-w'700'](typora-user-images%2Fimage-20231226120243784.png)

- 登陆界面
![image-20231226120300963.png](typora-user-images%2Fimage-20231226120300963.png)

- 直接登录、手机号/邮箱登录
![image-20231226120459011.png](typora-user-images%2Fimage-20231226120459011.png)
![image-20231226120510715.png](typora-user-images%2Fimage-20231226120510715.png)
- 点餐首页
![image-20231226120705305.png](typora-user-images%2Fimage-20231226120705305.png)
![image-20231226151845375.png](typora-user-images%2Fimage-20231226151845375.png)
![image-20231226152359973.png](typora-user-images%2Fimage-20231226152359973.png)
![image-20231226152412034.png](typora-user-images%2Fimage-20231226152412034.png)
![image-20231226152425764.png](typora-user-images%2Fimage-20231226152425764.png)
![image-20231226152504382.png](typora-user-images%2Fimage-20231226152504382.png)
![image-20231226152518832.png](typora-user-images%2Fimage-20231226152518832.png)

- 支付界面
![image-20231226120730140.png](typora-user-images%2Fimage-20231226120730140.png)

- 通知
![image-20231226152557683.png](typora-user-images%2Fimage-20231226152557683.png)

- 我的
![image-20231226120754248.png](typora-user-images%2Fimage-20231226120754248.png)
![image-20231226152612753.png](typora-user-images%2Fimage-20231226152612753.png)
![image-20231226152623062.png](typora-user-images%2Fimage-20231226152623062.png)
#### 2.设计OpenHarmony技术特性

- Ark UI和高代码开发
- List、Web调用、本地视频播放、.mp4网络播放、Grid、弹窗等插件

#### 3.支持OpenHarmony版本

OpenHarmony 4.0

#### 4.支持开发板

- 润和

## 二、快速上手

#### 1.标准设备环境准备

- DevEco Studio安装

- 环境是否配置成功


#### 2.应用编译环境准备

- 下载DevEco Studio版本；[HUAWEI DevEco Studio和SDK下载和升级 | HarmonyOS开发者](https://developer.harmonyos.com/cn/develop/deveco-studio)
- 配置SDK
- DevEco Studio 点击File -> Open 导入本下面的代码工程DistributedOrder

#### 3.项目下载和导入

项目地址：

1）git下载

```
git clone https://gitee.com/fanzhijie123/harmonyfzj
```

2）项目导入

打开DevEco Studio,点击File->Open->下载路径/FA/DistributedOrder

#### 4.安装应用

- 配置应用签名信息，点击**File > Project Structure** > **Project > Signing Configs**界面勾选“**Automatically generate signing**”，等待自动签名完成即可，点击“**OK**”。如下图所示：

  !

- [安装应用](https://gitee.com/openharmony/docs/blob/update_master_0323/zh-cn/application-dev/quick-start/installing-openharmony-app.md)  识别到设备后点击!，或使用默认快捷键Shift+F10（macOS为Control+R)运行应用。

  ![运行]

- 如果IDE没有识别到设备就需要通过命令安装，如下

  打开**OpenHarmony SDK路径 \toolchains** 文件夹下，执行如下hdc_std命令，其中**path**为hap包所在绝对路径。

  ```text
  hdc_std install -r path\entry-default-signed.hap
  ```

- 体验分布式菜单时，需要两个开发板，连接同一个wifi或使用网线连接并配置同一网段IP地址，配置ip命令如下：

  ```
  hdc_std shell ifconfig eth0 192.168.1.111 netmask 255.255.255.0  hdc_std shell ifconfig eth0 192.168.1.222 netmask 255.255.255.0
  ```

**PS**应用开发快速上手请参考[这里](https://gitee.com/openharmony/docs/blob/OpenHarmony-3.2-Beta4/zh-cn/application-dev/quick-start/Readme-CN.md)

## 三、关键代码解读

#### 1.目录结构

```
├─ets
│  ├─common
│  │  └─constants
│  │          CommonConstants.ets
│  │          
│  ├─entryability
│  │      EntryAbility.ts//服务卡片
│  │      
│  ├─entryformability
│  │      EntryFormAbility.ts
│  │      
│  ├─model
│  │      VideoControll.ets
│  │      
│  ├─pages
│  │  │  Auth.ets
│  │  │  ChoicefoodPage.ets
│  │  │  CloudFunction.ets
│  │  │  CloudStorage.ets
│  │  │  CustomDialogExample.ets
│  │  │  Home.ets
│  │  │  Index.ets
│  │  │  JiankangPage.ets
│  │  │  Login.ets
│  │  │  LoginPage.ets
│  │  │  Phonereister.ets
│  │  │  redPage.ets
│  │  │  SimpleVideoIndex.ets
│  │  │  SimpleVideoPlay.ets
│  │  │  ToDoListItem.ets
│  │  │  Twopage.ets
│  │  │  BillPage.ets
│  │  │  WebvideoPage.ets
│  │  │  Welcome.ets
│  │  │  ZhujiaoPage.ets
│  │  │  
│  │  └─CloudDb
│  │          CloudDb.ets
│  │          DbInsert.ets
│  │          Post.ts
│  │          
│  ├─view
│  │      IndexModule.ets
│  │      IndexSwiper.ets
│  │      VideoPlayer.ets
│  │      VideoPlaySlider.ets
│  │      
│  ├─viewmodel
│  │      HorizontalVideoItem.ets
│  │      ParamItem.ets
│  │      SwiperVideoItem.ets
│  │      ToDo.ets
│  │      VideoData.ets
│  │      
│  └─welcome
│      └─pages
│              WelcomeCard.ets
│              
├─resources
│  ├─base
│  │  ├─element
│  │  │      color.json
│  │  │      float.json
│  │  │      font.json
│  │  │      string.json
│  │  │      
│  │  ├─media
│  │  │      1.png
│  │  │      2.jpg
│  │  │      3.jpg
│  │  │      banner1.png
│  │  │      banner2.png
│  │  │      banner3.png
│  │  │      BK_1.jpg
│  │  │      buy.png
│  │  │      darou.jpg
│  │  │      dumpling1.jpg
│  │  │      dumpling2.jpg
│  │  │      empty_image.png
│  │  │      feiniu1.jpg
│  │  │      feiniu2.jpg
│  │  │      food1.jpg
│  │  │      food2.jpg
│  │  │      food3.jpg
│  │  │      grey.jpg
│  │  │      home.png
│  │  │      huawie.png
│  │  │      icon.png
│  │  │      iconA.png
│  │  │      icon_add.png
│  │  │      icon_back.png
│  │  │      icon_cart.png
│  │  │      icon_clear.png
│  │  │      icon_member.png
│  │  │      icon_menu_bacon.png
│  │  │      icon_menu_chicken.png
│  │  │      icon_menu_crucian.png
│  │  │      icon_menu_fish.png
│  │  │      icon_menu_lotus.png
│  │  │      icon_menu_mutton.png
│  │  │      icon_menu_spareribs.png
│  │  │      icon_off.png
│  │  │      icon_reduce.png
│  │  │      icon_share.png
│  │  │      icon_success.png
│  │  │      icon_user.png
│  │  │      icon_user_another.png
│  │  │      ic_back.png
│  │  │      ic_pause.png
│  │  │      ic_play.png
│  │  │      ic_public_delete.png
│  │  │      ic_public_delete_filled.png
│  │  │      ic_public_delete_filled_red.png
│  │  │      ic_public_delete_outline_red.png
│  │  │      ic_public_edit.png
│  │  │      ic_public_edit_filled.png
│  │  │      ic_public_edit_outline.png
│  │  │      ic_public_play.png
│  │  │      ic_public_thumbsup.png
│  │  │      ic_public_thumbsup_filled.png
│  │  │      ic_public_time.png
│  │  │      kennf.png
│  │  │      leipai.jpg
│  │  │      LoginPage.ets
│  │  │      luyu.jpg
│  │  │      me.png
│  │  │      me2.png
│  │  │      meatdumpling.jpg
│  │  │      niurou.jpg
│  │  │      notice.png
│  │  │      preview.png
│  │  │      qiezi.jpg
│  │  │      qq.png
│  │  │      reshesh.png
│  │  │      sale.png
│  │  │      sela.jpg
│  │  │      startIcon.png
│  │  │      trash.png
│  │  │      user_dark.png
│  │  │      video_ad3.png
│  │  │      video_list0.png
│  │  │      video_list1.png
│  │  │      video_list2.png
│  │  │      weixin.png
│  │  │      window.png
│  │  │      yanduxian.jpg
│  │  │      yupian.jpg
│  │  │      zhushou.jpg
│  │  │      
│  │  └─profile
│  │          form_config.json
│  │          main_pages.json
│  │          
│  ├─en_US
│  │  └─element
│  │          string.json
│  │          
│  ├─rawfile
│  │      agconnect-services.json
│  │      sela.mp4
│  │      videoTest.mp4
│  │      yumizhurou.mp4
│  │      
│  └─zh_CN
│      └─element
│              string.json         
```

![输入图片说明](%E6%B5%81%E7%A8%8B%E5%9B%BE.png)
![输入图片说明](typora-user-images/%E8%AE%A2%E9%A4%90app.jpg)
#### 2.日志查看方法

```
hdc_std shell
hilog | grep ordering 
```

#### 3.关键代码

- Home.etc
- 各个视频的播放方式
- 页面跳转

## 四、如何从零开发分布式菜单

[从零开发分布式菜单](quick_develop.md)

华为Openharmony应用开发文档[应用开发导读 (openharmony.cn)](https://docs.openharmony.cn/pages/v4.0/zh-cn/application-dev/application-dev-guide.md/)

## 五、参考链接

- [OpenHarmony基于TS扩展的声明式开发范式](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/arkui-ts/Readme-CN.md)
- [OpenHarmony应用接口](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis/Readme-CN.md)
- [OpenHarmonyETS开发FAQ](https://gitee.com/Cruise2019/team_x/blob/master/homework/ets_quick_start/ETS%E5%BC%80%E5%8F%91FAQ.md)
- (https://docs.openharmony.cn/pages/v4.0/zh-cn/application-dev/application-dev-guide.md/)
