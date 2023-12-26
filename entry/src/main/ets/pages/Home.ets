import http from '@ohos.net.http';
import web_webview from '@ohos.web.webview';
import { ResizeDirection } from '@ohos.UiTest';
import image from '@ohos.multimedia.image';
import { Response } from '@hw-agconnect/hmcore/src/main/ets/base/net/Response';
import router from '@ohos.router';
import Prompt from '@system.prompt';
import promptAction from '@ohos.promptAction';

// @ts-ignore
// import {CustomDialogExample} from './CustomDialogExample'
// let httpRequset = http.createHttp()

class Item {
  name: string
  image: ResourceStr
  price: string
  constructor(name: string, image: ResourceStr, price:string) {
    this.name = name
    // @ts-ignore
    this.image = image
    this.price = price
  }
}
@Entry
@Component
struct Home {
  @State message: string = 'Hello World'
  @State title:string='余额支付'
  @State user:string='admin'
  @State cityname:string=''
  @State qiwen:string=''
  @State tianqi:string=''
  // @State bud: Record<string, Function | void> = { 'cancel': this.onCancel(), 'confirm': this.onAccept() }
  // dialogController: CustomDialogController = new CustomDialogController({
  //   builder: CustomDialogExample(this.bud),
  // })
  //
  // onCancel() {
  //   console.info('Callback when the first button is clicked')
  // }
  //
  // onAccept() {
  //   console.info('Callback when the second button is clicked')
  // }

  private item:Array<Item> = [
    new Item('玉米猪肉水饺', $r('app.media.meatdumpling'),'30'),
    new Item('酸菜牛肉面', $r('app.media.food3'),'30'),

  ]

  // about_weather(){
  //   this.
  // }

  webviewController: web_webview.WebviewController = new web_webview.WebviewController();


  // webviewController: web_webview.WebviewController = new web_webview.WebviewController();
  build() {
    Column() {
      Column() {
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column() {
              Text("首页")
                .width("200vp")
                .height("32.12vp")
                .fontColor(Color.Black)
                .fontSize("25fp")
              Search({})
                .width("100%")
                .height("29.16vp")
              Swiper() {
                Image($r('app.media.food1'))
                  .width("100%")
                  .height("100%")
                Image($r('app.media.food2'))
                  .width("100%")
                  .height("100%")
                Image($r('app.media.food3'))
                  .width("100%")
                  .height("100%")
              }
              .width("100%")
              .height("30%")
              .autoPlay(true)
              // Row({ space: "-2vp" }) {
              //   Text("1212")
              //     .width("100vp")
              //     .height("100%")
              //     .fontColor(Color.Black)
              //     .fontSize("17fp")
              // }
              Row({ space: "-2vp" }) {
                Text("排行榜")
                  .width("80.81vp")
                  .height("100%")
                  .fontColor(Color.Black)
                  .fontSize("17fp")
              }
              .width("100%")
              .height("40vp")
              Row() {
                Text("序号")
                  .width("20%")
                  .height("100%")
                  .fontColor(Color.Black)
                  .fontSize("18fp")

                Text("菜品名称")
                  .width("30%")
                  .height("100%")
                  .offset({ x: "0vp", y: "0vp" })
                  .fontColor(Color.Black)
                  .fontSize("18fp")
                Text("价格")
                  .width("20%")
                  .height("100%")
                  .offset({ x: "0vp", y: "0vp" })
                  .fontColor(Color.Black)
                  .fontSize("18fp")
                Text("菜品介绍")
                  .width("20%")
                  .height("100%")
                  .offset({ x: "0vp", y: "0vp" })
                  .fontColor(Color.Black)
                  .fontSize("18fp")

              }
              .width("100%")
              .height("31.13vp")
              List() {
                ListItem() {
                  Row() {
                    Text("1")
                      .width("10%")
                      .height("100%")
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")

                    Text("玉米猪肉水饺")
                      .width("40%")
                      .height("100%")
                      // .offset({ x: "-10vp", y: "0vp" })
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")
                    Text("30")
                      .width("10%")
                      .height("100%")
                      // .offset({ x: "153.29vp", y: "0vp" })
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")
                    Button()
                      .width("20%")
                      .height("100%")
                      .offset({ x: "52.33vp", y: "-0.14vp" })
                      .backgroundColor("#854242")
                      .fontColor(Color.Blue)
                      .align(Alignment.End)
                      .type(ButtonType.Circle)
                      .stateEffect(true)
                      .onClick(() => {
                          router.replaceUrl({
                          url: "pages/SimpleVideoIndex"
                });
          })
                  }
                  .width("100%")
                  .height("100%")
                }
                .width("100%")
                .height("31.81vp")
                ListItem() {
                  Row() {
                    Text("2")
                      .width("10%")
                      .height("100%")
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")

                    Text("酸汤肥牛面")
                      .width("40%")
                      .height("100%")
                        // .offset({ x: "-10vp", y: "0vp" })
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")
                    Text("30")
                      .width("10%")
                      .height("100%")
                        // .offset({ x: "153.29vp", y: "0vp" })
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")
                    Button()
                      .width("50%")
                      .height("100%")
                        .offset({ x: "52.33vp", y: "-0.14vp" })
                      .backgroundColor("#854242")
                      .fontColor(Color.Blue)
                      .align(Alignment.End)
                      .type(ButtonType.Circle)
                      .stateEffect(true)
                      .onClick(() => {
                        router.replaceUrl({
                          url: "pages/Twopage"
                        });
                      })
                  }
                  .width("100%")
                  .height("100%")
                }
                .width("100%")
                .height("31.81vp")
                ListItem() {
                  Row() {
                    Text("3")
                      .width("10%")
                      .height("100%")
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")

                    Text("培根健康餐")
                      .width("40%")
                      .height("100%")
                        // .offset({ x: "-10vp", y: "0vp" })
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")
                    Text("30")
                      .width("10%")
                      .height("100%")
                        // .offset({ x: "153.29vp", y: "0vp" })
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")
                    Button()
                      .width("50%")
                      .height("100%")
                        .offset({ x: "52.33vp", y: "-0.14vp" })
                      .backgroundColor("#854242")
                      .fontColor(Color.Blue)
                      .align(Alignment.End)
                      .type(ButtonType.Circle)
                      .stateEffect(true)
                      .onClick(() => {
                        router.replaceUrl({
                          url: "pages/JiankangPage"
                        });
                      })
                  }
                  .width("100%")
                  .height("100%")
                }
                .width("100%")
                .height("31.81vp")
                ListItem() {
                  Row() {
                    Text("4")
                      .width("10%")
                      .height("100%")
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")

                    Text("红烧牛肉面")
                      .width("40%")
                      .height("100%")
                        // .offset({ x: "-10vp", y: "0vp" })
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")
                    Text("30")
                      .width("10%")
                      .height("100%")
                        // .offset({ x: "153.29vp", y: "0vp" })
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")
                    Button()
                      .width("50%")
                      .height("100%")
                        .offset({ x: "52.33vp", y: "-0.14vp" })
                      .backgroundColor("#854242")
                      .fontColor(Color.Blue)
                      .align(Alignment.End)
                      .type(ButtonType.Circle)
                      .stateEffect(true)
                      .onClick(() => {
                        router.replaceUrl({
                          url: "pages/redPage"
                        });
                      })
                  }
                  .width("100%")
                  .height("100%")
                }
                .width("100%")
                .height("31.81vp")
                ListItem() {
                  Row() {
                    Text("5")
                      .width("10%")
                      .height("100%")
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")

                    Text("隆江猪脚饭")
                      .width("40%")
                      .height("100%")
                        // .offset({ x: "-10vp", y: "0vp" })
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")
                    Text("30")
                      .width("10%")
                      .height("100%")
                        // .offset({ x: "153.29vp", y: "0vp" })
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")
                    Button()
                      .width("50%")
                      .height("100%")
                        .offset({ x: "52.33vp", y: "-0.14vp" })
                      .backgroundColor("#854242")
                      .fontColor(Color.Blue)
                      .align(Alignment.End)
                      .type(ButtonType.Circle)
                      .stateEffect(true)
                      .onClick(() => {
                        router.replaceUrl({
                          url: "pages/ZhujiaoPage"
                        });
                      })
                  }
                  .width("100%")
                  .height("100%")
                }
                .width("100%")
                .height("31.81vp")
                ListItem() {
                  Row() {
                    Text("6")
                      .width("10%")
                      .height("100%")
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")

                    Text("自选饭菜")
                      .width("40%")
                      .height("100%")
                        // .offset({ x: "-10vp", y: "0vp" })
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")
                    Text("30")
                      .width("10%")
                      .height("100%")
                        // .offset({ x: "153.29vp", y: "0vp" })
                      .fontColor(Color.Black)
                      .textAlign(TextAlign.Center)
                      .fontSize("15fp")
                    Button()
                      .width("50%")
                      .height("100%")
                        .offset({ x: "52.33vp", y: "-0.14vp" })
                      .backgroundColor("#854242")
                      .fontColor(Color.Blue)
                      .align(Alignment.End)
                      .type(ButtonType.Circle)
                      .stateEffect(true)
                      .onClick(() => {
                        router.replaceUrl({
                          url: "pages/ChoicefoodPage"
                        });
                      })
                  }
                  .width("100%")
                  .height("100%")
                }
                .width("100%")
                .height("31.81vp")



              }
              .width("100%")
              .height("43%")
            }
            .width("100%")
            .height("89%")
          }
          .offset({ x: "0vp", y: "0vp" })
          .tabBar({ icon: $r('app.media.kennf'), text: "点餐" })
          TabContent() {
            Column() {
              Text("支付")
                .width("200vp")
                .height("32.12vp")
                .fontColor(Color.Black)
                .fontSize("25fp")
              TextInput({placeholder:this.title}).height(66).margin({top:36,left:36,right:36})
              QRCode(this.message)
                .width(200)
                .height(200)
                .color(Color.Orange)
                .border({
                  width:4,
                  color:Color.Red,
                  style:BorderStyle.Dashed
                })
                .margin({top:36})
              Text('二维码付款')
                .fontSize(30)
                .fontWeight(FontWeight.Bolder)
              Row() {
                Column() {
                  Grid() {
                    GridItem() {
                      Button('支付宝')
                        .backgroundColor(Color.Blue)
                        .fontSize(40)
                        .onClick(() => {
                        })
                    }

                    GridItem() {
                      Button('微信')
                        .backgroundColor(Color.Red)
                        .fontSize(40)

                    }

                  }
                  .columnsTemplate('1fr 1fr ')

                }
                // Web({ src: 'https://www.bilibili.com/video/BV1uY41157HK/?spm_id_from=333.337.search-card.all.click', controller: this.webviewController})
                  .width("100%")
                  .height("100%")

              }

            }

            // Web({ src: 'www.example.com', controller: this.webviewController })
            .width("100%")
            .height("90%")

          }

          .tabBar({ icon: $r('app.media.buy'), text: "支付" })
          TabContent() {
            Column() {
              Text("通知")
                .width("200vp")
                .height("60vp")
                .fontColor(Color.Black)
                .fontSize("25fp")
              List() {
                ListItem() {
                  Row() {
                    Text("订餐规则")
                      .width("116.11vp")
                      .height("60vp")
                      .fontColor(Color.Black)
                      .fontSize("21fp")
                    Toggle({ type: ToggleType.Switch, isOn: false })

                      .onChange((isOn: boolean) => {
                        if(isOn) {
                          promptAction.showToast({ message: '订餐规则提醒开启.' })
                        } else {
                          promptAction.showToast({ message: '订餐规则提醒关闭.' })
                        }
                      })
                            .width("20%")
                            .height("50%")
                            .align(Alignment.Start)
                            .offset({ x: "590.73px", y: "-0.05px" })
                            .margin({ top: "0vp", bottom: "0vp", left: "0vp", right: "0vp" })
                      }
                  .width("100%")
                  .height("100%")
                }
                .width("100%")
                .height("56.19vp")
                ListItem() {
                  Row() {
                    Text("取餐提醒")
                      .width("116.11vp")
                      .height("60vp")
                      .fontColor(Color.Black)
                      .fontSize("21fp")
                    Toggle({ type: ToggleType.Switch, isOn: false })

                      .onChange((isOn: boolean) => {
                      if(isOn) {
                        promptAction.showToast({ message: '取餐提醒开启.' })
                      } else {
                        promptAction.showToast({ message: '取餐提醒关闭.' })
                      }
                    })
                      .width("20%")
                      .height("50%")
                      .align(Alignment.Start)
                      .offset({ x: "590.73px", y: "-0.05px" })
                      .margin({ top: "0vp", bottom: "0vp", left: "0vp", right: "0vp" })
                  }
                  .width("100%")
                  .height("100%")
                }
                .width("100%")
                .height("56.19vp")
                ListItem() {
                  Row() {
                    Text("消费与余额")
                      .width("116.11vp")
                      .height("60vp")
                      .fontColor(Color.Black)
                      .fontSize("21fp")
                    Toggle({ type: ToggleType.Switch, isOn: false })

                      .onChange((isOn: boolean) => {
                        if(isOn) {
                          promptAction.showToast({ message: '消费与余额提示开启.' })
                        } else {
                          promptAction.showToast({ message: '消费与余额提示关闭.' })
                        }
                      })

                      // .onClick(() => {
                      //   this.dialogController.open()
                      // })
                      .width("20%")
                      .height("50%")
                      .align(Alignment.Start)
                      .offset({ x: "590.73px", y: "-0.05px" })
                      .margin({ top: "0vp", bottom: "0vp", left: "0vp", right: "0vp" })
                  }
                  .width("100%")
                  .height("100%")
                }

                .width("100%")
                .height("54.73vp")
              }
              .width("100%")
              .height("96%")
            }
            .width("100%")
            .height("89%")
          }

          .tabBar({ icon: $r('app.media.notice'), text: "通知" })
          TabContent() {
            Column() {
              Text("我的餐厅")
                .width("200vp")
                .height("32.12vp")
                .fontColor(Color.Black)
                .fontSize("25fp")
              Column() {
                List() {
                  ListItem() {
                    Row() {
                      Image($r('app.media.me2'))
                        .width("14.87%")
                        .height("58.12%")
                      TextInput({placeholder:this.user+'@qq.com'})
                        .width("200vp")
                        .height("60vp")
                    }
                    .width("360vp")
                    .height("87.97vp")
                  }
                  .width("100%")
                  .height("87.01vp")
                  ListItem() {
                    Text("余额和账单")
                      .width("100%")
                      .height("100%")
                      .fontColor(Color.Black)
                      .fontSize("16fp")
                      .onClick(() => {
                        router.replaceUrl({
                          url: "pages/BillPage"
                        });
                      })
                  }
                  .width("100%")
                  .height("47.83vp")
                  .offset({ x: "0vp", y: "42.25vp" })
                  ListItem() {
                    Text("客服管理")
                      .width("100%")
                      .height("100%")
                      .fontColor(Color.Black)
                      .fontSize("17fp")
                  }
                  .width("100%")
                  .height("48.86vp")
                  .offset({ x: "0vp", y: "82.46vp" })
                }
                .width("100%")
                .height("100%")
              }
              .width("100%")
              .height("70%")
              Button("退出")
                .width("100vp")
                .height("10%")
                .backgroundColor("#181616")
                .onClick(() => {
                  router.replaceUrl({
                    url: "pages/LoginPage"
                  });
                })

            }
            .width("100%")
            .height("90%")
            .offset({ x: "0vp", y: "-4vp" })
          }
          .tabBar({ icon: $r('app.media.me'), text: "我的" })
        }
        .width("100%")
        .height("100%")
        .offset({ x: "0vp", y: "0vp" })
      }
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Center)
    }
    .width("100%")
    .height("100%")
  }
}
