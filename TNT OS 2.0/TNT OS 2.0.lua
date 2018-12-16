--Varibles
version = 2.0
running = true

--Images

_dt = paintutils.loadImage("/os/.backgrounds/qq")

--Booleans

_ms = 0

--Functions
  clear = function()
    term.setBackgroundColor(colors.black)
    term.clear()
    term.setCursorPos(1, 1)
  end

  drawMenu1 = function()
    term.setCursorPos(1 , 2)
    term.setBackgroundColor(colors.white)
    term.setTextColor(colors.red)
    print("[POWER]")

  end

  drawTaskBar = function()
    term.setCursorPos(1,1)
    term.setBackgroundColor(colors.red)
    term.clearLine()
    term.setCursorPos(1,1)
    term.setBackgroundColor(colors.white)
    term.setTextColor(colors.green)
    term.write("[Menu]")
  end

  drawDesktop = function()
    term.setBackgroundColor(colors.black)
    term.clear()
    term.setCursorPos(1, 1)
    clear()
    paintutils.drawImage(_dt, 1, 1)
  end

  stop = function()
    clear()
    running = false
    term.setTextColor( colors.red)
    print("Shutting Down")
  end

  runTime = function()
    while running do
      event, button, x, y = os.pullEvent("mouse_click")
      if _ms == 0 and button == 1 and x < 7 and y == 1 then
        drawMenu1()
        _ms = 1
        elseif _ms == 1 and button == 1 and y == 2 and x < 7 then
          stop()
        elseif _ms == 1 and button == 1 and y == 2 and x < 7 then
          init()
        end
        end
      end



  init = function()
  _ms = 0
    drawDesktop()
    drawTaskBar()
    runTime()
  end

--Main Stuff

init()
