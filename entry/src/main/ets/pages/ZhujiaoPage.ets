//ToDoList.ets
import router from '@ohos.router';
import { ToDo } from '../viewmodel/ToDo';
import { ToDoListItem } from './ToDoListItem';
@Entry
@Component
struct ZhujiaoPage {
  @State toDoData: ToDo[] = []
  @Watch('onEditModeChange') @State isEditMode: boolean = false
  @State selectedItems: ToDo[] = []

  private availableThings: string[] = ["香菜", "辣椒", "大蒜", "洋葱", "带皮猪脚", '米饭']

  saveData(value: string) {
    this.toDoData.push(new ToDo(value))
  }

  onEditModeChange() {
    if (!this.isEditMode) {
      this.selectedItems = []
    }
  }

  build() {
    Column() {
      Row() {
        if (this.isEditMode) {
          Text('X')
            .fontSize(20)
            .onClick(() => {
              this.isEditMode = false;
            })
            .margin({ left: 20, right: 20 })

          Text('已选择' + this.selectedItems.length + '项')
            .fontSize(24)
        } else {
          Button('返回')
            .width("65vp")
            .height("46.45vp")
            .margin({ left: 20, right: 20 })
            .fontColor(Color.White)
            .backgroundColor("#ff100b0b")
            .onClick(() => {
              router.replaceUrl({
                url: "pages/Home"
              });
            })
          Text('待办')
            .fontSize(36)
            .margin({ left: 30})

          Blank()
          Text('+')
            .fontWeight(FontWeight.Lighter)
            .fontSize(40)
            .margin({ right: 30 })
            .onClick(() => {
              TextPickerDialog.show({
                range: this.availableThings,
                onAccept: (value: TextPickerResult) => {
                  this.toDoData.push(new ToDo(this.availableThings[value.index]))
                  console.info('to do data: ' + JSON.stringify(this.toDoData))
                },
              })
            })
        }
      }
      .height('12%')
      .width('100%')

      List({ initialIndex: 0, space: 10 }) {
        ForEach(this.toDoData, toDoItem => {
          ListItem() {
            ToDoListItem({
              isEditMode: $isEditMode,
              toDoItem: toDoItem,
              selectedItems: $selectedItems
            })
          }.padding({ left: 24, right: 24, bottom: 12 })
        }, toDoItem => toDoItem.key)
      }
      .height('73%')
      .listDirection(Axis.Vertical)
      .edgeEffect(EdgeEffect.Spring)

      if (this.isEditMode) {
        Row() {
          Button('删除')
            .width('80%')
            .onClick(() => {
              let leftData = this.toDoData.filter((item) => {
                return this.selectedItems.find((selectedItem) => selectedItem != item)
              })
              console.log('leftData: ' + leftData);
              this.isEditMode = false;
              this.toDoData = leftData;
            })
            .backgroundColor('#ffd75d5d')
        }
        .height('15%')
      }
    }
    .backgroundColor('#fff1f3f5')
    .width('100%')
    .height('100%')
  }
}