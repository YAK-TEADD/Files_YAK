local function ChangeName(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local ALS = DevALS:get("YAK:Name"..result.id_)
if not result.first_name_ then 
if ALS then 
DevALS:del("YAK:Name"..result.id_) 
end
end
if result.first_name_ then 
if ALS and ALS ~= result.first_name_ then 
local ALS_text = {
"اسمك "..result.first_name_.." ليش غيرته 🌚😹",
"وفف اسمكك الجديد يشكك، 🤤♥️ ",
"ليش غيرت اسمك "..result.first_name_.."\n قطيت احد حبي ؟ 🌚😹",
"اسمك "..result.first_name_.." فد شي وين زخرفته ؟، 🤤♥️", 
}
ALSs = math.random(#ALS_text)
Dev_ALS(msg.chat_id_, msg.id_, 1, ALS_text[ALSs], 1, 'html')
end  
DevALS:set("YAK:Name"..result.id_, result.first_name_)  
end
end
end,nil) 
end
end

end
return {
YAK = ChangeName
}