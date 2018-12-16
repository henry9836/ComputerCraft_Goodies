redstone.setBundledOutput("top", 0)
term.clear()
term.setCursorPos(1, 1)
print("Welcome to the casino controller!")
print("-= Menu =-")
print("1. Eveyone's a winner")
print("2. Eveyone's a loser")
print("99. Cancel")
print("Please Select an Option: ")
local input = read()
if (input == "1") then
  redstone.setBundledOutput("top", colors.green)
elseif (input == "2") then
  redstone.setBundledOutput("top", colors.black)
end
