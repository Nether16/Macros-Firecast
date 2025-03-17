local hp = tonumber(sheet.hp)
local eng = tonumber(sheet.sp or sheet.eng)
local haki = tonumber(sheet.hakitota or sheet.haki)

local barhp = tonumber(myCharacter.bar0Val)
local bareng = tonumber(myCharacter.bar1Val)
local barhaki = tonumber(myCharacter.bar2Val)

local barhpTotal = tonumber(myCharacter.bar0Max)
local barengTotal = tonumber(myCharacter.bar1Max)
local barhakiTotal = tonumber(myCharacter.bar2Max)

if barhpTotal ~= hp then
  local porcentagem = (barhp / barhpTotal)
  barhp = hp * porcentagem
  barhpTotal = hp
end

if barengTotal ~= eng then
  local porcentagem = (bareng / barengTotal)
  bareng = eng * porcentagem
  barengTotal = eng
end

if barhakiTotal ~= haki then
  local porcentagem = (barhaki / barhakiTotal)
  barhaki = haki * porcentagem
  barhakiTotal = haki
end

myCharacter:asyncUpdate({
   bar0Val = barhp,
   bar0Max = barhpTotal,

   bar1Val = bareng,
   bar1Max = barengTotal,

   bar2Val = barhaki,
   bar2Max = barhakiTotal
});