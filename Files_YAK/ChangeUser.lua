local function ChangeUser(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local ALS = DevALS:get("YAK:User"..result.id_)
if not result.username_ then 
if ALS then 
Dev_ALS(msg.chat_id_, msg.id_, 1, "حذف معرفه خمطو بسرعه، 😹💔 \nهذا معرفه @"..ALS.."", 1, 'html')
DevALS:del("YAK:User"..result.id_) 
end
end
if result.username_ then 
if ALS and ALS ~= result.username_ then 
local ALS_text = {
'معرفك الجديد عشره بربع محد ياخذه😹💔',
"هاها غيرت معرفك نشروك بقناة فضايح😹💔💭",
"معرفك الجديد حلو منين خامطه؟!🤤♥️",
"معرفك القديم @"..result.username_.." ضمه بقناة لاينبعص، 😹♥️",
}
ALSs = math.random(#ALS_text)
Dev_ALS(msg.chat_id_, msg.id_, 1, ALS_text[ALSs], 1, 'html')
end  
DevALS:set("YAK:User"..result.id_, result.username_) 
end
end
end,nil) 
end
end

end
return {
YAK = ChangeUser
}