function yss(b,y)
  import "android.graphics.PorterDuff"
  import "android.graphics.PorterDuffColorFilter"
  function CircleButton(view,InsideColor)
    import "android.graphics.drawable.GradientDrawable"
    drawable = GradientDrawable()
    drawable.setShape(GradientDrawable.RECTANGLE)
    drawable.setColor(InsideColor)
    drawable.setCornerRadii({360,360,360,360,360,360,360,360});
    view.setBackgroundDrawable(drawable)
  end
  yuxuan={
    LinearLayout;
    orientation="vertical";
    layout_height="fill";
    layout_width="fill";
    gravity="center",
    {
      CardView,
      layout_height="100dp";
      layout_width="100dp";
      layout_marginTop="20dp";
      id="mmp5",
    };
    {
      TextView,
      text="",
      id="mmp4",
      layout_marginLeft="10dp",
      layout_marginRight="10dp",
      layout_width="match_parent";
      layout_height="50dp";
      gravity="center",
    };
    {
      LinearLayout;
      orientation="horizontal";
      layout_height="50dp";
      layout_width="fill";
      gravity="center",
      {
        TextView,
        text="A",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
      {
        SeekBar;
        id="seek_Ap";
        layout_width="65%w";
        layout_height="50dp";
      },
      {
        TextView,
        text="FF",
        id="mmp6",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
    },
    {
      LinearLayout;
      orientation="horizontal";
      layout_height="50dp";
      layout_width="fill";
      gravity="center",
      {
        TextView,
        text="R",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
      {
        SeekBar;
        id="seek_red";
        layout_width="65%w";
        layout_height="50dp";
      },
      {
        TextView,
        text="00",
        id="mmp1",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
    },
    {
      LinearLayout;
      orientation="horizontal";
      layout_height="50dp";
      layout_width="fill";
      gravity="center",
      {
        TextView,
        text="G",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
      {
        SeekBar;
        id="seek_green";
        layout_width="65%w";
        layout_height="50dp";
      },
      {
        TextView,
        text="00",
        id="mmp2",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
    },
    {
      LinearLayout;
      orientation="horizontal";
      layout_height="50dp";
      layout_width="fill";
      gravity="center",
      {
        TextView,
        text="B",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
      {
        SeekBar;
        id="seek_blue";
        layout_width="65%w";
        layout_height="50dp";
      },
      {
        TextView,
        text="00",
        id="mmp3",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
    },
  }

  AlertDialog.Builder(this)
  .setTitle(b)
  .setView(loadlayout(yuxuan))
  .setPositiveButton(getLS("L_Copy"),{onClick=function(v)
      import "android.content.*"
      a=mmp4.getText()
      activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(a)
      b=activity.getSystemService(Context.CLIPBOARD_SERVICE).getText()
      if b==a then
        SnackerBar.build()
        :msg(getLS("L_Color_replicated"))
        :actionText(getLS("L_OK"))
        :action(function()
        end)
        :show()
       else
        SnackerBar.build()
        :msg(getLS("L_Color_duplicate_failure"))
        :actionText(getLS("L_OK"))
        :action(function()
        end)
        :show()
      end
    end})
  .setNegativeButton(getLS("L_Cancel"),nil)
  .show()
  mmp4.setText(y)
  seek_Ap.setMax(255);
  seek_Ap.setProgress(255);
  seek_red.setMax(255);
  seek_red.setProgress(1);
  seek_green.setMax(255);
  seek_green.setProgress(1);
  seek_blue.setMax(255);
  seek_blue.setProgress(1);
  seek_red.ProgressDrawable.setColorFilter(PorterDuffColorFilter(0xFFFF0000,PorterDuff.Mode.SRC_ATOP))
  seek_red.Thumb.setColorFilter(PorterDuffColorFilter(0xFFFF0000,PorterDuff.Mode.SRC_ATOP))
  seek_green.ProgressDrawable.setColorFilter(PorterDuffColorFilter(0xFF00FF00,PorterDuff.Mode.SRC_ATOP))
  seek_green.Thumb.setColorFilter(PorterDuffColorFilter(0xFF00FF00,PorterDuff.Mode.SRC_ATOP))
  seek_blue.ProgressDrawable.setColorFilter(PorterDuffColorFilter(0xFF0000FF,PorterDuff.Mode.SRC_ATOP))
  seek_blue.Thumb.setColorFilter(PorterDuffColorFilter(0xFF0000FF,PorterDuff.Mode.SRC_ATOP))
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(tointeger(y))
  drawable.setCornerRadii({360,360,360,360,360,360,360,360});
  mmp5.setBackgroundDrawable(drawable)
  seek_Ap.setOnSeekBarChangeListener{
    onProgressChanged=function(SeekBar,progress)
      progress=progress+1
      e=Integer.toHexString(progress-1)
      e=string.upper(e)
      if #e==1 then
        e="0"..e
        mmp6.setText(e)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
       else
        mmp6.setText(e)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)

      end
    end
  }

  seek_red.setOnSeekBarChangeListener{
    onStartTrackingTouch=function()
    end,
    onStopTrackingTouch=function()
    end,
    onProgressChanged=function(SeekBar,progress)
      progress=progress+1
      a=Integer.toHexString(progress-1)
      a=string.upper(a)
      if #a==1 then
        a="0"..a
        mmp1.setText(a)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
       else
        mmp1.setText(a)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
      end
    end
  }
  seek_green.setOnSeekBarChangeListener{
    onStartTrackingTouch=function()
    end,
    onStopTrackingTouch=function()
    end,
    onProgressChanged=function(SeekBar,progress)
      progress=progress+1
      b=Integer.toHexString(progress-1)
      b=string.upper(b)
      if #b==1 then
        b="0"..b
        mmp2.setText(b)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
       else
        mmp2.setText(b)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
      end
    end
  }
  seek_blue.setOnSeekBarChangeListener{
    onStartTrackingTouch=function()
    end,
    onStopTrackingTouch=function()
    end,
    onProgressChanged=function(SeekBar,progress)
      progress=progress+1
      c=Integer.toHexString(progress-1)
      c=string.upper(c)
      if #c==1 then
        c="0"..c
        mmp3.setText(c)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
       else
        mmp3.setText(c)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
      end
    end
  }
  ak=string.sub(y,3,4)
  seek_Ap.setProgress(tonumber(ak, 16))

  a2=string.sub(y,5,6)
  seek_red.setProgress(tonumber(a2, 16))

  a3=string.sub(y,7,8)
  seek_green.setProgress(tonumber(a3, 16))

  a4=string.sub(y,9,10)
  seek_blue.setProgress(tonumber(a4, 16))
end

function yss1(b,y,ten)
  import "android.graphics.PorterDuff"
  import "android.graphics.PorterDuffColorFilter"
  function CircleButton(view,InsideColor)
    import "android.graphics.drawable.GradientDrawable"
    drawable = GradientDrawable()
    drawable.setShape(GradientDrawable.RECTANGLE)
    drawable.setColor(InsideColor)
    drawable.setCornerRadii({360,360,360,360,360,360,360,360});
    view.setBackgroundDrawable(drawable)
  end
  yuxuan={
    LinearLayout;
    orientation="vertical";
    layout_height="fill";
    layout_width="fill";
    gravity="center",
    {
      CardView,
      layout_height="100dp";
      layout_width="100dp";
      layout_marginTop="20dp";
      id="mmp5",
    };
    {
      TextView,
      text="",
      id="mmp4",
      layout_marginLeft="10dp",
      layout_marginRight="10dp",
      layout_width="match_parent";
      layout_height="50dp";
      gravity="center",
    };
    {
      LinearLayout;
      orientation="horizontal";
      layout_height="50dp";
      layout_width="fill";
      gravity="center",
      {
        TextView,
        text="A",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
      {
        SeekBar;
        id="seek_Ap";
        layout_width="65%w";
        layout_height="50dp";
      },
      {
        TextView,
        text="FF",
        id="mmp6",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
    },
    {
      LinearLayout;
      orientation="horizontal";
      layout_height="50dp";
      layout_width="fill";
      gravity="center",
      {
        TextView,
        text="R",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
      {
        SeekBar;
        id="seek_red";
        layout_width="65%w";
        layout_height="50dp";
      },
      {
        TextView,
        text="00",
        id="mmp1",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
    },
    {
      LinearLayout;
      orientation="horizontal";
      layout_height="50dp";
      layout_width="fill";
      gravity="center",
      {
        TextView,
        text="G",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
      {
        SeekBar;
        id="seek_green";
        layout_width="65%w";
        layout_height="50dp";
      },
      {
        TextView,
        text="00",
        id="mmp2",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
    },
    {
      LinearLayout;
      orientation="horizontal";
      layout_height="50dp";
      layout_width="fill";
      gravity="center",
      {
        TextView,
        text="B",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
      {
        SeekBar;
        id="seek_blue";
        layout_width="65%w";
        layout_height="50dp";
      },
      {
        TextView,
        text="00",
        id="mmp3",
        layout_width="10%w";
        layout_height="50dp";
        gravity="center",
      };
    },
  }

  AlertDialog.Builder(this)
  .setTitle(b)
  .setView(loadlayout(yuxuan))
  .setPositiveButton(getLS("L_Determine"),{onClick=function(v)
      if ten==true then
        LuaEditor.paste("#"..string.sub(mmp4.getText(),5,-1))
       else
       LuaEditor.paste(mmp4.getText())
      end
    end})
  .setNegativeButton(getLS("L_Cancel"),nil)
  .show()
  mmp4.setText(y)
  seek_Ap.setMax(255);
  seek_Ap.setProgress(255);
  seek_red.setMax(255);
  seek_red.setProgress(1);
  seek_green.setMax(255);
  seek_green.setProgress(1);
  seek_blue.setMax(255);
  seek_blue.setProgress(1);
  seek_red.ProgressDrawable.setColorFilter(PorterDuffColorFilter(0xFFFF0000,PorterDuff.Mode.SRC_ATOP))
  seek_red.Thumb.setColorFilter(PorterDuffColorFilter(0xFFFF0000,PorterDuff.Mode.SRC_ATOP))
  seek_green.ProgressDrawable.setColorFilter(PorterDuffColorFilter(0xFF00FF00,PorterDuff.Mode.SRC_ATOP))
  seek_green.Thumb.setColorFilter(PorterDuffColorFilter(0xFF00FF00,PorterDuff.Mode.SRC_ATOP))
  seek_blue.ProgressDrawable.setColorFilter(PorterDuffColorFilter(0xFF0000FF,PorterDuff.Mode.SRC_ATOP))
  seek_blue.Thumb.setColorFilter(PorterDuffColorFilter(0xFF0000FF,PorterDuff.Mode.SRC_ATOP))
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(tointeger(y))
  drawable.setCornerRadii({360,360,360,360,360,360,360,360});
  mmp5.setBackgroundDrawable(drawable)
  seek_Ap.setOnSeekBarChangeListener{
    onProgressChanged=function(SeekBar,progress)
      progress=progress+1
      e=Integer.toHexString(progress-1)
      e=string.upper(e)
      if #e==1 then
        e="0"..e
        mmp6.setText(e)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
       else
        mmp6.setText(e)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)

      end
    end
  }

  seek_red.setOnSeekBarChangeListener{
    onStartTrackingTouch=function()
    end,
    onStopTrackingTouch=function()
    end,
    onProgressChanged=function(SeekBar,progress)
      progress=progress+1
      a=Integer.toHexString(progress-1)
      a=string.upper(a)
      if #a==1 then
        a="0"..a
        mmp1.setText(a)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
       else
        mmp1.setText(a)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
      end
    end
  }
  seek_green.setOnSeekBarChangeListener{
    onStartTrackingTouch=function()
    end,
    onStopTrackingTouch=function()
    end,
    onProgressChanged=function(SeekBar,progress)
      progress=progress+1
      b=Integer.toHexString(progress-1)
      b=string.upper(b)
      if #b==1 then
        b="0"..b
        mmp2.setText(b)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
       else
        mmp2.setText(b)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
      end
    end
  }
  seek_blue.setOnSeekBarChangeListener{
    onStartTrackingTouch=function()
    end,
    onStopTrackingTouch=function()
    end,
    onProgressChanged=function(SeekBar,progress)
      progress=progress+1
      c=Integer.toHexString(progress-1)
      c=string.upper(c)
      if #c==1 then
        c="0"..c
        mmp3.setText(c)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
       else
        mmp3.setText(c)
        d=mmp6.getText()..mmp1.getText()..mmp2.getText()..mmp3.getText()
        mmp4.setText("0x"..d)
        ys=int("0x"..d)
        CircleButton(mmp5,ys)
      end
    end
  }
  ak=string.sub(y,3,4)
  seek_Ap.setProgress(tonumber(ak, 16))

  a2=string.sub(y,5,6)
  seek_red.setProgress(tonumber(a2, 16))

  a3=string.sub(y,7,8)
  seek_green.setProgress(tonumber(a3, 16))

  a4=string.sub(y,9,10)
  seek_blue.setProgress(tonumber(a4, 16))
end