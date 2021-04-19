# 滨江壹号
触摸屏版

## 编译命令
``
flutter build web --release --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://unpkg.zhimg.com/canvaskit-wasm/bin/
flutter build web --release --dart-define=FLUTTER_WEB_CANVASKIT_URL=./canvaskit-wasm/
https://cdn.jsdelivr.net/npm/howler@2.1.3/dist/howler.min.js
http://cdn.bootcss.com/jquery/3.3.1/jquery.min.js
http://res.wx.qq.com/open/js/jweixin-1.6.0.js
https://fonts.gstatic.com/s/roboto/v20/KFOmCnqEu92Fr1Me5WZLCzYlKw.ttf
https://fonts.googleapis.com/css2?family=Noto+Sans+JP

flutter build web --release --dart-define=FLUTTER_WEB_CANVASKIT_URL=./canvaskit-wasm/ --web-renderer canvaskit

NOTE: Flutter version 2.0.3 才不会存在卡顿现象
``