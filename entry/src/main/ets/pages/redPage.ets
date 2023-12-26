// xxx.ets
import web_webview from '@ohos.web.webview';
import router from '@ohos.router';

@Entry
@Component
struct WebComponent {
  webviewController: web_webview.WebviewController = new web_webview.WebviewController();


  build() {
    Column() {
      Column() {
        Row() {
          Text("WEB端播放")
            .width("162.23vp")
            .height("60vp")
            .fontColor(Color.Black)
            .textAlign(TextAlign.Center)
            .fontSize("19fp")
            .onClick(() => {
                    try {
                      // 点击按钮时，通过loadUrl，跳转到www.example1.com
                      this.webviewController.loadUrl('https://www.bilibili.com/video/BV1uY41157HK/?spm_id_from=333.337.search-card.all.click');
                    } catch (error) {
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    }
                  })
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
      }
      Web({ src: 'https://www.bilibili.com/video/BV1uY41157HK/?spm_id_from=333.337.search-card.all.click', controller: this.webviewController})
      .width("100%")
      .height("100%")
    }
    .width("100%")
    .height("100%")
  }
}

