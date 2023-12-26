import router from '@ohos.router'
import { VideoPlayer } from '../pages/WebvideoPage'


@Entry
@Component
struct Twopage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Column() {
        Row() {
          Text("网络mp4播放")
            .width("162.23vp")
            .height("60vp")
            .fontColor(Color.Black)
            .textAlign(TextAlign.Center)
            .fontSize("19fp")
          Text("返回")
            .width("200vp")
            .height("60vp")
            .fontColor(Color.Black)
            .textAlign(TextAlign.Center)
            .fontSize("19fp")
            .onClick(()=>{
              router.replaceUrl({url:'pages/Home'})
            })
        }
        .width("360vp")
        .height("77.42vp")
        Row(){
          VideoPlayer(
          )
        }
          .width("100%")
          .height("20%")
        Row(){
          List(){
            ListItem(){
              Row(){
                Image($r('app.media.feiniu1'))
                  .width("50%")
                  .height("88vp")
                  .offset({ x: "0vp", y: "29.74vp" })
                Text("实拍图片")
                  .width("153.27vp")
                  .height("60vp")
                  .offset({ x: "-168vp", y: "-43.93vp" })
                  .fontColor(Color.Black)
                  .fontSize("18fp")
                Image($r('app.media.feiniu2'))
                  .width("50%")
                  .height("88vp")
                  .offset({ x: "-129.27vp", y: "29.74vp" })
              }
            }.width('100%')
            .height('30%')
            ListItem(){
              Row(){
                Image($r('app.media.feiniu1'))
                  .width("50%")
                  .height("88vp")
                  .offset({ x: "0vp", y: "29.74vp" })
                Text("实拍图片")
                  .width("153.27vp")
                  .height("60vp")
                  .offset({ x: "-168vp", y: "-43.93vp" })
                  .fontColor(Color.Black)
                  .fontSize("18fp")
                Image($r('app.media.feiniu2'))
                  .width("50%")
                  .height("88vp")
                  .offset({ x: "-129.27vp", y: "29.74vp" })
              }
            }.width('100%')
            .height('30%')
            // .backgroundColor(Color.Gray)
          }
          .divider({
            strokeWidth: 1,
            startMargin: 60,
            endMargin: 10,
            color: '#ffe9f0f0'
          })
          .width('100%')
          .height('100%')
        }.width('100%')
        .height('70%')
      }
      .width("100%")
      .height("100%")
    }
    .width("100%")
    .height("100%")
  }
}