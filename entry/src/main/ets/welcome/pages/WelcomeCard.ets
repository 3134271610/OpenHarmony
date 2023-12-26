
@Entry
@Component
struct WelcomeCard {
  /*
   * The title.
   */
  readonly TITLE: string = 'Hello World';
  /*
   * The action type.
   */
  readonly ACTION_TYPE: string = 'router';
  /*
   * The ability name.
   */
  readonly ABILITY_NAME: string = 'EntryAbility';
  /*
   * The message.
   */
  readonly MESSAGE: string = 'add detail';
  /*
   * The width percentage setting.
   */
  readonly FULL_WIDTH_PERCENT: string = '100%';
  /*
   * The height percentage setting.
   */
  readonly FULL_HEIGHT_PERCENT: string = '100%';

  build() {
    Row() {
      Column() {
        Stack() {
          Image($r('app.media.kennf'))
            .width("100%")
            .height("100%")
            .borderColor("#5a2020")
            .opacity(0.54)
          Text("快订")
            .width("80vp")
            .height("60vp")
            .borderColor({ top: "#903c3c", bottom: "#195e80", left: "#195e80", right: "#195e80" })
            .fontColor("#3c71ec")
            .fontSize("31fp")
        }
      }
      .width(this.FULL_WIDTH_PERCENT)
    }
    .height(this.FULL_HEIGHT_PERCENT)
    .onClick(() => {
      postCardAction(this, {
        action: this.ACTION_TYPE,
        abilityName: this.ABILITY_NAME,
        params: {
        }
      });
    })
  }
}