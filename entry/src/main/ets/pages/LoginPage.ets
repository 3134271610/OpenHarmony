import Prompt from '@system.prompt'
import router from '@ohos.router'
import { Login, AuthMode } from "@hw-agconnect/auth-component";
// import router from '@ohos.router';

@Entry
@Component
struct LoginPage {
  @State message: string = 'Hello World'
  @State user:string ="  "
  @State password:string ="  "
  build() {
    Column() {
      Column() {
        Text("登录")
          .width("200vp")
          .height("60vp")
          .offset({ x: "0vp", y: "-294.74vp" })
          .fontColor(Color.Black)
          .textAlign(TextAlign.Center)
          .fontSize("39fp")
        TextInput({ placeholder: "用户名：" })
          .width("213vp")
          .height("60vp")
          .onChange((value:string) => {
            this.user = value;
          })
          .offset({ x: "10.41vp", y: "-224.39vp" })
        TextInput({ placeholder: "密码：" })
          .width("200vp")
          .height("60vp")
          .type(InputType.Password)
          .onChange((value:string) => {
            this.password = value;
          })
          .offset({ x: "8.59vp", y: "-214.24vp" })
        // Row() {
        //   Text("短信验证码登录")
        //     .width("200vp")
        //     .height("60vp")
        //     .fontColor(Color.Black)
        //     .fontSize("16fp")
        //   Text("忘记密码")
        //     .width("60.5vp")
        //     .height("60vp")
        //     .offset({ x: "74.18vp", y: "1.83vp" })
        //     .fontColor(Color.Black)
        //     .fontSize("15fp")
        // }
        // .width("356.56vp")
        // .height("64.33vp")
        // .offset({ x: "6.27vp", y: "-164.29vp" })
        Button("登  录")
          .width("180vp")
          .height("80vp")
          .onClick(() => {
            if (this.user == '' || this.password == '') {
              Prompt.showToast({
                message: '用户名和密码不能为空!',
                duration: 4000
              });
            }else{
              if(this.user != 'admin' || this.password != 'admin') {
                Prompt.showToast({
                  message: '用户名和密码错误!',
                  duration: 4000
                });
              }else{
                router.replaceUrl({
                  url: "pages/Home"
                });
              }
            }

          })
          .offset({ x: "0vp", y: "-122.17vp" })
          .fontColor(Color.White)
        // Login({
        //   modes: [AuthMode.PASSWORD, AuthMode.PHONE_VERIFY_CODE],
        //   onSuccess: (user) => {
        //     router.pushUrl({ url: "pages/Home", params: { user: user } });
        //   },
        //   onError: (err) => {
        //     console.error('error: ', err && err.message);
        //   }
        // }) {
        //   Button('login')
        //     .width("180vp")
        //     .height("80vp")
        //     .offset({ x: "0vp", y: "-115.58vp" })
        //     .fontColor(Color.White)
        //     .align(Alignment.Center);
        // }
        Button("注册")
          .width("180vp")
          .height("80vp")
          .offset({ x: "0vp", y: "-115.58vp" })
          .fontColor(Color.White)
          .onClick(() => {
            router.replaceUrl({
              url: "pages/Phonereister"
            });
          })
        Row() {
          Image($r('app.media.huawie'))
            .width("50.11vp")
            .height("52.59vp")
            .offset({ x: "20.97vp", y: "9.81vp" })

          Image($r('app.media.weixin'))
            .width("53.83vp")
            .height("53.83vp")
            .offset({ x: "230.09vp", y: "9.17vp" })
          Image($r('app.media.qq'))
            .width("64.99vp")
            .height("62.51vp")
            .offset({ x: "43.39vp", y: "11.09vp" })
        }
        .width("360vp")
        .height("85vp")
        .offset({ x: "-3.69vp", y: "-91.95vp" })
      }
      .width("100%")
      .height("100%")
      .offset({ x: "-3.63vp", y: "189.25vp" })
      .justifyContent(FlexAlign.Center)
    }
    .width("100%")
    .height("100%")
    .backgroundImage($r('app.media.1'))
    .backgroundImageSize(ImageSize.Cover)
  }
}