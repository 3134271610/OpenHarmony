// ToDoListItem.ets
import { ToDo } from '../viewmodel/ToDo';

@Component
export struct ToDoListItem {
  @Link isEditMode: boolean
  @Link selectedItems: ToDo[]
  private toDoItem: ToDo;

  hasBeenSelected(): boolean {
    return this.selectedItems.indexOf(this.toDoItem) != -1
  }

  build() {
    Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
      Row({ space: 4 }) {
        Circle()
          .width(24)
          .height(24)
          .fill(Color.White)
          .borderWidth(3)
          .borderRadius(30)
          .borderColor('#ffdcdfdf')
          .margin({ right: 10 })

        Text(`${this.toDoItem.name}`)
          .maxLines(1)
          .fontSize(24)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .padding({ left: 12 })

      if (this.isEditMode) {
        Checkbox()
          .select(this.hasBeenSelected() ? true : false)
          .onChange((isSelected) => {
            if (isSelected) {
              this.selectedItems.push(this.toDoItem)
            } else {
              let index = this.selectedItems.indexOf(this.toDoItem)
              if (index != -1) {
                this.selectedItems.splice(index, 1)
              }
            }
          })
          .width(24)
          .height(24)
      }
    }
    .width('100%')
    .height(80)
    .padding({
      left: 16,
      right: 12,
      top: 4,
      bottom: 4
    })
    .borderRadius(24)
    .linearGradient({
      direction: GradientDirection.Right,
      colors: this.hasBeenSelected() ? [[0xffcdae, 0.0], [0xFfece2, 1.0]] : [[0xffffff, 0.0], [0xffffff, 1.0]]
    })
    .gesture(
      GestureGroup(GestureMode.Exclusive,
        LongPressGesture()
          .onAction(() => {
            if (!this.isEditMode) {
              this.isEditMode = true
              this.selectedItems.push(this.toDoItem)
            }
          })
      )
    )
  }
}