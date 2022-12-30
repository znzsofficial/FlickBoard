require "import"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.media.AudioManager"
import "android.media.MediaPlayer"
import "android.media.SoundPool"
import "com.google.android.material.button.MaterialButton"
import "layout"

do
  local _ENV={activity=this,style=luajava.bindClass'com.google.android.material.R$style'}
  activity.theme=style.Theme_MaterialComponents_DayNight
end
activity.setContentView(loadlayout(layout))

local list={{{'1','1'},{'2','2'},{'3','3'},{'4','4'},{'5','5'},{'6','6'}},{{'7','7'},{'8','+1'},{'9','+2'},{'10','+3'},{'11','+4'},{'12','+5'}}}

local sp=SoundPool(8,AudioManager.STREAM_MUSIC,0)

for k,v ipairs(list[1])
  v[3]=sp.load(luajava.luadir..'/res/'..v[1]..'.mp3',k)
end

local data={}

local item={
  MaterialButton,
  id="btn",
  layout_width="20%w",
  layout_height="20%w",
}

--sp.play(list[8][3],1,1,1,0,1)

local adp=LuaAdapter(this,data,item)

grid.setAdapter(adp)


for k,v ipairs(list[1])
  adp.add{
    btn={
      text=v[2],
      onClick=function()
        sp.play(v[3],1,1,1,0,1)
collectgarbage("collect")
      end
    }
  }
end

local mp=MediaPlayer()

mp.setOnPreparedListener{
  onPrepared=function(mp)
    mp.start()
end}

for k,v ipairs(list[2])
  adp.add{
    btn={
      text=v[2],
      onClick=function()
        mp.reset()
        mp.setDataSource(luajava.luadir..'/res/'..v[1]..'.mp3')
        mp.prepare()
      end
    }
  }
end

function stop.onClick()
  for k,v ipairs(list[1])
    sp.stop(v[3])
  end
  mp.stop()
end