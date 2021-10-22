require "import"





function 单次旋转(控件,频率)
  import "android.view.animation.Animation"
  import "android.view.animation.RotateAnimation"
  rotate = RotateAnimation(0,360,Animation.RELATIVE_TO_SELF,0.5,Animation.RELATIVE_TO_SELF,0.5)
  rotate.setDuration(频率)
  rotate.setRepeatCount(0.5)
  控件.startAnimation(rotate)
end

function 缓冲旋转(控件,频率)
  import "android.view.animation.Animation"
  import "android.view.animation.RotateAnimation"
  rotate = RotateAnimation(0,360,Animation.RELATIVE_TO_SELF,0.5,Animation.RELATIVE_TO_SELF,0.5)
  rotate.setDuration(频率)
  rotate.setRepeatCount(频率)
  控件.startAnimation(rotate)
end

function 流畅旋转(控件,频率,顺时针,逆时针)
  import "android.view.animation.LinearInterpolator"
  c = ObjectAnimator()
  c.setTarget(控件)
  c.setDuration(频率)
  c.setRepeatCount(ValueAnimator.INFINITE)
  c.setPropertyName("rotation")
  c.setFloatValues({顺时针,逆时针})
  c.setRepeatMode(ValueAnimator.INFINITE)
  c.setInterpolator(LinearInterpolator())
  c.start()
end

function 揭露动画(view,a,b,c,d,e)
  translationUp = ViewAnimationUtils.createCircularReveal(view,a,b,c,d)
  translationUp.setInterpolator(DecelerateInterpolator())
  translationUp.setDuration(e)
  translationUp.start()
end

function 缩放动画(控件)
  import "android.view.animation.*"
  控件.startAnimation(ScaleAnimation(0.0,1.0,0.0,1.0,1,0.5,1,0.5).setDuration(200))
end

function 水珠动画(控件,时间)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(控件,"scaleX",{1,.8,1.3,.9,1}).setDuration(时间).start()
  ObjectAnimator().ofFloat(控件,"scaleY",{1,.8,1.3,.9,1}).setDuration(时间).start()
end