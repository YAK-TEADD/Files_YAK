local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_ALS(msg.chat_id_,msg.id_, 1, "⌯︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌯︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevALS:del(YAK.."ALS:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_ALS(msg.chat_id_,msg.id_, 1, "⌯︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevALS:set(YAK.."ALS:Lock:AutoFile",true) 
end 
end

if (text and not DevALS:get(YAK.."ALS:Lock:AutoFile")) then
Time = DevALS:get(YAK.."ALS:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevALS:smembers(YAK..'ALS:Groups') 
local Members = DevALS:smembers(YAK..'ALS:Users') 
local BotName = (DevALS:get(YAK.."ALS:NameBot") or 'دراكون')
local GetJson = '{"BotId": '..YAK..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevALS:get(YAK.."ALS:Groups:Links"..v)
Welcomes = DevALS:get(YAK..'ALS:Groups:Welcomes'..v) or ''
ALSConstructors = DevALS:smembers(YAK..'ALS:ALSConstructor:'..v)
BasicConstructors = DevALS:smembers(YAK..'ALS:BasicConstructor:'..v)
Constructors = DevALS:smembers(YAK..'ALS:Constructor:'..v)
Managers = DevALS:smembers(YAK..'ALS:Managers:'..v)
Admis = DevALS:smembers(YAK..'ALS:Admins:'..v)
Vips = DevALS:smembers(YAK..'ALS:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #ALSConstructors ~= 0 then
GetJson = GetJson..'"ALSConstructors":['
for k,v in pairs(ALSConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
if #Members ~= 0 then 
GetJson = GetJson..',"mem":['
for k,v in pairs(Members) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
GetJson = GetJson..'}}'
local File = io.open('./'..YAK..'.json', "w")
File:write(GetJson)
File:close()
local ALS = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. ALS .. '" -F "chat_id='..YAK..'" -F "document=@'..YAK..'.json' .. '" -F "caption=⌯︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه\n⌯︙وتحتوي ايضاَ علئ ↫ '..#Members..' مشتركين\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ"'
io.popen(curl)
io.popen('fm -fr '..YAK..'.json')
DevALS:set(YAK.."ALS:AutoFile:Time",os.date("%x"))
end
else 
DevALS:set(YAK.."ALS:AutoFile:Time",os.date("%x"))
end
end

end
return {
YAK = AutoFile
}
