import router from '@ohos.router';

@Entry


@Component
export struct JiankangPage{
  private controller:VideoController;
  private previewUris: Resource = $r ('app.media.sela');
  private innerResource: Resource = $rawfile('sela.mp4');
  build(){
    Column() {
      Row() {
        Text("本地播放播放")
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

      Row() {
        Video({
          src: this.innerResource,
          previewUri: this.previewUris,
          controller: this.controller
        })
      }
    .width("100%")
    .height("20%")
    }
  }
}
