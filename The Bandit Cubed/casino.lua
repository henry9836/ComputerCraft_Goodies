local xpos = 12
local ypos = 10
local flashtime = 0.4
local banner = "-= The Bandit^3 =-"
local ban_mode = 0
local temp = 0
local ban_switch = {
  [0] = function()
    banner = "x= The Bandit^3 =x"
  end,
  [1] = function()
    banner = "+= The Bandit^3 =+"
  end
}
local pos1pos = 0
local pos2pos = 0
local pos3pos = 0
local pos1 = "-"
local pos2 = "-"
local pos3 = "-"
local characterset = {"2", "3", "4", "5", "6", "7", "8", "9", "1", "J", "Q", "K", "A"}
local loseset1 = {"2", "3", "4", "5", "6", "7", "8", "9", "1", "J", "Q", "K", "A"}
local loseset2 = {"7", "8", "9", "1", "J", "Q", "K", "A", "2", "3", "4", "5", "6"}
local loseset3 = {"Q", "K", "A", "2", "3", "4", "5", "6", "7", "8", "9", "1", "J"}


mon_main = peripheral.wrap("monitor_0")
mon_info = peripheral.wrap("monitor_1")

function drawsslot()
  mon_main.setCursorPos(xpos,ypos)
  mon_main.write("-= [")
  mon_main.write(pos1)
  mon_main.write("] [")
  mon_main.write(pos2)
  mon_main.write("] [")
  mon_main.write(pos3)
  mon_main.write("] =-")
end

function shuffle()
  for i = (math.random(5, 30)),1,-1
  do
    pos1pos = math.random(1, 13)
    pos2pos = math.random(1, 13)
    pos3pos = math.random(1, 13)
    pos1 = (characterset[pos1pos])
    pos2 = (characterset[pos2pos])
    pos3 = (characterset[pos3pos])
    drawsslot()
    sleep(0.1)
  end
end

function lose()
  print("Admin says I must fudge the results to lose!")
  tmp = (math.random(1, 13))
  pos1 = (loseset1[tmp])
  pos2 = (loseset2[tmp])
  pos3 = (loseset3[tmp])
  drawsslot()
end

function win()
  print("Admin says I must fudge the results to win!")
  tmp = (math.random(1, 13))
  tmp2 = (math.random(1, 30))
  if (tmp2 > 28) then
    pos1 = "A"
    pos2 = "A"
    pos3 = "A"
  elseif (tmp2 > 10) then
    tmp = (math.random(1, 13))
    pos1 = (characterset[tmp])
    pos2 = (characterset[tmp])
    pos3 = (characterset[tmp])
  else
    tmp = (math.random(1, 13))
    if (tmp2 > 5) then
      pos1 = (characterset[tmp])
      pos2 = (characterset[tmp])
      pos3 = (characterset[math.random(1, 13)])
    else
      pos1 = (characterset[math.random(1, 13)])
      pos2 = (characterset[tmp])
      pos3 = (characterset[tmp])
    end
  end
  drawsslot()
end

function flashred()
  local a = 0
  for i = 5,1,-1
  do
    mon_main.setBackgroundColor(colors.red)
    mon_main.clear()
    mon_main.setCursorPos(xpos,ypos)
    mon_main.write("-=  YOU LOSE!  =-")
    sleep(flashtime)
    mon_main.setBackgroundColor(colors.black)
    mon_main.clear()
    drawsslot()
    sleep(flashtime)
  end
  mon_main.clear()
end

function flashgreen()
  local a = 0
  for i = 5,1,-1
  do
    mon_main.setBackgroundColor(colors.green)
    mon_main.clear()
    mon_main.setCursorPos(xpos,ypos)
    mon_main.write("-=  YOU WIN!  =-")
    sleep(flashtime)
    mon_main.setBackgroundColor(colors.black)
    mon_main.clear()
    drawsslot()
    sleep(flashtime)
  end
  mon_main.clear()
end

function clearall()
  mon_main.clear()
  mon_info.clear()
  mon_info.setCursorPos(1,1)
  mon_main.setCursorPos(xpos,ypos)
end

function gameon()
  clearall()
  mon_info.write("Goodluck :D")
  drawsslot()
  shuffle()
  if ((colors.test (redstone.getBundledInput("right"),  colors.black))) then
    lose()
  end
  if ((colors.test (redstone.getBundledInput("right"),  colors.green))) then
    win()
  end
  sleep(2)
  clearall()
  if ((pos1 == pos2) or (pos2 == pos3)) then
    if ((pos1 == pos2) and (pos2 == pos3)) then
      if (pos1 == "A") then
        mon_info.write("50x Reward :D")
        for i = 50,1,-1
        do
          redstone.setBundledOutput("right", colors.pink)
          sleep(0.5)
          redstone.setBundledOutput("right", 0)
          sleep(0.5)
        end
        flashgreen()
      else
        mon_info.write("10x Reward :D")
        for i = 10,1,-1
        do
          redstone.setBundledOutput("right", colors.pink)
          sleep(0.5)
          redstone.setBundledOutput("right", 0)
          sleep(0.5)
        end
        flashgreen()
      end
    else
      mon_info.write("2x Reward :D")
      for i = 2,1,-1
      do
        redstone.setBundledOutput("right", colors.pink)
        sleep(0.5)
        redstone.setBundledOutput("right", 0)
        sleep(0.5)
      end
    end
    flashgreen()
  else
    if((pos2 == characterset[pos1pos+1]) and (pos3 == characterset[pos2pos+1])) then
      if (pos1 == characterset[pos2pos-1]) then
        mon_info.write("25x Reward :D")
        for i = 25,1,-1
        do
          redstone.setBundledOutput("right", colors.pink)
          sleep(0.5)
          redstone.setBundledOutput("right", 0)
          sleep(0.5)
        end
        flashgreen()
      else
        flashred()
      end
    else
      flashred()
    end
  end
end

clearall()
for i = 13,1,-1
do
  print (i, ": ", characterset[i])
end


while true do
  if ((colors.test (redstone.getBundledInput("right"),  colors.white))) then
    mon_info.write("Try your luck")
    mon_main.setCursorPos(xpos-1,2)
    mon_main.write(banner)
    mon_main.setCursorPos(1,4)
    mon_main.write(" [ REWARDS ] ")
    mon_main.setCursorPos(1,5)
    mon_main.write(" [ AAA ] Triple Ace 50x")
    mon_main.setCursorPos(1,6)
    mon_main.write(" [ 123 ] Any In-Order 25x")
    mon_main.setCursorPos(1,7)
    mon_main.write(" [ QQQ ] Triple Any 10x")
    mon_main.setCursorPos(1,8)
    mon_main.write(" [ AA5 ] Double Any Pos 2x")
    mon_main.setCursorPos(1,9)
    mon_main.write("")

    if ((colors.test (redstone.getBundledInput("right"),  colors.red))) then
      clearall()
      gameon()
    end
    sleep(0.5)
    if (ban_mode == 1) then
      ban_mode = 0
    else
      ban_mode = 1
    end
    temp = ban_switch[ban_mode]
    if(temp) then
      temp()
    else
      print("ERROR GETTING SWITCH TO WORK :|")
    end
    clearall()
  else
    print("Terminating Casino Program...")
    do return end
  end
end
