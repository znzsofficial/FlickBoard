require "import"
import {
  "android.app.*",
  "android.os.*",
  "android.widget.*",
  "android.view.*",
  "android.graphics.BitmapFactory",
  "android.graphics.drawable.ColorDrawable",
  "android.content.Intent",
  "android.content.pm.PackageManager",
  "android.media.MediaPlayer",
  "android.media.AudioManager",
  "androidx.appcompat.widget.LinearLayoutCompat",
  "com.google.android.material.card.MaterialCardView",
  "com.google.android.material.textview.MaterialTextView",
  "com.google.android.material.button.MaterialButton",
  "androidx.core.widget.NestedScrollView",
  "androidx.coordinatorlayout.widget.CoordinatorLayout",
  "com.google.android.material.appbar.AppBarLayout",
  "com.google.android.material.appbar.MaterialToolbar",
  "com.google.android.material.appbar.CollapsingToolbarLayout",
  "com.google.android.material.snackbar.Snackbar",
  "github.daisukiKaffuChino.utils.LuaThemeUtil",
}

--设置主题
activity.setTheme(R.style.Theme_ReOpenLua_Material3)
import"com.google.android.material.color.DynamicColors"
DynamicColors.applyIfAvailable(this)

--初始化颜色
--为了使深色主题效果正常，请不要使用硬编码颜色!
local themeUtil=LuaThemeUtil(this)
MDC_R=luajava.bindClass"com.google.android.material.R"
surfaceColor=themeUtil.getColorSurface()
--更多颜色分类 请查阅Material.io官方文档
backgroundc=themeUtil.getColorBackground()
surfaceVar=themeUtil.getColorSurfaceVariant()
titleColor=themeUtil.getTitleTextColor()
primaryc=themeUtil.getColorPrimary()
primarycVar=themeUtil.getColorPrimaryVariant()


function print(内容)
  local anchor=activity.findViewById(android.R.id.content)
  Snackbar.make(anchor, 内容, Snackbar.LENGTH_LONG).setAction("确定", View.OnClickListener{
    onClick=function(v)
    end
  }).show();
  --[[
  local anchor=activity.findViewById(android.R.id.content)
  Snackbar.make(anchor, 内容, Snackbar.LENGTH_LONG).show()
  --LENGTH_SHORT     2s
  --LENGTH_LONG      3.5s]]
end


import "layout"

--设置布局
activity.setContentView(loadlayout(layout))
--隐藏自带ActionBar
activity.getSupportActionBar().hide()
--配置状态栏颜色
local window = activity.getWindow()
window.setStatusBarColor(surfaceVar)
window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)
window.setNavigationBarColor(surfaceVar)


--动态申请所有权限
function ApplicationAuthority()
  local mAppPermissions = ArrayList()
  local mAppPermissionsTable = luajava.astable(activity.getPackageManager().getPackageInfo(activity.getPackageName(),PackageManager.GET_PERMISSIONS).requestedPermissions)
  for k,v in pairs(mAppPermissionsTable) do
    mAppPermissions.add(v)
  end
  local size = mAppPermissions.size()
  local mArray = mAppPermissions.toArray(String[size])
  activity.requestPermissions(mArray,0)
end

ApplicationAuthority()

--权限申请回调
onRequestPermissionsResult=function(r,p,g)
end



--横屏
--activity.setRequestedOrientation(0);


function playAudio(file,player)
  player = MediaPlayer()
  .reset()
  .setDataSource(activity.getLuaDir() .. "/res/"..file..".mp3")
  .prepare()
  .setOnPreparedListener({
    onPrepared=function()
      player.start()
    end
  })
  --.setOnCompletionListener(MediaPlayer.OnCompletionListener{    onCompletion=function()      player.release()  end})
  --内存回收
  collectgarbage("collect")
  --print(tostring(collectgarbage("count")))
end


collectgarbage("collect")

--下面是复用性为0的代码

sj0.onClick=function()
  playAudio(1,p1)
end
sj1.onClick=function()
  playAudio(2,p2)
end
sj2.onClick=function()
  playAudio(3,p3)
end
sj3.onClick=function()
  playAudio(4,p4)
end



sj10.onClick=function()
  playAudio(5,p5)
end
sj11.onClick=function()
  playAudio(6,p6)
end
sj12.onClick=function()
  playAudio(7,p7)
end
sj13.onClick=function()
  playAudio(8,p8)
end



sj20.onClick=function()
  playAudio(9,p9)
end
sj21.onClick=function()
  playAudio(10,p10)
end
sj22.onClick=function()
  playAudio(11,p11)
end
sj23.onClick=function()
  playAudio(12,p12)
end
