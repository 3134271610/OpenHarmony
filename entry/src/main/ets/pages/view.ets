// xxx.ets
import web_webview from '@ohos.web.webview'

@Entry
@Component
struct view{
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  ports: web_webview.WebMessagePort[];

  build() {
    Column() {
      Button('onMessageEvent')
        .onClick(() => {
          try {
            this.ports = this.controller.createWebMessagePorts();
            this.ports[1].onMessageEvent((msg) => {
              if (typeof(msg) == "string") {
                console.log("received string message from html5, string is:" + msg);
              } else if (typeof(msg) == "object") {
                if (msg instanceof ArrayBuffer) {
                  console.log("received arraybuffer from html5, length is:" + msg.byteLength);
                } else {
                  console.log("not support");
                }
              } else {
                console.log("not support");
              }
            })
          } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })
      Web({ src: 'www.baidu.com', controller: this.controller })
    }
  }
}
