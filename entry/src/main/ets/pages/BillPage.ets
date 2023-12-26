import router from '@ohos.router';
import web_webview from '@ohos.web.webview';


@Entry
@Component
struct BillPage {
  @State message: string = 'Hello World'
  webviewController: web_webview.WebviewController = new web_webview.WebviewController();


  build() {
    Column() {
      Column() {
        Row() {
          Text("支付宝")
            .width("110vp")
            .height("60vp")
            .fontColor(Color.Black)
            .textAlign(TextAlign.Center)
            .fontSize("19fp")
            .onClick(() => {
                try {
                  // 点击按钮时，通过loadUrl，跳转到www.example1.com
                  this.webviewController.loadUrl('https://www.alipay.com/index.html');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
              })
          Text("微信")
            .width("110vp")
            .height("60vp")
            .fontColor(Color.Black)
            .textAlign(TextAlign.Center)
            .fontSize("19fp")
            .onClick(() => {
              try {
                // 点击按钮时，通过loadUrl，跳转到www.example1.com
                this.webviewController.loadUrl('https://pay.weixin.qq.com/');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
            })
          Text("返回")
            .width("110vp")
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
      Web({ src: 'https://www.alipay.com/index.html', controller: this.webviewController})
        .width("100%")
        .height("100%")
    }
    .width("100%")
    .height("100%")
  }
}


