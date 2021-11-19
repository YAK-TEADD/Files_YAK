local function ChangePhoto(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local ALS = DevALS:get("YAK:Photo"..result.id_)
if not result.profile_photo_ then 
if ALS then 
Dev_ALS(msg.chat_id_, msg.id_, 1, "حذف كل صوره مضروب بوري، 😹💔", 1, 'html')
DevALS:del("YAK:Photo"..result.id_) 
end
end
if result.profile_photo_ then 
if ALS and ALS ~= result.profile_photo_.big_.persistent_id_ then 
local ALS_text = {
"وفف مو صوره غنبلةة، 🤤♥️",
"طالع صاكك بالصوره الجديده ممكن نرتبط؟ ، 🤤♥️",
"حطيت صوره جديده عود شوفوني اني صاكك بنات، 😹♥️",
"اححح شنيي هالصوره الجديده، 🤤♥️",
}
ALS3 = math.random(#ALS_text)
Dev_ALS(msg.chat_id_, msg.id_, 1, ALS_text[ALS3], 1, 'html')
end  
DevALS:set("YAK:Photo"..result.id_, result.profile_photo_.big_.persistent_id_) 
end
end
end,nil) 
end
end

end
return {
YAK = ChangePhoto
}