import router from '@ohos.router'

@Entry
@Component
struct Welcome {
  @State message: string = 'Hello World'
  aboutToAppear(){
    setTimeout(function() {
      router.replaceUrl({
        url: 'pages/LoginPage'
      })
    },8000)
  }
  build() {
    Column() {
      Column() {

        Swiper() {
          Image($r('app.media.2'))
            .width("100%")
            .height("100%")
          Image($r('app.media.3'))
            .width("100%")
            .height("100%")
          Image($r('app.media.BK_1'))
            .width("100%")
            .height("100%")
        }        
        .width("100%")
        .height("100%")
        .autoPlay(true)
        .vertical(false)
      }      
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Center)
    }    
    .width("100%")
    .height("100%")
  }
}
