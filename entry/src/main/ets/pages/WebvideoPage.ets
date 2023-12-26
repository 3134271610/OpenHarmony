@Entry
@Component
export struct VideoPlayer{
  private controller:VideoController;
  private previewUris: Resource = $r ('app.media.preview');
  private videosrc: string= 'http://vjs.zencdn.net/v/oceans.mp4' // 使用时请替换为实际视频加载网址
  build(){
    Column() {
      Video({
        src: this.videosrc,
        previewUri: this.previewUris,
        controller: this.controller
      })
    }
  }
}
