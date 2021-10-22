require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.net.Uri"
import "android.content.Intent"
import "android.view.WindowManager"
import "android.app.AlertDialog"
import "com.androlua.LuaDialog"
import "android.view.View"
import "com.nirenr.Color"
import "android.graphics.Color"
import "android.text.InputType"
import "android.text.method.DigitsKeyListener"
import "android.R$id"
import "android.media.MediaPlayer"
import "android.media.AudioManager"
import "android.R$drawable"
import "android.graphics.drawable.GradientDrawable"
import "android.R$layout"
import "android.content.Context"
import "java.io.File"
import "android.graphics.Typeface"
import "layout"
import "anime"
activity.setTheme(android.R.style.Theme_Material_Light_NoActionBar)
activity.setContentView(loadlayout(layout))

--横屏
activity.setRequestedOrientation(0);


--状态栏沉浸透明
import "android.graphics.Color"
local window=this.getWindow()
window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
window.setStatusBarColor(Color.TRANSPARENT)

this.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)

function 播放(控件名,链接)
  控件名 = MediaPlayer()
  控件名.reset()
  控件名.setDataSource(链接)
  控件名.prepare()
  控件名.start()
  --内存回收
  collectgarbage("collect")
end


function 震(时长)
  activity.getSystemService(Context.VIBRATOR_SERVICE).vibrate(long{0,时长},-1)
end

function 震动()
  if File("/data/data/"..activity.getPackageName().."/st0").exists() then
  end
  if File("/data/data/"..activity.getPackageName().."/st1").exists() then
    震(6)
  end
  if File("/data/data/"..activity.getPackageName().."/st2").exists() then
    震(14)
  end
  if File("/data/data/"..activity.getPackageName().."/st3").exists() then
    震(18)
  end
end


function 波纹特效v2(颜色)
  import"android.content.res.ColorStateList"
  return activity.Resources.getDrawable(activity.obtainStyledAttributes({android.R.attr.selectableItemBackground--[[Borderless]]}).getResourceId(0,0))
  .setColor(ColorStateList(int[0]
  .class{int{}},int{颜色 or 0x20000000}))
end


--勉强适配暗色模式
function isNightMode()
  local configuration = activity.getResources().getConfiguration();
  return configuration.uiMode+1==configuration.UI_MODE_NIGHT_YES or configuration.uiMode-1==configuration.UI_MODE_NIGHT_YES or configuration.uiMode==configuration.UI_MODE_NIGHT_YES
end
if isNightMode() then
  import "android.graphics.drawable.ColorDrawable"
  back.setBackgroundDrawable(ColorDrawable(0xff505050))
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFF505050)
 else
  import "android.graphics.drawable.ColorDrawable"
  back.setBackgroundDrawable(ColorDrawable(0xffFafafa))
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFFFafafa)
end


function 提示(内容)
  junyang=
  {
    LinearLayout;
    id="toastb";
    {
      CardView;--卡片控件
      layout_margin='';--卡片边距
      layout_gravity='horizontal';--重力属性
      layout_marginBottom='10dp';--布局底距
      elevation='5dp';--阴影属性
      layout_width='wrap';--卡片宽度
      CardBackgroundColor='#FF36373C';--卡片背景颜色
      layout_height='wrap';--卡片高度
      radius='20dp';--卡片圆角
      {
        TextView;--文字控件
        background="#ff36373C";--背景颜色
        padding="8dp";
        textSize="15sp";--文字大小
        TextColor="#ffffffff";--文字颜色
        layout_width="fill";--卡片宽度
        layout_height="fill";--卡片高度
        gravity="center";--重力
        text="提示出错";--显示文字
        id="text_ts";
      };
    };
  };
  local toast=Toast.makeText(activity,"内容",Toast.LENGTH_SHORT).setView(loadlayout(junyang))
  toast.setGravity(Gravity.BOTTOM,0, 0)
  text_ts.Text=tostring(内容)
  toast.show()
end


退出=0
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if 退出+2 > tonumber(os.time()) then
      activity.finish()--退出页面
     else
      提示"双击返回键退出"
      退出=tonumber(os.time())
    end
    return true
  end
end

function CircleButton(view,radiu,InsideColor,半圆)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(InsideColor)
  drawable.setCornerRadii({半圆,radiu,半圆,radiu,radiu,radiu,radiu,radiu});
  view.setBackgroundDrawable(drawable)
end

--下面是复用性为0的代码

sj0.onClick=function()
  震动()
  播放(m0,activity.getLuaDir() .. "/1.mp3")
end
sj1.onClick=function()
  震动()
  播放(m1,activity.getLuaDir() .. "/2.mp3")
end
sj2.onClick=function()
  震动()
  播放(m2,activity.getLuaDir() .. "/3.mp3")
end
sj3.onClick=function()
  震动()
  播放(m3,activity.getLuaDir() .. "/4.mp3")
end





sj10.onClick=function()
  震动()
  播放(m10,activity.getLuaDir() .. "/5.mp3")
end
sj11.onClick=function()
  震动()
  播放(m11,activity.getLuaDir() .. "/6.mp3")
end
sj12.onClick=function()
  震动()
  播放(m12,activity.getLuaDir() .. "/7.mp3")
end
sj13.onClick=function()
  震动()
  播放(m13,activity.getLuaDir() .. "/8.mp3")
end





sj20.onClick=function()
  震动()
  播放(m20,activity.getLuaDir() .. "/9.mp3")
end
sj21.onClick=function()
  震动()
  播放(m21,activity.getLuaDir() .. "/10.mp3")
end
sj22.onClick=function()
  震动()
  播放(m22,activity.getLuaDir() .. "/11.mp3")
end
sj23.onClick=function()
  震动()
  播放(m23,activity.getLuaDir() .. "/12.mp3")
end





mb1.onClick=function()
  File("/data/data/"..activity.getPackageName().."/st0").mkdirs()
  os.execute("rm -r /data/data/"..activity.getPackageName().."/st1")
  os.execute("rm -r /data/data/"..activity.getPackageName().."/st2")
  os.execute("rm -r /data/data/"..activity.getPackageName().."/st3")
end


mb2.onClick=function()
  activity.getSystemService(Context.VIBRATOR_SERVICE).vibrate(long{0,10},-1)
  File("/data/data/"..activity.getPackageName().."/st1").mkdirs()
  os.execute("rm -r /data/data/"..activity.getPackageName().."/st0")
  os.execute("rm -r /data/data/"..activity.getPackageName().."/st2")
  os.execute("rm -r /data/data/"..activity.getPackageName().."/st3")
end



mb3.onClick=function()
  activity.getSystemService(Context.VIBRATOR_SERVICE).vibrate(long{0,20},-1)
  File("/data/data/"..activity.getPackageName().."/st2").mkdirs()
  os.execute("rm -r /data/data/"..activity.getPackageName().."/st0")
  os.execute("rm -r /data/data/"..activity.getPackageName().."/st1")
  os.execute("rm -r /data/data/"..activity.getPackageName().."/st3")
end



mb4.onClick=function()
  activity.getSystemService(Context.VIBRATOR_SERVICE).vibrate(long{0,50},-1)
  File("/data/data/"..activity.getPackageName().."/st3").mkdirs()
  os.execute("rm -r /data/data/"..activity.getPackageName().."/st0")
  os.execute("rm -r /data/data/"..activity.getPackageName().."/st1")
  os.execute("rm -r /data/data/"..activity.getPackageName().."/st2")
end


sj0.foreground=波纹特效v2(0x2FFFFFFF)
sj2.foreground=波纹特效v2(0x2FFFFFFF)
sj11.foreground=波纹特效v2(0x2FFFFFFF)
sj13.foreground=波纹特效v2(0x2FFFFFFF)
sj20.foreground=波纹特效v2(0x2FFFFFFF)
sj22.foreground=波纹特效v2(0x2FFFFFFF)
sj1.foreground=波纹特效v2(0x2F000000)
sj3.foreground=波纹特效v2(0x2F000000)
sj10.foreground=波纹特效v2(0x2F000000)
sj12.foreground=波纹特效v2(0x2F000000)
sj21.foreground=波纹特效v2(0x2F000000)
sj23.foreground=波纹特效v2(0x2F000000)


水珠动画(sj0,500)
水珠动画(sj1,500)
水珠动画(sj2,500)
水珠动画(sj3,500)
水珠动画(sj10,500)
水珠动画(sj11,500)
水珠动画(sj12,500)
水珠动画(sj13,500)
水珠动画(sj20,500)
水珠动画(sj21,500)
水珠动画(sj22,500)
水珠动画(sj23,500)

CircleButton(sj0,60,0xFF101010,60)
CircleButton(sj1,60,0xFFdedede,60)
CircleButton(sj2,60,0xFF101010,60)
CircleButton(sj3,60,0xFFdedede,60)
CircleButton(sj10,60,0xFFdedede,60)
CircleButton(sj11,60,0xFF101010,60)
CircleButton(sj12,60,0xFFdedede,60)
CircleButton(sj13,60,0xFF101010,60)
CircleButton(sj20,60,0xFF101010,60)
CircleButton(sj21,60,0xFFdedede,60)
CircleButton(sj22,60,0xFF101010,60)
CircleButton(sj23,60,0xFFdedede,60)

