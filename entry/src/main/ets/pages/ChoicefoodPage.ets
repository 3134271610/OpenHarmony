import router from '@ohos.router'

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
struct ChoicefoodPage {
  @State message: string = 'Hello World'
  @State title:string='余额支付'
  @State user:string='admin'
  @State cityname:string=''
  @State qiwen:string=''
  @State tianqi:string=''
  private item:Array<Item> = [
    new Item('无锡肋排', $r('app.media.leipai'),'20'),
    new Item('飘香鱼片', $r('app.media.yupian'),'20'),
    new Item('红烧大肉', $r('app.media.darou'),'20'),
    new Item('红焖牛肉', $r('app.media.niurou'),'25'),
    new Item('葱烧鲈鱼', $r('app.media.luyu'),'35'),
    new Item('鱼香茄子', $r('app.media.qiezi'),'20'),
    new Item('酱猪手', $r('app.media.zhushou'),'30'),
    new Item('腌笃鲜', $r('app.media.yanduxian'),'25'),

  ]
  build() {
    Column() {
      Row() {
        Text("自选菜品详情")
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
      List() {
        ForEach(
          this.item,
          item => {
            ListItem(){
              Row({space:10}){
                Image(item.image)
                  .width(100)
                Column({space:5}){
                  Text(item.name)
                    .fontWeight(FontWeight.Bolder)
                  Text(item.price)
                    .fontColor('#F36')
                    .fontSize(18)

                }
              }
            }
          }
        )
      }
      .scrollBar(BarState.Auto)
      .width("100%")
      .height("96%")
    }
    .width("100%")
    .height("89%")
  }

}