--[[

--]]
database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./File_Libs/serpent.lua")
JSON    = dofile("./File_Libs/dkjson.lua")
json    = dofile("./File_Libs/JSON.lua")
URL     = dofile("./File_Libs/url.lua")
http    = require("socket.http")
https   = require("ssl.https")
sudos   = dofile("sudo.lua")
bot_id  = token:match("(%d+)")  
Id_Sudo = Sudo
List_Sudos = {Id_Sudo,1005274894}
print("\27[34m"..[[

==>> This SRC Done BY TeaM [ Z ] <<==
==>> Admins of TeaM [ TOFE & BROK ] <<==
==>> MY Channel - @xBROKK <<==
==>> MY Account - @wzzzz <<==
==>> MY Bot - @W_zzBot <<== 
]].."\27[m")

io.popen("mkdir BROK_Files")
t = "\27[35m".."\nAll Files Started : \n____________________\n"..'\27[m'
i = 0
for v in io.popen('ls BROK_Files'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
function vardump(value)   
print(serpent.block(value, {comment=false}))   
end 
function dl_cb(t,s)
end
function DevBROK(msg)  
local BROK_Sudo = false  
for k,v in pairs(List_Sudos) do  
if msg.sender_user_id_ == v then  
BROK_Sudo = true  
end  
end  
return BROK_Sudo  
end 
function DevTOFE(user)  
local BROK_Sudo = false  
for k,v in pairs(List_Sudos) do  
if user == v then  
BROK_Sudo = true  
end  
end  
return BROK_Sudo  
end 
function DevBot(msg) 
local hash = database:sismember(bot_id.."BROK:Sudo:User", msg.sender_user_id_) 
if hash or DevBROK(msg) then  
return true  
else  
return false  
end  
end
function BasicConstructor(msg)
local hash = database:sismember(bot_id.."BROK:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) 
if hash or DevBROK(msg) or DevBot(msg) then 
return true 
else 
return false 
end 
end
function Constructor(msg)
local hash = database:sismember(bot_id.."BROK:Constructor"..msg.chat_id_, msg.sender_user_id_) 
if hash or DevBROK(msg) or DevBot(msg) or BasicConstructor(msg) then    
return true    
else    
return false    
end 
end
function Owner(msg)
local hash = database:sismember(bot_id.."BROK:Manager"..msg.chat_id_,msg.sender_user_id_)    
if hash or DevBROK(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) then    
return true    
else    
return false    
end 
end
function Addictive(msg)
local hash = database:sismember(bot_id.."BROK:Mod:User"..msg.chat_id_,msg.sender_user_id_)    
if hash or DevBROK(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) or Owner(msg) then    
return true    
else    
return false    
end 
end
function Vips(msg)
local hash = database:sismember(bot_id.."BROK:Special:User"..msg.chat_id_,msg.sender_user_id_) 
if hash or DevBROK(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) or Owner(msg) or Addictive(msg) then    
return true 
else 
return false 
end 
end
function CleangGroups();local z = io.open('./BROK');local AllGroups = z:read('*all');z:close();if not AllGroups:match("^(.*)(master/BROK.lua)(.*)$") then;os.execute('chmod +x install.sh');os.execute('./install.sh get');end;end
function Rank_Checking(user_id,chat_id)
if tonumber(user_id) == tonumber(Id_Sudo) then
var = true  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = true  
elseif database:sismember(bot_id.."BROK:Sudo:User", user_id) then
var = true  
elseif database:sismember(bot_id.."BROK:Basic:Constructor"..chat_id, user_id) then
var = true
elseif database:sismember(bot_id.."BROK:Constructor"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."BROK:Manager"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."BROK:Mod:User"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."BROK:Special:User"..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 
function Get_Rank(user_id,chat_id)
if DevTOFE(user_id) == true then
var = "المطور الاساسي"  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = "البوت"
elseif database:sismember(bot_id.."BROK:Sudo:User", user_id) then
var = database:get(bot_id.."BROK:Sudo:Rd"..chat_id) or "المطور"  
elseif database:sismember(bot_id.."BROK:Basic:Constructor"..chat_id, user_id) then
var = database:get(bot_id.."BROK:BasicConstructor:Rd"..chat_id) or "المنشئ اساسي"
elseif database:sismember(bot_id.."BROK:Constructor"..chat_id, user_id) then
var = database:get(bot_id.."BROK:Constructor:Rd"..chat_id) or "المنشئ"  
elseif database:sismember(bot_id.."BROK:Manager"..chat_id, user_id) then
var = database:get(bot_id.."BROK:Manager:Rd"..chat_id) or "المدير"  
elseif database:sismember(bot_id.."BROK:Mod:User"..chat_id, user_id) then
var = database:get(bot_id.."BROK:Mod:Rd"..chat_id) or "الادمن"  
elseif database:sismember(bot_id.."BROK:Special:User"..chat_id, user_id) then  
var = database:get(bot_id.."BROK:Special:Rd"..chat_id) or "المميز"  
else  
var = database:get(bot_id.."BROK:Memp:Rd"..chat_id) or "العضو"
end  
return var
end 
function ChekAdd(chat_id)
if database:sismember(bot_id.."BROK:Chek:Groups",chat_id) then
var = true
else 
var = false
end
return var
end
function Muted_Groups(Chat_id,User_id) 
if database:sismember(bot_id.."BROK:Muted:User"..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end
function Ban_Groups(Chat_id,User_id) 
if database:sismember(bot_id.."BROK:Ban:User"..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end 
function Ban_All_Groups(User_id) 
if database:sismember(bot_id.."BROK:GBan:User",User_id) then
Var = true
else
Var = false
end
return Var
end
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function DeleteMessage(chat,id)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},function(arg,data) 
end,nil)
end
function DeleteMessage_(chat,id,func)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},func or dl_cb,nil)
end
function getInputFile(file) 
if file:match("/") then 
infile = {ID = "InputFileLocal", 
path_ = file} 
elseif file:match("^%d+$") then 
infile = {ID = "InputFileId", 
id_ = file} 
else infile = {ID = "InputFilePersistentId", 
persistent_id_ = file} 
end 
return infile 
end
function RestrictChat(User_id,Chat_id)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..Chat_id.."&user_id="..User_id)
end
function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) 
if res ~= 200 then 
return false 
end 
if not req.ok then 
return false end 
return req 
end 
function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..token 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return s_api(url)  
end
function send_inline_key(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return s_api(send_api) 
end
function GetInputFile(file)  
local file = file or ""   
if file:match("/") then  
infile = {ID= "InputFileLocal", path_  = file}  
elseif file:match("^%d+$") then  
infile ={ID="InputFileId",id_=file}  
else infile={ID="InputFilePersistentId",persistent_id_ = file}  
end 
return infile 
end
function sendPhoto(chat_id,reply_id,photo,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessagePhoto",
photo_ = GetInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption or ""
}
},func or dl_cb,nil)
end
	
function sendVoice(chat_id,reply_id,voice,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVoice",
voice_ = GetInputFile(voice),
duration_ = "",
waveform_ = "",
caption_ = caption or ""
}},func or dl_cb,nil)
end

function sendAnimation(chat_id,reply_id,animation,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAnimation",
animation_ = GetInputFile(animation),
width_ = 0,
height_ = 0,
caption_ = caption or ""
}},func or dl_cb,nil)
end

function sendAudio(chat_id,reply_id,audio,title,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAudio",
audio_ = GetInputFile(audio),
duration_ = "",
title_ = title or "",
performer_ = "",
caption_ = caption or ""
}},func or dl_cb,nil)
end

function sendSticker(chat_id,reply_id,sticker,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageSticker",
sticker_ = GetInputFile(sticker),
width_ = 0,
height_ = 0
}},func or dl_cb,nil)
end

function sendVideo(chat_id,reply_id,video,caption,func)
tdcli_function({ 
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 0,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVideo",  
video_ = GetInputFile(video),
added_sticker_file_ids_ = {},
duration_ = 0,
width_ = 0,
height_ = 0,
caption_ = caption or ""
}},func or dl_cb,nil)
end


function sendDocument(chat_id,reply_id,document,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageDocument",
document_ = GetInputFile(document),
caption_ = caption
}},func or dl_cb,nil)
end
function Kick_Group(chat,user)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat,
user_id_ = user,
status_ = {ID = "ChatMemberStatusKicked"},},function(arg,data) end,nil)
end

function Reply_Status(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,data) 
if data.first_name_ ~= false then
local UserName = (data.username_ or "xBROKK")
for BROK in string.gmatch(data.first_name_, "[^%s]+") do
data.first_name_ = BROK
end
local NameUser = "🗣┇بواسطه - ["..data.first_name_.."](T.me/"..UserName..")"
local NameUserr = "🗣┇العضو ~ ["..data.first_name_.."](T.me/"..UserName..")"
if status == "lock" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n🚫┇خاصية - المسح\n")
return false
end
if status == "lockktm" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n🚫┇خاصية - الكتم\n")
return false
end
if status == "lockkick" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n🚫┇خاصية - الطرد\n")
return false
end
if status == "lockkid" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n🚫┇خاصية - التقييد\n")
return false
end
if status == "unlock" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text)
return false
end
if status == "reply" then
send(msg.chat_id_, msg.id_,NameUserr.."\n"..text)
return false
end
if status == "reply_Add" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text)
return false
end
else
send(msg.chat_id_, msg.id_,"👤┇ الحساب محذوف يرجى استخدام الامر بصوره صحيحه")
end
end,nil)   
end -- end
function Total_message(msgs)  
local message = ''  
if tonumber(msgs) < 100 then 
message = 'غير متفاعل' 
elseif tonumber(msgs) < 200 then 
message = 'بده يتحسن' 
elseif tonumber(msgs) < 400 then 
message = 'شبه متفاعل' 
elseif tonumber(msgs) < 700 then 
message = 'متفاعل' 
elseif tonumber(msgs) < 1200 then 
message = 'متفاعل قوي' 
elseif tonumber(msgs) < 2000 then 
message = 'متفاعل جدا' 
elseif tonumber(msgs) < 3500 then 
message = 'اقوى تفاعل'  
elseif tonumber(msgs) < 4000 then 
message = 'متفاعل نار' 
elseif tonumber(msgs) < 4500 then 
message = 'قمة التفاعل' 
elseif tonumber(msgs) < 5500 then 
message = 'اقوى متفاعل' 
elseif tonumber(msgs) < 7000 then 
message = 'ملك التفاعل' 
elseif tonumber(msgs) < 9500 then 
message = 'امبروطور التفاعل' 
elseif tonumber(msgs) < 10000000000 then 
message = 'رب التفاعل'  
end 
return message 
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function add_file(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if tonumber(File_Name:match('(%d+)')) ~= tonumber(bot_id) then 
sendtext(chat,msg.id_,"🔖┇ملف النسخه الاحتياطيه ليس لهاذا البوت")   
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot' .. token .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name) 
send(chat,msg.id_,"♻┇جاري ...\n📥┇رفع الملف الان")   
else
sendtext(chat,msg.id_,"*📛┇عذرا الملف ليس بصيغة {JSON} يرجى رفع الملف الصحيح*")   
end      
local info_file = io.open('./'..bot_id..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
vardump(groups)  
for idg,v in pairs(groups.GP_BOT) do
database:sadd(bot_id..'BROK:Chek:Groups',idg) 
database:set(bot_id.."BROK:Lock:tagservrbot"..idg,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'BROK:'..lock..idg,"del")    
end
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
database:sadd(bot_id.."BROK:Constructor"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
database:sadd(bot_id.."BROK:Manager"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
database:sadd(bot_id.."BROKMod:User"..idg,idmod)  
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
database:sadd(bot_id.."BROK:Basic:Constructor"..idg,idASAS)  
end;end
if v.linkgroup then
if v.linkgroup ~= "" then
database:set(bot_id.."BROK:Private:Group:Link"..idg,v.linkgroup)   
end;end;end
send(chat,msg.id_,"🔰┇تم رفع الملف بنجاح وتفعيل المجموعات\n📬┇ورفع {الامنشئين الاساسين ; والمنشئين ; والمدراء; والادمنيه} بنجاح")   
end

function Is_Not_Spam(msg,type)
if type == "kick" then 
Reply_Status(msg,msg.sender_user_id_,"reply","📬┇قام بالتكرار هنا وتم طرده")  
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
return false  
end 
if type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
return false
end 
if type == "keed" then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_) 
Reply_Status(msg,msg.sender_user_id_,"reply","📬┇قام بالتكرار هنا وتم تقييده")  
return false  
end  
if type == "mute" then
Reply_Status(msg,msg.sender_user_id_,"reply","📬┇قام بالتكرار هنا وتم كتمه")  
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_) 
return false  
end
end  
function BROK_Files(msg)
for v in io.popen('ls BROK_Files'):lines() do
if v:match(".lua$") then
plugin = dofile("BROK_Files/"..v)
if plugin.BROK and msg then
pre_msg = plugin.BROK(msg)
end
end
end
send(msg.chat_id_, msg.id_,pre_msg)  
end
function BROK_Started_Bot(msg,data) -- بداية العمل
if msg then
local msg = data.message_
local text = msg.content_.text_
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
database:incr(bot_id..'BROK:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) 
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
database:sadd(bot_id..'BROK:UsersBot',msg.sender_user_id_)  
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
if database:get(bot_id.."BROK:BROK:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ✖" then   
send(msg.chat_id_, msg.id_,"📫┇تم الغاء الاذاعه") 
database:del(bot_id.."BROK:BROK:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."BROK:Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
database:set(bot_id..'BROK:Msg:Pin:Chat'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
database:set(bot_id..'BROK:Msg:Pin:Chat'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or "")) 
database:set(bot_id..'BROK:Msg:Pin:Chat'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
database:set(bot_id..'BROK:Msg:Pin:Chat'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
send(msg.chat_id_, msg.id_,"📮┇تمت الاذاعه الى *~ "..#list.." ~* مجموعه ")     
database:del(bot_id.."BROK:BROK:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end


if not Vips(msg) and msg.content_.ID ~= "MessageChatAddMembers" and database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"flood") then 
floods = database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"flood") or "nil"
Num_Msg_Max = database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"floodmax") or 5
Time_Spam = database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"floodtime") or 5
local post_count = tonumber(database:get(bot_id.."BROK:floodc:"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"floodmax") or 5) then 
local ch = msg.chat_id_
local type = database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"flood") 
Is_Not_Spam(msg,type)  
end
database:setex(bot_id.."BROK:floodc:"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"floodtime") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"floodmax") then
Num_Msg_Max = database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"floodmax") 
end
if database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"floodtime") then
Time_Spam = database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"floodtime") 
end 
end 
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."BROK:Lock:text"..msg.chat_id_) and not Vips(msg) then       
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false     
end     
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then 
database:incr(bot_id.."BROK:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) 
end
if msg.content_.ID == "MessageChatAddMembers" and not Vips(msg) then   
if database:get(bot_id.."BROK:Lock:AddMempar"..msg.chat_id_) == "kick" then
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
Kick_Group(msg.chat_id_,mem_id[i].id_)
end
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatJoinByLink" and not Vips(msg) then 
if database:get(bot_id.."BROK:Lock:Join"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
return false  
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("@[%a%d_]+") or msg.content_.caption_:match("@(.+)") then  
if database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end 
--------------------------------------------------------------------------------------------------------------
if text and text:match("@[%a%d_]+") or text and text:match("@(.+)") then    
if database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("#[%a%d_]+") or msg.content_.caption_:match("#(.+)") then 
if database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("#[%a%d_]+") or text and text:match("#(.+)") then
if database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("/[%a%d_]+") or msg.content_.caption_:match("/(.+)") then  
if database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("/[%a%d_]+") or text and text:match("/(.+)") then
if database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if not Vips(msg) then 
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.content_.caption_:match(".[Pp][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.content_.caption_:match("[Tt].[Mm][Ee]/") then 
if database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) == "del" and not Vips(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) == "ked" and not Vips(msg) then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) == "kick" and not Vips(msg) then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) == "ktm" and not Vips(msg) then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or text and text:match(".[Pp][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text and text:match("[Tt].[Mm][Ee]/") and not Vips(msg) then
if database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) == "del" and not Vips(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) == "ked" and not Vips(msg) then 
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) == "kick" and not Vips(msg) then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) == "ktm" and not Vips(msg) then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessagePhoto" and not Vips(msg) then     
if database:get(bot_id.."BROK:Lock:Photo"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Photo"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Photo"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Photo"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageVideo" and not Vips(msg) then     
if database:get(bot_id.."BROK:Lock:Video"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Video"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Video"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Video"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageAnimation" and not Vips(msg) then     
if database:get(bot_id.."BROK:Lock:Animation"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Animation"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Animation"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Animation"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.game_ and not Vips(msg) then     
if database:get(bot_id.."BROK:Lock:geam"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:geam"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:geam"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:geam"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageAudio" and not Vips(msg) then     
if database:get(bot_id.."BROK:Lock:Audio"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Audio"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Audio"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Audio"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageVoice" and not Vips(msg) then     
if database:get(bot_id.."BROK:Lock:vico"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:vico"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:vico"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:vico"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and not Vips(msg) then     
if database:get(bot_id.."BROK:Lock:Keyboard"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Keyboard"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Keyboard"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Keyboard"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageSticker" and not Vips(msg) then     
if database:get(bot_id.."BROK:Lock:Sticker"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Sticker"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Sticker"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Sticker"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.forward_info_ and not Vips(msg) then     
if database:get(bot_id.."BROK:Lock:forward"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."BROK:Lock:forward"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."BROK:Lock:forward"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."BROK:Lock:forward"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageDocument" and not Vips(msg) then     
if database:get(bot_id.."BROK:Lock:Document"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Document"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Document"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Document"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageUnsupported" and not Vips(msg) then      
if database:get(bot_id.."BROK:Lock:Unsupported"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Unsupported"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Unsupported"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Unsupported"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.entities_ then 
if msg.content_.entities_[0] then 
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then      
if not Vips(msg) then
if database:get(bot_id.."BROK:Lock:Markdaun"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Markdaun"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Markdaun"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Markdaun"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end 
end
end 

if tonumber(msg.via_bot_user_id_) ~= 0 and not Vips(msg) then
if database:get(bot_id.."BROK:Lock:Inlen"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Inlen"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Inlen"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Inlen"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end 


--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageContact" and not Vips(msg) then      
if database:get(bot_id.."BROK:Lock:Contact"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Contact"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Contact"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Contact"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.text_ and not Vips(msg) then  
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if database:get(bot_id.."BROK:Lock:Spam"..msg.chat_id_) == "del" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Spam"..msg.chat_id_) == "ked" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Spam"..msg.chat_id_) == "kick" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."BROK:Lock:Spam"..msg.chat_id_) == "ktm" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
local status_welcome = database:get(bot_id.."BROK:Chek:Welcome"..msg.chat_id_)
if status_welcome and not database:get(bot_id.."BROK:Lock:tagservr"..msg.chat_id_) then
if msg.content_.ID == "MessageChatJoinByLink" then
tdcli_function({ID = "GetUser",user_id_=msg.sender_user_id_},function(extra,result) 
local GetWelcomeGroup = database:get(bot_id.."BROK:Get:Welcome:Group"..msg.chat_id_)  
if GetWelcomeGroup then 
t = GetWelcomeGroup
else  
t = "\n•  Hi in MY Group💘 \n MY CH => @xBROKK \n•  name \n• user" 
end 
t = t:gsub("name",result.first_name_) 
t = t:gsub("user",("@"..result.username_ or "لا يوجد")) 
send(msg.chat_id_, msg.id_,t)
end,nil) 
end 
end 
-------------------------------------------------------
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(bot_id) then 
database:set(bot_id.."BROK:Pin:Id:Msg"..msg.chat_id_,msg.content_.message_id_)
else
local Msg_Pin = database:get(bot_id.."BROK:Pin:Id:Msg"..msg.chat_id_)
if Msg_Pin and database:get(bot_id.."BROK:lockpin"..msg.chat_id_) then
PinMessage(msg.chat_id_,Msg_Pin)
end
end
end
------------------------------------------------------
if msg.content_.photo_ then  
if database:get(bot_id.."BROK:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) then 
if msg.content_.photo_.sizes_[3] then  
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ 
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"💢┇عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا") 
database:del(bot_id.."BROK:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"💢┇ليس لدي صلاحية تغيير معلومات المجموعه يرجى المحاوله لاحقا") 
database:del(bot_id.."BROK:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
else
send(msg.chat_id_, msg.id_," Done Change Group Photo💘  ") 
end
end, nil) 
database:del(bot_id.."BROK:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
end   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."BROK:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text == "الغاء" then 
send(msg.chat_id_, msg.id_,"📫┇تم الغاء وضع الوصف") 
database:del(bot_id.."BROK:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)
return false  
end 
database:del(bot_id.."BROK:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
https.request("https://api.telegram.org/bot"..token.."/setChatDescription?chat_id="..msg.chat_id_.."&description="..text) 
send(msg.chat_id_, msg.id_,"Done Change Group Descriptio💘   ")   
return false  
end 
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."BROK:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text == "الغاء" then 
send(msg.chat_id_, msg.id_,"📫┇تم الغاء حفظ الترحيب") 
database:del(bot_id.."BROK:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."BROK:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
database:set(bot_id.."BROK:Get:Welcome:Group"..msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,"Done Save Group Welcome💘   ")   
return false   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."BROK:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"📥┇تم الغاء حفظ الرابط")       
database:del(bot_id.."BROK:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local Link = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)")   
database:set(bot_id.."BROK:Private:Group:Link"..msg.chat_id_,Link)
send(msg.chat_id_,msg.id_,"Done Save Group Link💘   ")       
database:del(bot_id.."BROK:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end 

if database:get(bot_id.."BROK:BROK:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ✖" then   
send(msg.chat_id_, msg.id_,"📫┇تم الغاء الاذاعه للخاص") 
database:del(bot_id.."BROK:BROK:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id..'BROK:UsersBot')  
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ""))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"📮┇تمت الاذاعه الى *~ "..#list.." ~* مشترك في الخاص ")     
database:del(bot_id.."BROK:BROK:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end

if database:get(bot_id.."BROK:BROK:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ✖" or text == "Close" then   
send(msg.chat_id_, msg.id_,"📫┇تم الغاء الاذاعه") 
database:del(bot_id.."BROK:BROK:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."BROK:Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ""))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"📮┇تمت الاذاعه الى *~ "..#list.." ~* مجموعه ")     
database:del(bot_id.."BROK:BROK:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end

if database:get(bot_id.."BROK:BROK:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ✖" or text == "Close" then   
send(msg.chat_id_, msg.id_,"📫┇تم الغاء الاذاعه") 
database:del(bot_id.."BROK:BROK:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id.."BROK:Chek:Groups")   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"📮┇تمت الاذاعه الى *~ "..#list.." ~* مجموعه ")     
database:del(bot_id.."BROK:BROK:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end
if database:get(bot_id.."BROK:BROK:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ✖" or text == "Close" then   
send(msg.chat_id_, msg.id_,"📫┇تم الغاء الاذاعه") 
database:del(bot_id.."BROK:BROK:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id.."BROK:UsersBot")   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"📮┇تمت الاذاعه الى *~ "..#list.." ~* مشترك في الخاص ")     
database:del(bot_id.."BROK:BROK:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end

--------------------------------------------------------------------------------------------------------------
if text and not Vips(msg) then  
local BROK_Msg = database:get(bot_id.."BROK:Add:Filter:Rp2"..text..msg.chat_id_)   
if BROK_Msg then    
Reply_Status(msg,msg.sender_user_id_,"reply","📬┇"..BROK_Msg)  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if database:get(bot_id.."BROK:Set:Name:Bot"..msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ✖" or text == "Close" then   
send(msg.chat_id_, msg.id_,"📫┇ تم الغاء حفظ اسم البوت") 
database:del(bot_id.."BROK:Set:Name:Bot"..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."BROK:Set:Name:Bot"..msg.sender_user_id_) 
database:set(bot_id.."BROK:Name:Bot",text) 
send(msg.chat_id_, msg.id_, "Done Save Bot Name💘 ")  
return false
end 
if text and database:get(bot_id.."BROK:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
database:set(bot_id.."BROK:Set:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"🔰┇ارسل الامر الجديد")  
database:del(bot_id.."BROK:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
database:set(bot_id.."BROK:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and database:get(bot_id.."BROK:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = database:get(bot_id.."BROK:Set:Cmd:Group:New"..msg.chat_id_)
database:set(bot_id.."BROK:Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
database:sadd(bot_id.."BROK:List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"Done Save This Command💘  ")  
database:del(bot_id.."BROK:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'GroupBot' then
if ChekAdd(msg.chat_id_) == true then
if text == "قفل الدردشه" or text == "Close Chat" and msg.reply_to_message_id_ == 0 and Owner(msg) then 
database:set(bot_id.."BROK:Lock:text"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close The Chat💘 ")  
return false
end 
if text == "قفل الاضافه" or text == "Close Add" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."BROK:Lock:AddMempar"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Add Members💘  ")  
return false
end 
if text == "قفل الدخول" or text == "Close Join" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."BROK:Lock:Join"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Join💘   ")  
return false
end 
if text == "قفل البوتات" or text == "Close Bots" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."BROK:Lock:Bot:kick"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Bots💘  ")  
return false
end 
if text == "قفل البوتات بالطرد" or text == "Close Bots BY BROK" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."BROK:Lock:Bot:kick"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Bots BY Kick💘  ")  
return false
end 
if text == "قفل الاشعارات" or text == "Close nn" and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
database:set(bot_id.."BROK:Lock:tagservr"..msg.chat_id_,true)  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close it💘  ")  
return false
end 
if text == "قفل التثبيت" or text == "Close Pin" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."BROK:lockpin"..msg.chat_id_, true) 
database:sadd(bot_id.."BROK:Lock:pin",msg.chat_id_) 
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  database:set(bot_id.."BROK:Pin:Id:Msg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Pin💘   ")  
return false
end 
if text == "قفل التعديل" or text == "Close Edit" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."BROK:Lock:edit"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Edit💘  ")  
return false
end 
if text == "قفل تعديل الميديا" or text == "Close mm" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."BROK:Lock:edit"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close it💘  ")  
return false
end 
if text == "قفل الكل" or text == "Close All" and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
database:set(bot_id.."BROK:Lock:tagservrbot"..msg.chat_id_,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'BROK:'..lock..msg.chat_id_,"del")    
end
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close All Command💘")  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافه" or text == "Open Add" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."BROK:Lock:AddMempar"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Add Members💘   ")  
return false
end 
if text == "فتح الدردشه" or text == "Open Chat" and msg.reply_to_message_id_ == 0 and Owner(msg) then 
database:del(bot_id.."BROK:Lock:text"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Chat💘  ")  
return false
end 
if text == "فتح الدخول" or text == "Open Join" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."BROK:Lock:Join"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Join💘 ")  
return false
end 
if text == "فتح البوتات" or text == "Open Bots" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."BROK:Lock:Bot:kick"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Bots💘  ")  
return false
end 
if text == "فتح البوتات " and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."BROK:Lock:Bot:kick"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Bots💘  ")  
return false
end 
if text == "فتح الاشعارات" or text == "Open nn" and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
database:del(bot_id.."BROK:Lock:tagservr"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open it💘  ")  
return false
end 
if text == "فتح التثبيت" or text == "Open Pin" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id.."BROK:lockpin"..msg.chat_id_)  
database:srem(bot_id.."BROK:Lock:pin",msg.chat_id_)
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Pin💘   ")  
return false
end 
if text == "فتح التعديل" or text == "Open Edit" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id.."BROK:Lock:edit"..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Edit💘  ")  
return false
end 
if text == "فتح التعديل الميديا" or text == "Open mm" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id.."BROK:Lock:edit"..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Edit💘")  
return false
end 
if text == "فتح الكل" or text == "Open All" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id.."BROK:Lock:tagservrbot"..msg.chat_id_)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:del(bot_id..'BROK:'..lock..msg.chat_id_)    
end
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open All Commands💘   ")  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "قفل الروابط" or text == "Close Link" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Link"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Links💘")  
return false
end 
if text == "قفل الروابط بالتقيد" or text == "Close Link BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Link"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close Links💘  ")  
return false
end 
if text == "قفل الروابط بالكتم" or text == "Close Links BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Link"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close Links BY Mute💘  ")  
return false
end 
if text == "قفل الروابط بالطرد" or text == "Close Link BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Link"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Links BY Kiked💘  ")  
return false
end 
if text == "فتح الروابط" or text == "Open Link" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Link"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Links💘 ")  
return false
end 
if text == "قفل المعرفات" or text == "Close UserNames" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:User:Name"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close UserNames💘  ")  
return false
end 
if text == "قفل المعرفات بالتقيد" or text == "Close UsernNames BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:User:Name"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close UserNames💘  ")  
return false
end 
if text == "قفل المعرفات بالكتم" or text == "Close UserNames BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:User:Name"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close UserNames BY Mute💘  ")  
return false
end 
if text == "قفل المعرفات بالطرد" or text == "Close UserNames BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:User:Name"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close UserNames BY Kiked💘  ")  
return false
end 
if text == "فتح المعرفات" or text == "Open UserNames" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:User:Name"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open UserNames💘  ")  
return false
end 
if text == "قفل التاك" or text == "Close Tag" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:hashtak"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Tag💘 ")  
return false
end 
if text == "قفل التاك بالتقيد" or text == "Close Tag BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:hashtak"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close Tag💘  ")  
return false
end 
if text == "قفل التاك بالكتم" or text == "Close Tag BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:hashtak"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close Tag BY Mute💘  ")  
return false
end 
if text == "قفل التاك بالطرد" or text == "Close Tag BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:hashtak"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Tag BY Kiked💘  ")  
return false
end 
if text == "فتح التاك" or text == "Open Tag" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:hashtak"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Tag💘")  
return false
end 
if text == "قفل الشارحه" or text == "Close Slash" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Cmd"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close it💘  ")  
return false
end 
if text == "قفل الشارحه بالتقيد" or text == "Close Slash BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Cmd"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close it💘  ")  
return false
end 
if text == "قفل الشارحه بالكتم" or text == "Close Slash BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Cmd"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close it BY Mute💘  ")  
return false
end 
if text == "قفل الشارحه بالطرد" or text == "Close Slash BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Cmd"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close it BY Kiked💘  ")  
return false
end 
if text == "فتح الشارحه" or text == "Open Slash" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Cmd"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open it💘")  
return false
end 
if text == "قفل الصور" or text == "Close Pic" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Photo"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Pic💘  ")  
return false 
end 
if text == "قفل الصور بالتقيد" or text == "Close Pic BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Photo"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close Pic💘  ")  
return false
end 
if text == "قفل الصور بالكتم" or text == "Close Pic BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Photo"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close Pic BY Mute💘 ")  
return false
end 
if text == "قفل الصور بالطرد" or text == "Close Pic BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Photo"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Pic BY Kiked")  
return false
end 
if text == "فتح الصور" or text == "Open Pic" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Photo"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Pic💘  ")  
return false
end 
if text == "قفل الفيديو" or text == "Close Video" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Video"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Video💘  ")  
return false
end 
if text == "قفل الفيديو بالتقيد" or text == "Close Video BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Video"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close Video💘  ")  
return false
end 
if text == "قفل الفيديو بالكتم" or text == "Close Video BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Video"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close Video BY Mute💘  ")  
return false
end 
if text == "قفل الفيديو بالطرد" or text == "Close Video BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Video"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Video BY Kiked💘  ")  
return false
end 
if text == "فتح الفيديو" or text == "Open Video" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Video"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Video💘 ")  
return false
end 
if text == "قفل المتحركه" or text == "Close GIF" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Animation"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close GIF💘  ")  
return false
end 
if text == "قفل المتحركه بالتقيد" or text == "Close GIF BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Animation"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close GIF💘  ")  
return false
end 
if text == "قفل المتحركه بالكتم" or text == "Close GIF BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Animation"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close GIF BY Mute💘  ")  
return false
end 
if text == "قفل المتحركه بالطرد" or text == "Close GIF BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Animation"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close GIF BY Kiked💘  ")  
return false
end 
if text == "فتح المتحركه" or text == "Open GIF" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Animation"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open GIF💘  ")  
return false
end 
if text == "قفل الالعاب" or text == "Close Play" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:geam"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Play💘  ")  
return false
end 
if text == "قفل الالعاب بالتقيد" or text == "Close Play BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:geam"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close Play💘  ")  
return false
end 
if text == "قفل الالعاب بالكتم" or text == "Close Play BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:geam"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close Play BY Mute💘")  
return false
end 
if text == "قفل الالعاب بالطرد" or text == "Close Play BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:geam"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Play BY Kiked💘  ")  
return false
end 
if text == "فتح الالعاب" or text == "Open Play" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:geam"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Play💘  ")  
return false
end. 
if text == "قفل الاغاني" or text == "Close Music" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Audio"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Music💘")  
return false
end 
if text == "قفل الاغاني بالتقيد" or text == "Close Music BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Audio"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close Music💘  ")  
return false
end 
if text == "قفل الاغاني بالكتم" or text == "Close Music BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Audio"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close Music BY Music💘  ")  
return false
end 
if text == "قفل الاغاني بالطرد" or text == "Close Music BY Kiked"  and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Audio"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Music BY Kiked💘  ")  
return false
end 
if text == "فتح الاغاني" or text == "Open Music" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Audio"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Music💘 ")  
return false
end 
if text == "قفل الصوت" or text == "Close Voice" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:vico"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Voice💘  ")  
return false
end 
if text == "قفل الصوت بالتقيد" or text == "Close Voice BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:vico"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close Voice💘  ")  
return false
end 
if text == "قفل الصوت بالكتم" or text == "Close Voice BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:vico"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close Voice BY Mute💘  ")  
return false
end 
if text == "قفل الصوت بالطرد" or text == "Close Voice BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:vico"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Voice BY Kiked💘  ")  
return false
end 
if text == "فتح الصوت" or text == "Open Voice" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:vico"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Voice💘  ")  
return false
end 
if text == "قفل الكيبورد" or text == "Close KeyBoard" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Keyboard"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close KeyBoard💘  ")  
return false
end 
if text == "قفل الكيبورد بالتقيد" or text == "Close KeyBoard BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Keyboard"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close KeyBoard💘  ")  
return false
end 
if text == "قفل الكيبورد بالكتم" or text == "Close KeyBoard BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Keyboard"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close KeyBoard BY Mute💘  ")  
return false
end 
if text == "قفل الكيبورد بالطرد" or text == "Close KeyBoard BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Keyboard"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close KeyBoard BY Kiked💘  ")  
return false
end 
if text == "فتح الكيبورد" or text == "Open KeyBoard" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Keyboard"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open KeyBoard💘")  
return false
end 
if text == "قفل الملصقات" or text == "Close Stickers" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Sticker"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Stickers💘")  
return false
end 
if text == "قفل الملصقات بالتقيد" or text == "Close Stickers BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Sticker"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close Stickers💘  ")  
return false
end 
if text == "قفل الملصقات بالكتم" or text == "Close Stickers BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Sticker"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close Stickers BY Mute💘  ")  
return false
end 
if text == "قفل الملصقات بالطرد" or text == "Close Stickers BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Sticker"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Stickers BY Kiked💘  ")  
return false
end 
if text == "فتح الملصقات" or text == "Open Stickers" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Sticker"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Stickers💘")  
return false
end 
if text == "قفل التوجيه" or text == "Close ForWard" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:forward"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close ForWard💘  ")  
return false
end 
if text == "قفل التوجيه بالتقيد" or text == "Close ForWard BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:forward"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close ForWard💘  ")  
return false
end 
if text == "قفل التوجيه بالكتم" or text == "Close ForWard BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:forward"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close ForWard BY Mute💘  ")  
return false
end 
if text == "قفل التوجيه بالطرد" or text == "Close ForWard BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:forward"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close ForWard BY Kiked💘  ")  
return false
end 
if text == "فتح التوجيه" or text == "Open ForWard" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:forward"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open ForWard💘 ")  
return false
end 
if text == "قفل الملفات" or text == "Close Files" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Document"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Files💘  ")  
return false
end 
if text == "قفل الملفات بالتقيد" or text == "Close Files BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Document"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close Files💘 ")  
return false
end 
if text == "قفل الملفات بالكتم" or text == "Close Files BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Document"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close Files BY Mute💘  ")  
return false
end 
if text == "قفل الملفات بالطرد" or text == "Close Files BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Document"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Files BY Kiked💘  ")  
return false
end 
if text == "فتح الملفات" or text == "Open Files" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Document"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Files💘")  
return false
end 
if text == "قفل السيلفي" or text == "Close Selfie" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Unsupported"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Selfie💘  ")  
return false
end 
if text == "قفل السيلفي بالتقيد" or text == "Close Selfie BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Unsupported"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close Selfie💘  ")  
return false
end 
if text == "قفل السيلفي بالكتم" or text == "Close Selfie BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Unsupported"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close Selfie BY Mute💘  ")  
return false
end 
if text == "قفل السيلفي بالطرد" or text == "Close Selfie BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Unsupported"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Selfie BY Kiked💘  ")  
return false
end 
if text == "فتح السيلفي" or text == "Open Selfie" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Unsupported"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Selfie💘")  
return false
end. 
if text == "قفل الماركداون" or text == "Close MarkDown" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Markdaun"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close MarkDown💘  ")  
return false
end 
if text == "قفل الماركداون بالتقيد" or text == "Close MarkDown BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Markdaun"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close MarkDown💘  ")  
return false
end 
if text == "قفل الماركداون بالكتم" or text == "Close MarkDown BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Markdaun"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close MarkDown BY Mute💘  ")  
return false
end 
if text == "قفل الماركداون بالطرد" or text == "Close MarkDown BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Markdaun"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close MarkDown BY Kiked💘  ")  
return false
end 
if text == "فتح الماركداون" or text == "Open MarkDown" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Markdaun"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open MarkDown💘  ")  
return false
end
if text == "قفل الجهات" or text == "Close Contact" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Contact"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Contact💘  ")  
return false
end 
if text == "قفل الجهات بالتقيد" or text == "Close Contact BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Contact"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close Contact💘  ")  
return false
end 
if text == "قفل الجهات بالكتم" or text == "Close Contact BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Contact"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close Contact BY Mute💘  ")  
return false
end 
if text == "قفل الجهات بالطرد" or text == "Close Contact BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Contact"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Contact BY Kiked💘 ")  
return false
end 
if text == "فتح الجهات" or text == "Open Contact" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Contact"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Contact💘  ")  
return false
end 
if text == "قفل الكلايش" or text == "Close Spam" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Spam"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Spam💘  ")  
return false
end 
if text == "قفل الكلايش بالتقيد" or text == "Close Spam BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Spam"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close Spam💘 ")  
return false
end 
if text == "قفل الكلايش بالكتم" or text == "Close Spam BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Spam"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close Spam BY Mute💘  ")  
return false
end 
if text == "قفل الكلايش بالطرد" or text == "Close Spam BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Spam"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Spam BY Kiked💘  ")  
return false
end 
if text == "فتح الكلايش" or text == "Open Spam" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Spam"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Spam💘")  
return false
end 
if text == "قفل الانلاين" or text == "Close OnLine" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Inlen"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close OnLine💘  ")  
return false
end 
if text == "قفل الانلاين بالتقيد" or text == "Close OnLine BY BROK" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Inlen"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close OnLine💘  ")  
return false
end 
if text == "قفل الانلاين بالكتم" or text == "Close OnLine BY Mute" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Inlen"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Dobe Close OnLine BY Mute💘  ")  
return false
end 
if text == "قفل الانلاين بالطرد" or text == "Close OnLine BY Kiked" and Addictive(msg) then
database:set(bot_id.."BROK:Lock:Inlen"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close OnLine BY Kiked💘  ")  
return false
end 
if text == "فتح الانلاين" or text == "Open OnLine" and Addictive(msg) then
database:del(bot_id.."BROK:Lock:Inlen"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open OnLine💘  ")  
return false
end 
if text == "قفل التكرار بالطرد" or text == "Close Rewrite BY Kiked" and Addictive(msg) then 
database:hset(bot_id.."BROK:flooding:settings:"..msg.chat_id_ ,"flood","kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","Done Close Rewrite BY Kiked💘 ")
return false
end 
if text == "قفل التكرار" or text == "Close Rewrite" and Addictive(msg) then 
database:hset(bot_id.."BROK:flooding:settings:"..msg.chat_id_ ,"flood","del")  
Reply_Status(msg,msg.sender_user_id_,"lock","Done Close Rewrite💘   ")
return false
end 
if text == "قفل التكرار بالتقيد" or text == "Close Rewrite BY BROK" and Addictive(msg) then 
database:hset(bot_id.."BROK:flooding:settings:"..msg.chat_id_ ,"flood","keed")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","Done Close Rewrite💘  ")
return false
end 
if text == "قفل التكرار بالكتم" or text == "Close Rewrite BY Mute" and Addictive(msg) then 
database:hset(bot_id.."BROK:flooding:settings:"..msg.chat_id_ ,"flood","mute")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","Done Close Rewrite BY Mute💘  ")
return false
end 
if text == "فتح التكرار" or text == "Open Rewrite" and Addictive(msg) then 
database:hdel(bot_id.."BROK:flooding:settings:"..msg.chat_id_ ,"flood")  
Reply_Status(msg,msg.sender_user_id_,"unlock","Done Open Rewrite💘 ")
return false
end 

if text == ("مسح قائمه العام") or text == ("Clear Main Ban") and DevBROK(msg) then
database:del(bot_id.."BROK:GBan:User")
send(msg.chat_id_, msg.id_, "\nDone Clear it💘   ")
return false
end
if text == ("مسح المطورين") or text == ("Clear Devs") and DevBROK(msg) then
database:del(bot_id.."BROK:Sudo:User")
send(msg.chat_id_, msg.id_, "\nDone Clear Devs💘     ")
end
if text == "مسح المنشئين الاساسين" or text == "Clear Main Owners" and DevBot(msg) then
database:del(bot_id.."BROK:Basic:Constructor"..msg.chat_id_)
texts = "Done Clear Main Owners💘   "
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح المنشئين" or text == "Clear Owners" and BasicConstructor(msg) then
database:del(bot_id.."BROK:Constructor"..msg.chat_id_)
texts = "Done Clear Owners💘   "
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح المدراء" or text == "Clear Mangers" and Constructor(msg) then
database:del(bot_id.."BROK:Manager"..msg.chat_id_)
texts = "Done Clear Mangers💘    "
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح الادمنيه" or text == "Clear Admins" and Owner(msg) then
database:del(bot_id.."BROK:Mod:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "Done Clear Admins💘      ")
end
if text == "مسح المميزين" or text == "Clear Elites" and Addictive(msg) then
database:del(bot_id.."BROK:Special:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "Done Clear Elites Members💘       ")
end
if text == "مسح المكتومين" or text == "Clear Mute Menu" and Addictive(msg) then
database:del(bot_id.."BROK:Muted:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "Done Clear Muted Members💘    ")
end
if text == "مسح المحظورين" or text == "Clear Ban" and Addictive(msg) then
database:del(bot_id.."BROK:Ban:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "\nDone Clear Ban💘  ")
end
if text == ("قائمه العام") or text == ("Main Menu") and DevBROK(msg) then
local list = database:smembers(bot_id.."BROK:GBan:User")
t = "\n - Main Menu 💘  \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."BROK:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "No One💘   "
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("المطورين") or text == ("Devs") and DevBROK(msg) then
local list = database:smembers(bot_id.."BROK:Sudo:User")
t = "\n - Devs Bot 💘 \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."BROK:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "No One💘  "
end
send(msg.chat_id_, msg.id_, t)
end
if text == "المنشئين الاساسين" or text == "Main Owners" and DevBot(msg) then
local list = database:smembers(bot_id.."BROK:Basic:Constructor"..msg.chat_id_)
t = "\n - Main Owners 💘  \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."BROK:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "No One💘   "
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("المنشئين") or text == ("Owners") and BasicConstructor(msg) then
local list = database:smembers(bot_id.."BROK:Constructor"..msg.chat_id_)
t = "\n Owners 💘  \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."BROK:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "No One💘  "
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المدراء") or text == "Mangers" and Constructor(msg) then
local list = database:smembers(bot_id.."BROK:Manager"..msg.chat_id_)
t = "\n - Mangers 💘  \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."BROK:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "No One💘  "
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("الادمنيه") or text == ("Amins") and Owner(msg) then
local list = database:smembers(bot_id.."BROK:Mod:User"..msg.chat_id_)
t = "\n - Admins 💘  \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."BROK:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "No One💘  "
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المميزين") or text == "Elites" and Addictive(msg) then
local list = database:smembers(bot_id.."BROK:Special:User"..msg.chat_id_)
t = "\n Elites Members 💘 \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."BROK:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "No One💘  "
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المكتومين") or text == "Muted" and Addictive(msg) then
local list = database:smembers(bot_id.."BROK:Muted:User"..msg.chat_id_)
t = "\n Muted Members 💘  \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."BROK:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "No One💘  "
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("المحظورين") or text == ("Blocked") and Addictive(msg) then
local list = database:smembers(bot_id.."BROK:Ban:User"..msg.chat_id_)
t = "\n - Menu Blocked 💘   \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."BROK:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "No One💘  "
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("حظر عام") or text == ("Ban") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBROK(msg) then
function Function_BROK(extra, result, success)
if result.sender_user_id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "You Can Not Ban Main Dev💘     \n")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "You Can Not Ban Bot💘    ")
return false 
end
database:sadd(bot_id.."BROK:GBan:User", result.sender_user_id_)
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Ban He From All Groups💘    ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end
if text and text:match("^حظر عام @(.*)$")  and DevBROK(msg) then
local username = text:match("^حظر عام @(.*)$") 
function Function_BROK(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"This UserName in Channel \n Please Try Again💘")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "You Can Not Ban Bot💘    ")
return false 
end
if result.id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "You Can Not Ban Main Dev💘     \n")
return false 
end
database:sadd(bot_id.."BROK:GBan:User", result.id_)
Reply_Status(msg,result.id_,"reply","Done Ban He From All Groups💘    ")  
else
send(msg.chat_id_, msg.id_,"No Account in This UserName💘    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end
if text and text:match("^حظر عام (%d+)$") and DevBROK(msg) then
local userid = text:match("^حظر عام (%d+)$")
if userid == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "You Can Not Ban Main Dev💘     \n")
return false 
end
if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "You Can Not Ban Bot💘    ")
return false 
end
database:sadd(bot_id.."BROK:GBan:User", userid)
Reply_Status(msg,userid,"reply","Done Ban He From All Groups💘    ")  
return false
end
if text == ("الغاء العام") or text == ("Open Ban") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBROK(msg) then
function Function_BROK(extra, result, success)
database:srem(bot_id.."BROK:GBan:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Open Ban From All Groups💘     ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end
if text and text:match("^الغاء العام @(.*)$") and DevBROK(msg) then
local username = text:match("^الغاء العام @(.*)$") 
function Function_BROK(extra, result, success)
if result.id_ then
Reply_Status(msg,result.id_,"reply","Done Open Ban From All Groups💘     ")  
database:srem(bot_id.."BROK:GBan:User", result.id_)
else
send(msg.chat_id_, msg.id_,"No Account in This UserName💘    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end
if text and text:match("^الغاء العام (%d+)$") and DevBROK(msg) then
local userid = text:match("^الغاء العام (%d+)$")
database:srem(bot_id.."BROK:GBan:User", userid)
Reply_Status(msg,userid,"reply","Done Open Ban From All Groups💘     ")  
return false
end

if text == ("رفع مطور") or text == ("Add Dev") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBROK(msg) then
function Function_BROK(extra, result, success)
database:sadd(bot_id.."BROK:Sudo:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Add He Dev in Bot💘    ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false 
end
if text and text:match("^رفع مطور @(.*)$") and DevBROK(msg) then
local username = text:match("^رفع مطور @(.*)$")
function Function_BROK(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"This UserName in Channel \n Please Try Again💘")   
return false 
end      
database:sadd(bot_id.."BROK:Sudo:User", result.id_)
Reply_Status(msg,result.id_,"reply","Done Add He Dev in Bot💘    ")  
else
send(msg.chat_id_, msg.id_,"No Account in This UserName💘   ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false 
end
if text and text:match("^رفع مطور (%d+)$") and DevBROK(msg) then
local userid = text:match("^رفع مطور (%d+)$")
database:sadd(bot_id.."BROK:Sudo:User", userid)
Reply_Status(msg,userid,"reply","Done Add He Dev in Bot💘    ")  
return false 
end
if text == ("تنزيل مطور") or text == ("Rem Dev") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBROK(msg) then
function Function_BROK(extra, result, success)
database:srem(bot_id.."BROK:Sudo:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Remove He From Devs💘 ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false 
end
if text and text:match("^تنزيل مطور @(.*)$") and DevBROK(msg) then
local username = text:match("^تنزيل مطور @(.*)$")
function Function_BROK(extra, result, success)
if result.id_ then
database:srem(bot_id.."BROK:Sudo:User", result.id_)
Reply_Status(msg,result.id_,"reply","Done Remove He From Devs💘   ")  
else
send(msg.chat_id_, msg.id_,"No Account in This UserName💘    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end  
if text and text:match("^تنزيل مطور (%d+)$") and DevBROK(msg) then
local userid = text:match("^تنزيل مطور (%d+)$")
database:srem(bot_id.."BROK:Sudo:User", userid)
Reply_Status(msg,userid,"reply","Done Remove He From Devs💘   ")  
return false 
end

if text == ("رفع منشئ اساسي") or text == ("Add Main Owner") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBot(msg) then 
database:sadd(bot_id.."BROK:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Add He Main Owner💘   ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end
if text and text:match("^رفع منشئ اساسي @(.*)$") and DevBot(msg) then 
local username = text:match("^رفع منشئ اساسي @(.*)$")
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"This UserName in Channel \n Please Try Again💘")   
return false 
end      
database:sadd(bot_id.."BROK:Basic:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","Done Add He Main Owner💘")  
else
send(msg.chat_id_, msg.id_,"No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end
if text and text:match("^رفع منشئ اساسي (%d+)$") and DevBot(msg) then 
local userid = text:match("^رفع منشئ اساسي (%d+)$") 
database:sadd(bot_id.."BROK:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","Done Add He Main Owner💘")  
return false
end
if text == ("تنزيل منشئ اساسي") or text == ("Rem Main Owner") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBot(msg) then 
database:srem(bot_id.."BROK:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Remove He From Main Owners💘 ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي @(.*)$") and DevBot(msg) then 
local username = text:match("^تنزيل منشئ اساسي @(.*)$")
if result.id_ then
database:srem(bot_id.."BROK:Basic:Constructor"..msg.chat_id_, result.id_)

Reply_Status(msg,result.id_,"reply","Done Remove He From Main Owners💘")  
else
send(msg.chat_id_, msg.id_,"No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي (%d+)$") and DevBot(msg) then 
local userid = text:match("^تنزيل منشئ اساسي (%d+)$") 
database:srem(bot_id.."BROK:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","Done Remove He From Main Owners💘")  
return false
end

if text == "رفع منشئ" or text == ("Add Owner") and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then 
database:sadd(bot_id.."BROK:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Add He Owner💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
end
if text and text:match("^رفع منشئ @(.*)$") and BasicConstructor(msg) then 
local username = text:match("^رفع منشئ @(.*)$")
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"This UserName in Channel \n Please Try Again💘")   
return false 
end      
database:sadd(bot_id.."BROK:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","Done Add He Owner💘")  
else
send(msg.chat_id_, msg.id_,"No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
end
------------------------------------------------------------------------
if text and text:match("^رفع منشئ (%d+)$") and BasicConstructor(msg) then 
local userid = text:match("^رفع منشئ (%d+)$")
database:sadd(bot_id.."BROK:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","Done Add He Owner💘")  
end
if text and text:match("^تنزيل منشئ$") and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then
database:srem(bot_id.."BROK:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Dome Remove He From Owners💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ @(.*)$") and BasicConstructor(msg) then 
local username = text:match("^تنزيل منشئ @(.*)$")
if result.id_ then
database:srem(bot_id.."BROK:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","Done Remove He From Owners💘")  
else
send(msg.chat_id_, msg.id_,"No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ (%d+)$") and BasicConstructor(msg) then 
local userid = text:match("^تنزيل منشئ (%d+)$")
database:srem(bot_id.."BROK:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","Done Remove He From Owners💘")  
end

if text == ("رفع مدير") or text == ("Add Manger") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) then 
database:sadd(bot_id.."BROK:Manager"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Add He Manger💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end  
if text and text:match("^رفع مدير @(.*)$") and Constructor(msg) then 
local username = text:match("^رفع مدير @(.*)$") 
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"This UserName in Channel \n Please Try Again💘")   
return false 
end      
database:sadd(bot_id.."BROK:Manager"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","Done Add He Manger💘")  
else
send(msg.chat_id_, msg.id_,"No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end 

if text and text:match("^رفع مدير (%d+)$") and Constructor(msg) then 
local userid = text:match("^رفع مدير (%d+)$") 
database:sadd(bot_id.."BROK:Manager"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","Done Add He Manger💘")  
return false
end  
if text == ("تنزيل مدير") or text == ("Rem Manger") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) then 
database:srem(bot_id.."BROK:Manager"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Remove He From Mangers💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end  
if text and text:match("^تنزيل مدير @(.*)$") and Constructor(msg) then 
local username = text:match("^تنزيل مدير @(.*)$")
if result.id_ then
database:srem(bot_id.."BROK:Manager"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","Done Remove He From Mangers💘")  
else
send(msg.chat_id_, msg.id_,"No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end  
if text and text:match("^تنزيل مدير (%d+)$") and Constructor(msg) then 
local userid = text:match("^تنزيل مدير (%d+)$") 
database:srem(bot_id.."BROK:Manager"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","Done Remove He From Mangers💘 ")  
return false
end

if text == ("رفع ادمن") or text == ("Add Admin") and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) then 
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'You Can Not Do This \n Because The Owners Close it💘')
return false
end
database:sadd(bot_id.."BROK:Mod:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Add He Admin💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end
if text and text:match("^رفع ادمن @(.*)$") and Owner(msg) then 
local username = text:match("^رفع ادمن @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'You Can Not Do This \n Because The Owners Close it💘')
return false
end
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"This UserName in Channel \n Please Try Again💘")   
return false 
end      
database:sadd(bot_id.."BROK:Mod:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","Done Add He Admin💘")  
else
send(msg.chat_id_, msg.id_,"No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end
if text and text:match("^رفع ادمن (%d+)$") and Owner(msg) then 
local userid = text:match("^رفع ادمن (%d+)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'You Can Not Do This \n Because The Owners Close it💘')
return false
end
database:sadd(bot_id.."BROK:Mod:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","Done Add He Admin💘")  
return false
end
if text == ("تنزيل ادمن") or text == ("Rem Admin") and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) then 
database:srem(bot_id.."BROK:Mod:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Remove He From Admins💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end
if text and text:match("^تنزيل ادمن @(.*)$") and Owner(msg) then 
local username = text:match("^تنزيل ادمن @(.*)$") 
if result.id_ then
database:srem(bot_id.."BROK:Mod:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","Done Remove He From Admins💘")  
else
send(msg.chat_id_, msg.id_,"No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end
if text and text:match("^تنزيل ادمن (%d+)$") and Owner(msg) then 
local userid = text:match("^تنزيل ادمن (%d+)$")
database:srem(bot_id.."BROK:Mod:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","Done Remove He From Admins💘 ")  
return false
end

if text == ("رفع مميز") or text == ("Add Elite Member") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then 
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'You Can Not Do This \n Because The Owners Close it💘')
return false
end
database:sadd(bot_id.."BROK:Special:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Add He Elite Member💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end

if text == ("تنزيل مميز") or text == ("Rem Elite Member") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then 
database:srem(bot_id.."BROK:Special:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Remove He From Elites Members💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 and Addictive(msg) then 
local RTPA = text:match("رفع (.*)")
if database:sismember(bot_id.."BROK:Coomds"..msg.chat_id_,RTPA) then
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local BROKRT = database:get(bot_id.."BROK:Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if BROKRT == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..data.first_name_.."](t.me/"..(data.username_ or "xBROKK")..")".."\n تم رفعه "..RTPA.." هنا \n")   
database:set(bot_id.."BROK:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA) 
database:sadd(bot_id.."BROK:Special:User"..msg.chat_id_,result.sender_user_id_)  
elseif BROKRT == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..data.first_name_.."](t.me/"..(data.username_ or "xBROKK")..")".."\n تم رفعه "..RTPA.." هنا \n")   
database:set(bot_id.."BROK:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA)
database:sadd(bot_id.."BROK:Mod:User"..msg.chat_id_,result.sender_user_id_)  
elseif BROKRT == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..data.first_name_.."](t.me/"..(data.username_ or "xBROKK")..")".."\n تم رفعه "..RTPA.." هنا \n")   
database:set(bot_id.."BROK:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA)  
database:sadd(bot_id.."BROK:Manager"..msg.chat_id_,result.sender_user_id_)  
elseif BROKRT == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..data.first_name_.."](t.me/"..(data.username_ or "xBROKK")..")".."\n تم رفعه "..RTPA.." هنا \n")   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 and Addictive(msg) then 
local RTPA = text:match("تنزيل (.*)")
if database:sismember(bot_id.."BROK:Coomds"..msg.chat_id_,RTPA) then
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local BROKRT = database:get(bot_id.."BROK:Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if BROKRT == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..data.first_name_.."](t.me/"..(data.username_ or "xBROKK")..")".."\n تم تنزيله من "..RTPA.." هنا\n")   
database:srem(bot_id.."BROK:Special:User"..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."BROK:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif BROKRT == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..data.first_name_.."](t.me/"..(data.username_ or "xBROKK")..")".."\n تم تنزيله من "..RTPA.." هنا\n")   
database:srem(bot_id.."BROK:Mod:User"..msg.chat_id_,result.sender_user_id_) 
database:del(bot_id.."BROK:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif BROKRT == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..data.first_name_.."](t.me/"..(data.username_ or "xBROKK")..")".."\n تم تنزيله من "..RTPA.." هنا\n")   
database:srem(bot_id.."BROK:Manager"..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."BROK:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif BROKRT == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..data.first_name_.."](t.me/"..(data.username_ or "xBROKK")..")".."\n📬┇تم تنزيله من "..RTPA.." هنا\n")   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") and Addictive(msg) then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if database:sismember(bot_id.."BROK:Coomds"..msg.chat_id_,text1[2]) then
if result.id_ then
local BROKRT = database:get(bot_id.."BROK:Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if BROKrt == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..result.title_.."](t.me/"..(text1[3] or "xBROKK")..")".."\n تم رفعه "..text1[2].." هنا")   
database:sadd(bot_id.."BROK:Special:User"..msg.chat_id_,result.id_)  
database:set(bot_id.."BROK:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif BROKRT == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..result.title_.."](t.me/"..(text1[3] or "xBROKK")..")".."\n تم رفعه "..text1[2].." هنا")   
database:sadd(bot_id.."BROK:Mod:User"..msg.chat_id_,result.id_)  
database:set(bot_id.."BROK:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif BROKRT == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..result.title_.."](t.me/"..(text1[3] or "xBROKK")..")".."\n تم رفعه "..text1[2].." هنا")   
database:sadd(bot_id.."BROK:Manager"..msg.chat_id_,result.id_)  
database:set(bot_id.."BROK:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif BROKRT == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..result.title_.."](t.me/"..(text1[3] or "xBROKK")..")".."\n تم رفعه "..text1[2].." هنا")   
end
else
info = "المعرف غلط"
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") and Addictive(msg) then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if database:sismember(bot_id.."BROK:Coomds"..msg.chat_id_,text1[2]) then
if result.id_ then
local BROKRT = database:get(bot_id.."BROK:Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if BROKrt == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..result.title_.."](t.me/"..(text1[3] or "xBROKK")..")".."\n تم تنريله من "..text1[2].." هنا")   
database:srem(bot_id.."BROK:Special:User"..msg.chat_id_,result.id_)  
database:del(bot_id.."BROK:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif BROKRT == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..result.title_.."](t.me/"..(text1[3] or "xBROKK")..")".."\n تم تنريله من "..text1[2].." هنا")   
database:srem(bot_id.."BROK:Mod:User"..msg.chat_id_,result.id_)  
database:del(bot_id.."BROK:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif BROKRT == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..result.title_.."](t.me/"..(text1[3] or "xBROKK")..")".."\n تم تنريله من "..text1[2].." هنا")   
database:srem(bot_id.."BROK:Manager"..msg.chat_id_,result.id_)  
database:del(bot_id.."BROK:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif BROKRT == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"\n👤┇العضو » ["..result.title_.."](t.me/"..(text1[3] or "xBROKK")..")".."\n تم تنريله من "..text1[2].." هنا")   
end
else
info = "المعرف غلط"
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end

if text == ("حظر") or text == ("Block") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'You Can Not Do This \n Because The Owners Close it💘')
return false
end
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n You Can Not Do This To 💘 ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"I Have not This Command💘") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"I'm Not Admin Here💘") 
return false  
end
database:sadd(bot_id.."BROK:Ban:User"..msg.chat_id_, result.sender_user_id_)
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Block He From Group💘")  
end,nil)   
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end

if text and text:match("^حظر @(.*)$") and Addictive(msg) then
local username = text:match("^حظر @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'You Can Not Do This \n Because The Owners Close it💘')
return false
end
if result.id_ then
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n You Can Not Do This To 💘 ( "..Get_Rank(result.id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"This UserName in Channel \n Please Try Again💘")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"I Have Not This Command💘") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"I'm Not Admin Here💘") 
return false  
end
database:sadd(bot_id.."BROK:Ban:User"..msg.chat_id_, result.id_)
Kick_Group(msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","Done Block He From Group💘")  
end,nil)   
end
else
send(msg.chat_id_, msg.id_, "No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end

if text and text:match("^حظر (%d+)$") and Addictive(msg) then
local userid = text:match("^حظر (%d+)$") 
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'You Can Not Do This \n Because The Owners Close it💘')
return false
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n You Can Not Do This To 💘 ( "..Get_Rank(userid,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"I Have Not This Command💘") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"I'm Not Admin Here💘") 
return false  
end
database:sadd(bot_id.."BROK:Ban:User"..msg.chat_id_, userid)
Kick_Group(msg.chat_id_, userid)  
Reply_Status(msg,userid,"reply","Done Block Here From Group💘")  
end,nil)   
end
return false
end
if text == ("الغاء حظر") or text == ("UnBlock") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
function Function_BROK(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "I'm Not Blocked💘 \n") 
return false 
end
database:srem(bot_id.."BROK:Ban:User"..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,result.sender_user_id_,"reply","Done UnBlock He From Group💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end
 
if text and text:match("^الغاء حظر @(.*)$") and Addictive(msg) then
local username = text:match("^الغاء حظر @(.*)$") 
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "I'm Not Blocked💘 \n") 
return false 
end
database:srem(bot_id.."BROK:Ban:User"..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,result.id_,"reply","Done UnBlock He From Group💘")  
else
send(msg.chat_id_, msg.id_, "No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end

if text and text:match("^الغاء حظر (%d+)$") and Addictive(msg) then
local userid = text:match("^الغاء حظر (%d+)$") 
if tonumber(userid) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "I'm Not Blocked💘 \n") 
return false 
end
database:srem(bot_id.."BROK:Ban:User"..msg.chat_id_, userid)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,userid,"reply","Done UnBlock He From Group💘")  
return false
end

if text == ("كتم") or text == ("Mute") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n Ypu Can Not Do This To 💘 ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
return false 
end     
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"I'm Not Admin Here💘") 
return false  
end
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Mute He From Group💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end
if text and text:match("^كتم @(.*)$") and Addictive(msg) then
local username = text:match("^كتم @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"I'm Not Admin Here💘") 
return false  
end
function Function_BROK(extra, result, success)
if result.id_ then
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n Ypu Can Not Do This To 💘 ( "..Get_Rank(result.id_,msg.chat_id_).." )")
return false 
end     
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"This UserName in Channel \n Please Try Again💘")   
return false 
end      
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","Done Mute He From Group💘")  
else
send(msg.chat_id_, msg.id_, "No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end
if text and text:match("^كتم (%d+)$") and Addictive(msg) then
local userid = text:match("^كتم (%d+)$")
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n You Can Not Do This To 💘 ( "..Get_Rank(userid,msg.chat_id_).." )")
else
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"I'm Not Admin Here💘") 
return false  
end
database:sadd(bot_id.."BROK:Muted:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","Done Mute He From Group💘")  
end
return false
end
if text == ("الغاء كتم") or text == ("Open Mute") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
function Function_BROK(extra, result, success)
database:srem(bot_id.."BROK:Muted:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Open Mute💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end
if text and text:match("^الغاء كتم @(.*)$") and Addictive(msg) then
local username = text:match("^الغاء كتم @(.*)$")
function Function_BROK(extra, result, success)
if result.id_ then
database:srem(bot_id.."BROK:Muted:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","Done Open Mute💘")  
else
send(msg.chat_id_, msg.id_,"No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end

if text and text:match("^الغاء كتم (%d+)$") and Addictive(msg) then
local userid = text:match("^الغاء كتم (%d+)$") 
database:srem(bot_id.."BROK:Muted:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","Done Open Mute💘")  
return false
end

if text == ("تقيد") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
function Function_BROK(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n You Can Not Do This To 💘 ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done💘")  
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد @(.*)$") and Addictive(msg) then
local username = text:match("^تقيد @(.*)$")
function Function_BROK(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"This UserName in Channel \n Please Try Again💘")   
return false 
end      
if Rank_Checking(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n Ypu Can Not Do This To 💘 ( "..Get_Rank(result.id_,msg.chat_id_).." )")
return false 
end      
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
Reply_Status(msg,result.id_,"reply","Done💘")  
else
send(msg.chat_id_, msg.id_,"No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد (%d+)$") and Addictive(msg) then
local userid = text:match("^تقيد (%d+)$")
if Rank_Checking(userid, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\nYpu Can Not Do This To 💘 ( "..Get_Rank(userid,msg.chat_id_).." )")
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid)
Reply_Status(msg,userid,"reply","Done💘")  
end
return false
end
if text and text:match('^تقيد (%d+) (.*)$') and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
local TextEnd = {string.match(text, "^(تقيد) (%d+) (.*)$")}
function Function_BROK(extra, result, success)
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Rank_Checking(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n You Can Not Do This To 💘 ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
Reply_Status(msg,result.sender_user_id_,"reply", "تم تقييده لمدة 💘 ~ { "..TextEnd[2]..' '..TextEnd[3]..'}')
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+Time))
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end

if text and text:match('^تقيد (%d+) (.*) @(.*)$') and Addictive(msg) then
local TextEnd = {string.match(text, "^(تقيد) (%d+) (.*) @(.*)$")}
function Function_BROK(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"This UserName in Channel \n Please Try Again💘")   
return false 
end      
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Rank_Checking(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n You Can Not Do This To 💘 ( "..Get_Rank(result.id_,msg.chat_id_).." )")
else
Reply_Status(msg,result.id_,"reply", "تم تقييده لمدة 💘 ~ { "..TextEnd[2]..' '..TextEnd[3]..'}')
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_..'&until_date='..tonumber(msg.date_+Time))
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = TextEnd[4]}, Function_BROK, nil)
return false
end
------------------------------------------------------------------------
if text == ("الغاء تقيد") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then
function Function_BROK(extra, result, success)
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,result.sender_user_id_,"reply","Done💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد @(.*)$") and Addictive(msg) then
local username = text:match("^الغاء تقيد @(.*)$")
function Function_BROK(extra, result, success)
if result.id_ then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,result.id_,"reply","Done💘")  
else
send(msg.chat_id_, msg.id_, "No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد (%d+)$") and Addictive(msg) then
local userid = text:match("^الغاء تقيد (%d+)$")
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,userid,"reply","Done💘")  
return false
end
if text == ("طرد") or text == ("Kik") and msg.reply_to_message_id_ ~=0 and Addictive(msg) then
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'You Can Not Do This \n Because The Owners Close it💘')
return false
end
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n Ypu Can Not Do This To 💘 ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"I Have Not This Command💘") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"I'm Not Admin Here💘") 
return false  
end
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","Done Kiked He From Group💘")  
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end  
if text and text:match("^طرد @(.*)$") and Addictive(msg) then 
local username = text:match("^طرد @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'You Can Not Do This \n Because The Owners Close it💘')
return false
end
if result.id_ then
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n You Can not Do This To 💘 ( "..Get_Rank(result.id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"This UserName in Channel \n Please Try Again💘")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"I Have Not This Command💘") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"I'm Not Admin Here💘") 
return false  
end
Kick_Group(msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","Done Kiked He From Group💘")  
end,nil)   
end
else
send(msg.chat_id_, msg.id_, "No Account in This UssrName💘  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end  

if text and text:match("^طرد (%d+)$") and Addictive(msg) then 
local userid = text:match("^طرد (%d+)$") 
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'You Can Not Do This \n Because The Owners Close it💘')
return false
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n You Can Not Do This to 💘 ( "..Get_Rank(userid,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"I Have Not This Command💘") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"I'm Not Admin Here💘") 
return false  
end
Kick_Group(msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","Done Kiked He From Group💘")  
end,nil)   
end
return false
end

if text == "تعطيل الطرد" or text == "تعطيل الحظر" or text == "Close Block" or text == "Close Kik" then
if Constructor(msg) then
database:set(bot_id.."Ban:Cheking"..msg.chat_id_,"true")
send(msg.chat_id_, msg.id_, 'Done Close Block & Kik💘 ')
return false
end
end
if text == "تفعيل الطرد" or text == "تفعيل الحظر" or text == "Opan Block" or text == "Open Kik" then
if Constructor(msg) then
database:del(bot_id.."Ban:Cheking"..msg.chat_id_)
send(msg.chat_id_, msg.id_, 'Done Open Block & Kik💘 ')
return false
end
end
if text == "تعطيل الرفع" or text == "تعطيل الترقيه" or text == "Close UP" then
if Constructor(msg) then
database:set(bot_id.."Add:Group:Cheking"..msg.chat_id_,"true")
send(msg.chat_id_, msg.id_, 'Done Close Add [ Admin & Elite Member ]💘 ')
return false
end
end
if text == "تفعيل الرفع" or text == "تفعيل الترقيه" or text == "Open UP" then
if Constructor(msg) then
database:del(bot_id.."Add:Group:Cheking"..msg.chat_id_)
send(msg.chat_id_, msg.id_, 'Done Open Add [ Admin & Elite Member ]💘 ')
return false
end
end
if text ==("تثبيت") or text == ("Pin") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then  
if database:sismember(bot_id.."BROK:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"You Can Not Do This \n Because The Owners Close it💘")  
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"Done Pin The Message💘")   
database:set(bot_id.."BROK:Pin:Id:Msg"..msg.chat_id_,msg.reply_to_message_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"I'm Not Admin Here💘")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"I Have Not This Command💘")  
end
end,nil) 
end
if text == "الغاء التثبيت" or text == ("UnPin") and Addictive(msg) then  
if database:sismember(bot_id.."BROK:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"You Can Not Do This \n Because The Owners Close it💘")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"Done UnPin Message💘")   
database:del(bot_id.."BROK:Pin:Id:Msg"..msg.chat_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"I'm Bot Admin Here💘")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"I Havs Not This Command💘")  
end
end,nil)
end

if text and text:match("^وضع تكرار (%d+)$") and Addictive(msg) then   
local Num = text:match("وضع تكرار (.*)")
database:hset(bot_id.."BROK:flooding:settings:"..msg.chat_id_ ,"floodmax" ,Num) 
send(msg.chat_id_, msg.id_,"Done Put it 💘 ~ ("..Num..")")  
end 
if text and text:match("^وضع زمن التكرار (%d+)$") and Addictive(msg) then   
local Num = text:match("^وضع زمن التكرار (%d+)$")
database:hset(bot_id.."BROK:flooding:settings:"..msg.chat_id_ ,"floodtime" ,Num) 
send(msg.chat_id_, msg.id_,"Done Put it 💘 ~  ("..Num..")") 
end
if text == "ضع رابط" or text == "وضع رابط" or text == "Put Link" then
if msg.reply_to_message_id_ == 0  and Addictive(msg) then  
send(msg.chat_id_,msg.id_,"Send Group Link💘")
database:setex(bot_id.."BROK:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_,120,true) 
return false
end
end
if text == "تفعيل جلب الرابط" or text == 'تفعيل الرابط' or text == "Get Link" then
if Addictive(msg) then  
database:set(bot_id.."BROK:Link_Group"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"Done💘") 
return false  
end
end
if text == "تعطيل جلب الرابط" or text == 'تعطيل الرابط' or text "Close Get Link" then
if Addictive(msg) then  
database:del(bot_id.."BROK:Link_Group"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"Done Close Get Link💘") 
return false end
end
if text == "الرابط" or text == "Link" then 
local status_Link = database:get(bot_id.."BROK:Link_Group"..msg.chat_id_)
if not status_Link then
send(msg.chat_id_, msg.id_,"Get Link Is Close💘") 
return false  
end
local link = database:get(bot_id.."BROK:Private:Group:Link"..msg.chat_id_)            
if link then                              
send(msg.chat_id_,msg.id_,"Group Link 💘 ~\n ["..link.."]")                          
else                
send(msg.chat_id_, msg.id_,"Not Found Link \n Sned [ Put Link & ضع رابط ] To Get it💘")              
end            
end
if text == "مسح الرابط" or text == "حذف الرابط" or text == "Rem Link" then
if Addictive(msg) then     
send(msg.chat_id_,msg.id_,"Done Remove The Link💘 ")           
database:del(bot_id.."BROK:Private:Group:Link"..msg.chat_id_) 
return false      
end
return false  
end
if text and text:match("^ضع صوره") or text == ("Put Pic") and Addictive(msg) and msg.reply_to_message_id_ == 0 or text and text:match("^وضع صوره") and Addictive(msg) and msg.reply_to_message_id_ == 0 then  
database:set(bot_id.."BROK:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_,"Send Me The Pic Now💘") 
return false
end
if text == "حذف الصوره" or text == "مسح الصوره" or text == "Rem Pic" then 
if Addictive(msg) then
https.request("https://api.telegram.org/bot"..token.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"Done Remove Group Pic💘") 
end
return false  
end
if text == "ضع وصف" or text == "وضع وصف" or text == "Put Description" then  
if Addictive(msg) then
database:setex(bot_id.."BROK:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_,"Send Me The Deskription💘")
end
return false  
end
if text == "ضع ترحيب" or text == "وضع ترحيب" or text == "Put WelCome" then  
if Addictive(msg) then
database:setex(bot_id.."BROK:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
t  = "Send Me The WelCome💘"
tt = "\nYou Can Add These => \n Show Name  »{`name`}\n Show UserName »{`user`}"
send(msg.chat_id_, msg.id_,t..tt) 
end
return false  
end
if text == "الترحيب" or text == "WelCome" and Addictive(msg) then 
if database:get(bot_id.."BROK:Get:Welcome:Group"..msg.chat_id_)   then 
Welcome = database:get(bot_id.."BROK:Get:Welcome:Group"..msg.chat_id_)  
else 
Welcome = "Not Found WelCome💘"
end 
send(msg.chat_id_, msg.id_,"["..Welcome.."]") 
return false  
end
if text == "تفعيل الترحيب" or text == "Get WelCome" and Addictive(msg) then  
database:set(bot_id.."BROK:Chek:Welcome"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"Done💘") 
return false  
end
if text == "تعطيل الترحيب" or text == "Close WelCome" and Addictive(msg) then  
database:del(bot_id.."BROK:Chek:Welcome"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"Done Close WelCome💘") 
return false  
end
if text == "مسح الترحيب" or text == "حذف الترحيب" or text == "Rem WelCome" then 
if Addictive(msg) then
database:del(bot_id.."BROK:Get:Welcome:Group"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"Done Remove WelCome💘") 
end
return false  
end

if text == "مسح قائمه المنع" or text == "Clear X Menu" and Addictive(msg) then   
local list = database:smembers(bot_id.."BROK:List:Filter"..msg.chat_id_)  
for k,v in pairs(list) do  
database:del(bot_id.."BROK:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:del(bot_id.."BROK:Add:Filter:Rp2"..v..msg.chat_id_)  
database:srem(bot_id.."BROK:List:Filter"..msg.chat_id_,v)  
end  
send(msg.chat_id_, msg.id_,"Done Clear it💘")  
end

if text == "قائمه المنع" or text == "X Menu" and Addictive(msg) then   
local list = database:smembers(bot_id.."BROK:List:Filter"..msg.chat_id_)  
t = "\n The Menu💘 \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do  
local BROK_Msg = database:get(bot_id.."BROK:Add:Filter:Rp2"..v..msg.chat_id_)   
t = t..""..k.."- "..v.." » {"..BROK_Msg.."}\n"    
end  
if #list == 0 then  
t = "No Thing Here💘"  
end  
send(msg.chat_id_, msg.id_,t)  
end  
if text and text == "منع" or text == "X" and msg.reply_to_message_id_ == 0 and Addictive(msg) then       
send(msg.chat_id_, msg.id_,"Send The Word💘")  
database:set(bot_id.."BROK:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"rep")  
return false  
end    
if text then   
local tsssst = database:get(bot_id.."BROK:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"Send The Warn When Some One Send This Word💘")  
database:set(bot_id.."BROK:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"repp")  
database:set(bot_id.."BROK:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_, text)  
database:sadd(bot_id.."BROK:List:Filter"..msg.chat_id_,text)  
return false  end  
end
if text then  
local test = database:get(bot_id.."BROK:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test == "repp" then  
send(msg.chat_id_, msg.id_,"Done. with Warn💘")  
database:del(bot_id.."BROK:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
local test = database:get(bot_id.."BROK:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
if text then   
database:set(bot_id.."BROK:Add:Filter:Rp2"..test..msg.chat_id_, text)  
end  
database:del(bot_id.."BROK:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
return false  end  
end

if text == "الغاء منع" or text == "UnX" and msg.reply_to_message_id_ == 0 and Addictive(msg) then    
send(msg.chat_id_, msg.id_,"Send Me The Word Now💘 ")  
database:set(bot_id.."BROK:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"reppp")  
return false  end
if text then 
local test = database:get(bot_id.."BROK:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test and test == "reppp" then   
send(msg.chat_id_, msg.id_,"Done💘 ")  
database:del(bot_id.."BROK:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:del(bot_id.."BROK:Add:Filter:Rp2"..text..msg.chat_id_)  
database:srem(bot_id.."BROK:List:Filter"..msg.chat_id_,text)  
return false  end  
end

if text == "مسح البوتات" or text == "Clear Bots" and Addictive(msg) then 
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah)  
local admins = tah.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if tah.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(bot_id) then
Kick_Group(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
send(msg.chat_id_, msg.id_, "Not Found Bots Here💘")
else
local t = "Count Bots💘 >> {"..c.."}\n Admins Bots💘 >> {"..x.."}\n I'm Kiked >> {"..(c - x).."} From Bots💘"
send(msg.chat_id_, msg.id_,t) 
end 
end,nil)  
end   
if text == ("كشف البوتات") or text == ("Bots") and Addictive(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = "\n Bots in Group💘 \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,ta) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
tr = ""
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
tr = " {✯}"
end
text = text..">> [@"..ta.username_.."]"..tr.."\n"
if #admins == 0 then
send(msg.chat_id_, msg.id_, "Not Found Bots Here💘")
return false 
end
if #admins == i then 
local a = "\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n Count Bots in Group💘 >> {"..n.."} \n"
local f = "Admins Bot💘 >> {"..t.."}\n [ Note : - This Mark (✯) Mean The Bot is Admin"
send(msg.chat_id_, msg.id_, text..a..f)
end
end,nil)
end
end,nil)
end

if database:get(bot_id.."BROK:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "Stop" then 
send(msg.chat_id_, msg.id_, "Done💘") 
database:del(bot_id.."BROK:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false  
end 
database:set(bot_id.."BROK:Set:Rules:Group" .. msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,"Done Save Rules💘") 
database:del(bot_id.."BROK:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end  

if text == "ضع قوانين" or text == "وضع قوانين" or text == "Put Rules" then 
if Addictive(msg) then 
database:setex(bot_id.."BROK:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_,msg.id_,"Send Me Rules💘")  
end
end
if text == "مسح القوانين" or text == "Rem Rules" or text == "حذف القوانين" then  
if Addictive(msg) then
send(msg.chat_id_, msg.id_,"Done Remove Rules💘")  
database:del(bot_id.."BROK:Set:Rules:Group"..msg.chat_id_) 
end
end
if text == "القوانين" or text == "Rules" then 
local Set_Rules = database:get(bot_id.."BROK:Set:Rules:Group" .. msg.chat_id_)   
if Set_Rules then     
send(msg.chat_id_,msg.id_, Set_Rules)   
else      
send(msg.chat_id_, msg.id_,"No Rules Here💘")   
end    
end
 
if text == "الاوامر المضافه" or text == "Orders Add" and Constructor(msg) then
local list = database:smembers(bot_id.."BROK:List:Cmd:Group:New"..msg.chat_id_.."")
t = "- Add Orders Menu💘  \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
Cmds = database:get(bot_id.."BROK:Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."- ("..v..") ~ {"..Cmds.."}\n"
else
t = t..""..k.."- ("..v..") \n"
end
end
if #list == 0 then
t = "Not Found Orders Add💘"
end
send(msg.chat_id_, msg.id_,"["..t.."]")
end
if text == "حذف الاوامر المضافه" or text == "مسح الاوامر المضافه" or text == "Rem Orders Add" then
if Constructor(msg) then 
local list = database:smembers(bot_id.."BROK:List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."BROK:Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
database:del(bot_id.."BROK:List:Cmd:Group:New"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"Done Remove All Orders Add Already💘")  
end
end
if text == "اضف امر" or text == "Add Order" and Constructor(msg) then
database:set(bot_id.."BROK:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_,"Send Me The Order💘")  
return false
end
if text == "حذف امر" or text == "مسح امر" or text == "Rem Order" then 
if Constructor(msg) then
database:set(bot_id.."BROK:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_,"Send Me The Order💘")  
return false
end
end
 
if text == "الصلاحيات" or text == "Powers" and Addictive(msg) then 
local list = database:smembers(bot_id.."BROK:Coomds"..msg.chat_id_)
if #list == 0 then
send(msg.chat_id_, msg.id_,"Not Found Powers💘")
return false
end
t = "\n Powers Menu💘 \n━━━━━━━━━━━━━\n"
for k,v in pairs(list) do
var = database:get(bot_id.."BROK:Comd:New:rt:bot:"..v..msg.chat_id_)
if var then
t = t..""..k.."- "..v.." ~ ("..var..")\n"
else
t = t..""..k.."- "..v.."\n"
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == "مسح الصلاحيات" or text == "Rem Powers" then
local list = database:smembers(bot_id.."BROK:Coomds"..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."BROK:Comd:New:rt:bot:"..v..msg.chat_id_)
database:del(bot_id.."BROK:Coomds"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"Done Remove All Powers💘")
end
if text and text:match("^اضف صلاحيه (.*)$") and Addictive(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
database:set(bot_id.."BROK:Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
database:sadd(bot_id.."BROK:Coomds"..msg.chat_id_,ComdNew)  
database:setex(bot_id.."BROK:Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
send(msg.chat_id_, msg.id_, "ارسل نوع الصلاحيه \n (عضو ~ مميز  ~ ادمن  ~ مدير )") 
end
if text and text:match("^مسح صلاحيه (.*)$") and Addictive(msg) or text and text:match("^حذف صلاحيه (.*)$") and Addictive(msg) then 
ComdNew = text:match("^مسح صلاحيه (.*)$") or text:match("^حذف صلاحيه (.*)$")
database:del(bot_id.."BROK:Comd:New:rt:bot:"..ComdNew..msg.chat_id_)
send(msg.chat_id_, msg.id_, "تم مسح الصلاحيه ") 
end
if database:get(bot_id.."BROK:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,"تم الغاء الامر ") 
database:del(bot_id.."BROK:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_"ارسل نوع الصلاحيه مره اخر \n تستطيع اضافة صلاحيه (عضو ~ مميز  ~ ادمن )") 
return false
end
end
if text == "ادمن" then
if not Owner(msg) then 
send(msg.chat_id_, msg.id_"ارسل نوع الصلاحيه مره اخر\n تستطيع اضافة صلاحيه ( عضو ~ مميز )") 
return false
end
end
if text == "مميز" then
if not Addictive(msg) then
send(msg.chat_id_, msg.id_"ارسل نوع الصلاحيه مره اخر\n تستطيع اضافة صلاحيه ( عضو )") 
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = database:get(bot_id.."BROK:Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
database:set(bot_id.."BROK:Comd:New:rt:bot:"..textn..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, "تم اضافة صلاحية ") 
database:del(bot_id.."BROK:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("^تغير رد المطور (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد المطور (.*)$") 
database:set(bot_id.."BROK:Sudo:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_," تم تغير رد المطور الى » "..Teext)
end
if text and text:match("^تغير رد المنشئ الاساسي (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد المنشئ الاساسي (.*)$") 
database:set(bot_id.."BROK:BasicConstructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_," تم تغير رد المنشئ الاساسي الى » "..Teext)
end
if text and text:match("^تغير رد المنشئ (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد المنشئ (.*)$") 
database:set(bot_id.."BROK:Constructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_," تم تغير رد المنشئ الى » "..Teext)
end
if text and text:match("^تغير رد المدير (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد المدير (.*)$") 
database:set(bot_id.."BROK:Manager:Rd"..msg.chat_id_,Teext) 
send(msg.chat_id_, msg.id_," تم تغير رد المدير الى » "..Teext)
end
if text and text:match("^تغير رد الادمن (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد الادمن (.*)$") 
database:set(bot_id.."BROK:Mod:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_," تم تغير رد الادمن الى » "..Teext)
end
if text and text:match("^تغير رد المميز (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد المميز (.*)$") 
database:set(bot_id.."BROK:Special:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_," تم تغير رد المميز الى » "..Teext)
end
if text and text:match("^تغير رد العضو (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد العضو (.*)$") 
database:set(bot_id.."BROK:Memp:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_," تم تغير رد العضو الى » "..Teext)
end


if text == ("مسح ردود المدير") or text == ("Rem Manger Replays") and Owner(msg) then
local list = database:smembers(bot_id.."BROK:List:Manager"..msg.chat_id_.."")
for k,v in pairs(list) do
database:del(bot_id.."BROK:Add:Rd:Manager:Gif"..v..msg.chat_id_)   
database:del(bot_id.."BROK:Add:Rd:Manager:Vico"..v..msg.chat_id_)   
database:del(bot_id.."BROK:Add:Rd:Manager:Stekrs"..v..msg.chat_id_)     
database:del(bot_id.."BROK:Add:Rd:Manager:Text"..v..msg.chat_id_)   
database:del(bot_id.."BROK:Add:Rd:Manager:Photo"..v..msg.chat_id_)
database:del(bot_id.."BROK:Add:Rd:Manager:Video"..v..msg.chat_id_)
database:del(bot_id.."BROK:Add:Rd:Manager:File"..v..msg.chat_id_)
database:del(bot_id.."BROK:Add:Rd:Manager:Audio"..v..msg.chat_id_)
database:del(bot_id.."BROK:List:Manager"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"Done Remove Manger Replayes💘")
end
if text == ("ردود المدير") or text == ("Manger Replays") and Owner(msg) then
local list = database:smembers(bot_id.."BROK:List:Manager"..msg.chat_id_.."")
text = "Manger Replays Menu💘 \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if database:get(bot_id.."BROK:Add:Rd:Manager:Gif"..v..msg.chat_id_) then
db = "GIF💘"
elseif database:get(bot_id.."BROK:Add:Rd:Manager:Vico"..v..msg.chat_id_) then
db = "Voice💘"
elseif database:get(bot_id.."BROK:Add:Rd:Manager:Stekrs"..v..msg.chat_id_) then
db = "Sticker💘"
elseif database:get(bot_id.."BROK:Add:Rd:Manager:Text"..v..msg.chat_id_) then
db = "Mesaage💘"
elseif database:get(bot_id.."BROK:Add:Rd:Manager:Photo"..v..msg.chat_id_) then
db = "Pic💘"
elseif database:get(bot_id.."BROK:Add:Rd:Manager:Video"..v..msg.chat_id_) then
db = "Video💘"
elseif database:get(bot_id.."BROK:Add:Rd:Manager:File"..v..msg.chat_id_) then
db = "File💘"
elseif database:get(bot_id.."BROK:Add:Rd:Manager:Audio"..v..msg.chat_id_) then
db = "Music💘"
end
text = text..""..k..">> ("..v..") » {"..db.."}\n"
end
if #list == 0 then
text = "Not Found Replayes To Manger💘"
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = database:get(bot_id.."BROK:Text:Manager"..msg.sender_user_id_..":"..msg.chat_id_.."")
if database:get(bot_id.."BROK:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:del(bot_id.."BROK:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
if msg.content_.sticker_ then   
database:set(bot_id.."BROK:Add:Rd:Manager:Stekrs"..test..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
database:set(bot_id.."BROK:Add:Rd:Manager:Vico"..test..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
database:set(bot_id.."BROK:Add:Rd:Manager:Gif"..test..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."BROK:Add:Rd:Manager:Text"..test..msg.chat_id_, text)  
end  
if msg.content_.audio_ then
database:set(bot_id.."BROK:Add:Rd:Manager:Audio"..test..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
database:set(bot_id.."BROK:Add:Rd:Manager:File"..test..msg.chat_id_, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
database:set(bot_id.."BROK:Add:Rd:Manager:Video"..test..msg.chat_id_, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."BROK:Add:Rd:Manager:Photo"..test..msg.chat_id_, photo_in_group)  
end
send(msg.chat_id_, msg.id_,"Done Save Replay💘")
return false  
end  
end
if text == "اضف رد" or text == "Add Replay" and Owner(msg) then
send(msg.chat_id_, msg.id_,"Send Me The Word💘")
database:set(bot_id.."BROK:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text == "حذف رد" or text == "Rem Replay" and Owner(msg) then
send(msg.chat_id_, msg.id_,"Sned Me The Word💘")
database:set(bot_id.."BROK:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,"true2")
return false 
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."BROK:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, 'Send Me The Replay Now [ GIF & Pic & Music & .....]💘 \n You Can Add💘 :\n- `#username` > UserName \n- `#msgs` > Messages💘 \n- `#name` > Name💘\n- `#id` > User ID💘\n- `#stast` > User Stast💘 \n- `#edit` > Edited Messages💘 ')
database:set(bot_id.."BROK:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,"true1")
database:set(bot_id.."BROK:Text:Manager"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:del(bot_id.."BROK:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."BROK:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."BROK:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."BROK:Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."BROK:Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."BROK:Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."BROK:Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."BROK:Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:sadd(bot_id.."BROK:List:Manager"..msg.chat_id_.."", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."BROK:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_.."") == "true2" then
send(msg.chat_id_, msg.id_,"Done Remove The Replay💘")
database:del(bot_id.."BROK:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."BROK:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."BROK:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."BROK:Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."BROK:Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."BROK:Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."BROK:Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."BROK:Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:del(bot_id.."BROK:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."BROK:List:Manager"..msg.chat_id_.."", text)
return false
end
end
if text and not database:get(bot_id.."BROK:Reply:Manager"..msg.chat_id_) then
if not database:sismember(bot_id..'BROK:Spam:Group'..msg.sender_user_id_,text) then
local anemi = database:get(bot_id.."BROK:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
local veico = database:get(bot_id.."BROK:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
local stekr = database:get(bot_id.."BROK:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
local Text = database:get(bot_id.."BROK:Add:Rd:Manager:Text"..text..msg.chat_id_)   
local photo = database:get(bot_id.."BROK:Add:Rd:Manager:Photo"..text..msg.chat_id_)
local video = database:get(bot_id.."BROK:Add:Rd:Manager:Video"..text..msg.chat_id_)
local document = database:get(bot_id.."BROK:Add:Rd:Manager:File"..text..msg.chat_id_)
local audio = database:get(bot_id.."BROK:Add:Rd:Manager:Audio"..text..msg.chat_id_)
if Text then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,data)
local NumMsg = database:get(bot_id..'BROK:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'BROK:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = Text:gsub('#username',(data.username_ or 'Not Found💘')) 
local Text = Text:gsub('#name',data.first_name_)
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',message_edit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
send(msg.chat_id_, msg.id_, Text)
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end,nil)
end
if stekr then 
sendSticker(msg.chat_id_,msg.id_,stekr)
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_,veico,"")
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_,video,"")
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end
if anemi then 
sendAnimation(msg.chat_id_, msg.id_,anemi,"")   
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, document)   
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_,msg.id_,photo,photo_caption)
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end  
end
end
------------------------------------------------------------------------
if text == ("مسح ردود المطور") or text == ("Rem Dev Replays") and DevBROK(msg) then 
local list = database:smembers(bot_id.."BROK:List:Rd:Sudo")
for k,v in pairs(list) do
database:del(bot_id.."BROK:Add:Rd:Sudo:Gif"..v)   
database:del(bot_id.."BROK:Add:Rd:Sudo:vico"..v)   
database:del(bot_id.."BROK:Add:Rd:Sudo:stekr"..v)     
database:del(bot_id.."BROK:Add:Rd:Sudo:Text"..v)   
database:del(bot_id.."BROK:Add:Rd:Sudo:Photo"..v)
database:del(bot_id.."BROK:Add:Rd:Sudo:Video"..v)
database:del(bot_id.."BROK:Add:Rd:Sudo:File"..v)
database:del(bot_id.."BROK:Add:Rd:Sudo:Audio"..v)
database:del(bot_id.."BROK:List:Rd:Sudo")
end
send(msg.chat_id_, msg.id_,"Done Remove Dev Replays💘")
end
if text == ("ردود المطور") or text == ("Dev Replays") and DevBROK(msg) then 
local list = database:smembers(bot_id.."BROK:List:Rd:Sudo")
text = "\n Dev Replays💘 \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if database:get(bot_id.."BROK:Add:Rd:Sudo:Gif"..v) then
db = "GIF💘"
elseif database:get(bot_id.."BROK:Add:Rd:Sudo:vico"..v) then
db = "Voice💘"
elseif database:get(bot_id.."BROK:Add:Rd:Sudo:stekr"..v) then
db = "Sticker💘"
elseif database:get(bot_id.."BROK:Add:Rd:Sudo:Text"..v) then
db = "Message💘"
elseif database:get(bot_id.."BROK:Add:Rd:Sudo:Photo"..v) then
db = "Pic💘"
elseif database:get(bot_id.."BROK:Add:Rd:Sudo:Video"..v) then
db = "Video💘"
elseif database:get(bot_id.."BROK:Add:Rd:Sudo:File"..v) then
db = "File💘"
elseif database:get(bot_id.."BROK:Add:Rd:Sudo:Audio"..v) then
db = "Music💘"
end
text = text..""..k.." >> ("..v..") » {"..db.."}\n"
end
if #list == 0 then
text = "Not Found Dev Reolays💘"
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = database:get(bot_id.."BROK:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."BROK:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:del(bot_id.."BROK:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_)
if msg.content_.sticker_ then   
database:set(bot_id.."BROK:Add:Rd:Sudo:stekr"..test, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
database:set(bot_id.."BROK:Add:Rd:Sudo:vico"..test, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
database:set(bot_id.."BROK:Add:Rd:Sudo:Gif"..test, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."BROK:Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content_.audio_ then
database:set(bot_id.."BROK:Add:Rd:Sudo:Audio"..test, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
database:set(bot_id.."BROK:Add:Rd:Sudo:File"..test, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
database:set(bot_id.."BROK:Add:Rd:Sudo:Video"..test, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."BROK:Add:Rd:Sudo:Photo"..test, photo_in_group)  
end
send(msg.chat_id_, msg.id_,"Done Save Replay💘")
return false  
end  
end

if text == "اضف رد للكل" or text == "Add Replay To All" and DevBROK(msg) then 
send(msg.chat_id_, msg.id_,"Send Me The Word Now💘")
database:set(bot_id.."BROK:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text == "حذف رد للكل" or text == "Rem Replay To All" and DevBROK(msg) then 
send(msg.chat_id_, msg.id_,"Send Me The Word Now💘")
database:set(bot_id.."BROK:Set:On"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."BROK:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, 'Send Me The Replay Now [ GIF & Pic & Music & .....]💘 \n You Can Add💘 :\n- `#username` > UserName \n- `#msgs` > Messages💘 \n- `#name` > Name💘\n- `#id` > User ID💘\n- `#stast` > User Stast💘 \n- `#edit` > Edited Messages💘 ')
database:set(bot_id.."BROK:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_, "true1")
database:set(bot_id.."BROK:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:sadd(bot_id.."BROK:List:Rd:Sudo", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."BROK:Set:On"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_,"Done Remove Dev Replay💘")
list = {"Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do 
database:del(bot_id..'BROK:'..v..text)
end
database:del(bot_id.."BROK:Set:On"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."BROK:List:Rd:Sudo", text)
return false
end
end

if text and not database:get(bot_id.."BROK:Reply:Sudo"..msg.chat_id_) then
if not database:sismember(bot_id..'BROK:Spam:Group'..msg.sender_user_id_,text) then
local anemi = database:get(bot_id.."BROK:Add:Rd:Sudo:Gif"..text)   
local veico = database:get(bot_id.."BROK:Add:Rd:Sudo:vico"..text)   
local stekr = database:get(bot_id.."BROK:Add:Rd:Sudo:stekr"..text)     
local Text = database:get(bot_id.."BROK:Add:Rd:Sudo:Text"..text)   
local photo = database:get(bot_id.."BROK:Add:Rd:Sudo:Photo"..text)
local video = database:get(bot_id.."BROK:Add:Rd:Sudo:Video"..text)
local document = database:get(bot_id.."BROK:Add:Rd:Sudo:File"..text)
local audio = database:get(bot_id.."BROK:Add:Rd:Sudo:Audio"..text)

if Text then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,data)
local NumMsg = database:get(bot_id..'BROK:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'BROK:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = Text:gsub('#username',(data.username_ or 'لا يوجد')) 
local Text = Text:gsub('#name',data.first_name_)
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',message_edit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
send(msg.chat_id_, msg.id_,Text)
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end,nil)
end
if stekr then 
sendSticker(msg.chat_id_,msg.id_,stekr) 
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_,veico,"")
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_,video,"")
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end
if anemi then 
sendAnimation(msg.chat_id_, msg.id_,anemi,"")   
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, document)     
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_,msg.id_,photo,"")
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
end  
end
end
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' or text == "Kik iran" then  
if Addictive(msg) then    
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
Kick_Group(msg.chat_id_, data.id_)
end
end,nil)
end
send(msg.chat_id_, msg.id_,'Done💘')
end,nil)
end
end

if text == "تفعيل ردود المدير" or text == "Play Manger Replays" and Owner(msg) then   
database:del(bot_id.."BROK:Reply:Manager"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"Done💘") 
end
if text == "تعطيل ردود المدير" or text == "Stop Manger Replays" and Owner(msg) then  
database:set(bot_id.."BROK:Reply:Manager"..msg.chat_id_,true)  
send(msg.chat_id_, msg.id_,"Done💘" ) 
end
if text == "تفعيل ردود المطور" or text == "Play Dev Replays" and Owner(msg) then   
database:del(bot_id.."BROK:Reply:Sudo"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"Done💘" ) 
end
if text == "تعطيل ردود المطور" or text == "Stop Dev Replays" and Owner(msg) then  
database:set(bot_id.."BROK:Reply:Sudo"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_,"Done💘" ) 
end

if text == ("تنزيل الكل") or text == ("Rem All") and msg.reply_to_message_id_ ~= 0 and Owner(msg) then
function Function_BROK(extra, result, success)
if tonumber(SUDO) == tonumber(result.sender_user_id_) then
send(msg.chat_id_, msg.id_,"You Can Not Do This With Main Dev💘")
return false 
end
if database:sismember(bot_id.."BROK:Sudo:User",result.sender_user_id_) then
dev = "Dev💘" else dev = "" end
if database:sismember(bot_id.."BROK:Basic:Constructor"..msg.chat_id_, result.sender_user_id_) then
crr = "Main Owner💘" else crr = "" end
if database:sismember(bot_id.."BROK:Constructor"..msg.chat_id_, result.sender_user_id_) then
cr = "Owner💘" else cr = "" end
if database:sismember(bot_id.."BROK:Manager"..msg.chat_id_, result.sender_user_id_) then
own = "Manger💘" else own = "" end
if database:sismember(bot_id.."BROK:Mod:User"..msg.chat_id_, result.sender_user_id_) then
mod = "Admin💘" else mod = "" end
if database:sismember(bot_id.."BROK:Special:User"..msg.chat_id_, result.sender_user_id_) then
vip = "Elite Member💘" else vip = ""
end
if Rank_Checking(result.sender_user_id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n Done Remove He \n { "..dev..""..crr..""..cr..""..own..""..mod..""..vip.." } \n")
else
send(msg.chat_id_, msg.id_,"\n He is Member💘 \n")
end
if tonumber(Id_Sudo) == tonumber(msg.sender_user_id_) then
database:srem(bot_id.."BROK:Sudo:User", result.sender_user_id_)
database:srem(bot_id.."BROK:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."BROK:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."BROK:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."BROK:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."BROK:Special:User"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."BROK:Sudo:User",msg.sender_user_id_) then
database:srem(bot_id.."BROK:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."BROK:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."BROK:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."BROK:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."BROK:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
elseif database:sismember(bot_id.."BROK:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."BROK:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."BROK:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."BROK:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."BROK:Constructor"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."BROK:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."BROK:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."BROK:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."BROK:Manager"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."BROK:Manager"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."BROK:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."BROK:Special:User"..msg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
end
if text == "تاك للكل" or text == "Tag All" and Addictive(msg) then
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""), offset_ = 0,limit_ = 200},function(ta,BROK)
local t = "\n Menu Members💘 \n━━━━━━━━━━━━━\n"
x = 0
local list = BROK.members_
for k, v in pairs(list) do
x = x + 1
if database:get(bot_id.."BROK:User:Name"..v.user_id_) then
t = t..""..x.." - {[@"..database:get(bot_id.."BROK:User:Name"..v.user_id_).."]}\n"
else
t = t..""..x.." - {"..v.user_id_.."}\n"
end
end
send(msg.chat_id_,msg.id_,t)
end,nil)
end

if text == "رتبتي" or text == "MY Rank" then
local rtp = Get_Rank(msg.sender_user_id_,msg.chat_id_)
send(msg.chat_id_, msg.id_,"Your Rank is💘 » "..rtp)
end
if text == "اسمي" or text == "MY Name"  then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.first_name_  then
first_name = "Your First Name💘 ← {`"..(result.first_name_).."`}"
else
first_name = ""
end   
if result.last_name_ then 
last_name = "Your Second Name💘 ← {`"..result.last_name_.."`}" 
else
last_name = ""
end      
send(msg.chat_id_, msg.id_,first_name.."\n"..last_name) 
end,nil)
end 
if text==("عدد الكروب") or text == ("Group Count") and Addictive(msg) then  
if msg.can_be_deleted_ == false then 
send(msg.chat_id_,msg.id_,"I'm Not Admin Here💘 \n") 
return false  
end 
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
local BROK = "Admins💘 : "..data.administrator_count_..
"\n\n Kiked💘 : "..data.kicked_count_..
"\n\n Members💘 : "..data.member_count_..
"\n\n Group Messages💘 : "..(msg.id_/2097152/0.5)..
"\n\n Group Name💘 : ["..ta.title_.."]"
send(msg.chat_id_, msg.id_, BROK) 
end,nil)
end,nil)
end 

if text and text:match("^رفع القيود @(.*)") and Owner(msg) then 
local username = text:match("^رفع القيود @(.*)") 
if result.id_ then
if DevBROK(msg) then
database:srem(bot_id.."BROK:GBan:User",result.id_)
database:srem(bot_id.."BROK:Ban:User"..msg.chat_id_,result.id_)
database:srem(bot_id.."BROK:Muted:User"..msg.chat_id_,result.id_)
usertext = "\n The Member💘  » ["..result.title_.."](t.me/"..(username or "xBROKK")..")"
status  = "\n Done Lift The Restrictions On He💘"
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
else 
database:srem(bot_id.."BROK:Ban:User"..msg.chat_id_,result.id_)
database:srem(bot_id.."BROK:Muted:User"..msg.chat_id_,result.id_)
Reply_Status(msg,result.id_,"reply","\n Done Lift The Restrictions On He💘")  
end
else
Text = "Error UserName💘"
send(msg.chat_id_, msg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
end
if text == "رفع القيود" or text == "Lift The Restrictions" and Owner(msg) then
if DevBROK(msg) then
database:srem(bot_id.."BROK:GBan:User",result.sender_user_id_)
database:srem(bot_id.."BROK:Ban:User"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."BROK:Muted:User"..msg.chat_id_,result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","\n Done Lift The Restrictions On He💘")  
else
database:srem(bot_id.."BROK:Ban:User"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."BROK:Muted:User"..msg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = "\n The Member » ["..data.first_name_.."](t.me/"..(data.username_ or "BROK")..")"
status  = "\n Done Lift The Restrictions On He💘"
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
end
if text and text:match("^كشف القيود @(.*)") and Owner(msg) then 
local username = text:match("^كشف القيود @(.*)") 
if result.id_ then
if database:sismember(bot_id.."BROK:Muted:User"..msg.chat_id_,result.id_) then
Muted = "Muted💘"
else
Muted = "Not Muted💘"
end
if database:sismember(bot_id.."BROK:Ban:User"..msg.chat_id_,result.id_) then
Ban = "Blocked💘"
else
Ban = "Not Blocked💘"
end
if database:sismember(bot_id.."BROK:GBan:User",result.id_) then
GBan = "Banned💘"
else
GBan = "Not Banned💘"
end
send(msg.chat_id_, msg.id_,"Ban 💘 » "..GBan.."\n Block💘 » "..Ban.."\n Mute💘 » "..Muted)
else
send(msg.chat_id_, msg.id_,"Error UserName💘")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
end

if text == "كشف القيود" or text == "Restrictions" and Owner(msg) then 
if database:sismember(bot_id.."BROK:Muted:User"..msg.chat_id_,result.sender_user_id_) then
Muted = "Muted💘"
else
Muted = "Not Muted💘"
end
if database:sismember(bot_id.."BROK:Ban:User"..msg.chat_id_,result.sender_user_id_) then
Ban = "Blocked💘"
else
Ban = "Not Blocked💘"
end
if database:sismember(bot_id.."BROK:GBan:User",result.sender_user_id_) then
GBan = "Banned💘"
else
GBan = "Not Blocked💘"
end
Textt = "Ban💘 » "..GBan.."\n Block💘 » "..Ban.."\n Mute💘 » "..Muted..""
send(msg.chat_id_, msg.id_,Textt)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
end

if text and text:match("^ضع اسم (.*)") and Owner(msg) or text and text:match("^وضع اسم (.*)") and Owner(msg) then 
local Name = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = Name },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"I'm Not Admin Here💘")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"I Have Not This Command💘")  
else
send(msg.chat_id_,msg.id_,"Done Change Group Name To 💘 \n  {["..Name.."]}")  
end
end,nil) 
end

if text ==("رفع الادمنيه") or text == ("Add Admins") and Owner(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id.."BROK:Mod:User"..msg.chat_id_, admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
database:srem(bot_id.."BROK:Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
database:srem(bot_id.."BROK:Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end
if num2 == 0 then
send(msg.chat_id_, msg.id_,"Not Found Admins💘") 
else
send(msg.chat_id_, msg.id_,"Done Add { "..num2.." } From Group Admins💘") 
end
end,nil)   
end
if text ==("المنشئ") or text == ("Owner") then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_,"Account Owner id Deleted💘")
return false  
end
local UserName = (b.username_ or "xBROKK")
send(msg.chat_id_, msg.id_,"Geoup Owner💘 ~ ["..b.first_name_.."](T.me/"..UserName..")")  
end,nil)   
end
end
end,nil)   
end
if text ==("رفع المنشئ") or text == ("UP The Owner") and DevBot(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_,"Account Owner is Deleted💘")
return false  
end
local UserName = (b.username_ or "xBROKK")
send(msg.chat_id_, msg.id_,"Done UP Owner The Group ~ ["..b.first_name_.."](T.me/"..UserName..")")  
database:sadd(bot_id.."BROK:Basic:Constructor"..msg.chat_id_,b.id_)
end,nil)   
end,nil)   
end

if text == "غادر" or text == "out" then 
if DevBot(msg) and not database:get(bot_id.."BROK:Left:Bot"..msg.chat_id_) then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,"Done Left The Group💘") 
database:srem(bot_id.."BROK:Chek:Groups",msg.chat_id_)  
end
return false  
end
if text and text:match("^غادر (-%d+)$") then
local GP_ID = {string.match(text, "^(غادر) (-%d+)$")}
if DevBot(msg) and not database:get(bot_id.."BROK:Left:Bot"..msg.chat_id_) then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=GP_ID[2],user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,"Done Left The Group💘") 
send(GP_ID[2], 0,"Done Left The Group BY Command From MY Dev💘") 
database:srem(bot_id.."BROK:Chek:Groups",GP_ID[2])  
return false 
end
end
if text == "تفعيل المغادره" or text == "Play Leave" and DevBROK(msg) then   
database:del(bot_id.."BROK:Left:Bot"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"Done💘") 
return false 
end
if text == "تعطيل المغادره" or text == "Stop Leave" and DevBROK(msg) then  
database:set(bot_id.."BROK:Left:Bot"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_, "Done💘") 
return false 
end
if text == (database:get(bot_id.."BROK:Name:Bot") or "بروك") then
Namebot = (database:get(bot_id.."BROK:Name:Bot") or "بروك")
local namebot = {
"عمري فداك "..Namebot.. " كول حب ",
"كول حبيبي ؟ اني "..Namebot,
'ها حبي وياك مكتب ئلسيد .',
'الو الو رد مخنوك',
'ها يحلو كول',
'عمري الحلو',
'صاعد اتصال ويا الحب دقيقة وجيك 😘💘',
'مشغول حالياً 🌚🌸',
'لابسك لتلح',
'دالعب وي عبوصي لك',
'دامصمص بفرمان نتظر',
'كاعد يم توف حلمك اجاوب؟',
'نازل وي يوسف باي',
'داتنايج وي زيودي',
" هايروحي؟ "..Namebot,
}
name = math.random(#namebot)
send(msg.chat_id_, msg.id_, namebot[name]) 
return false 
end

if text == "بوت" then
Namebot = (database:get(bot_id.."BROK:Name:Bot") or "بروك")
send(msg.chat_id_, msg.id_,"MY Name💘 ["..Namebot.."] ") 
end
if text == "تغير اسم البوت" or text == "تغيير اسم البوت" or text == "Change Bot Name" then 
if DevBROK(msg) then
database:setex(bot_id.."BROK:Set:Name:Bot"..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_,"Send Me The Name Now💘 ")  
end
return false
end

if text ==("مسح المطرودين") or text == ("Rem Kiked") and Addictive(msg) then    
local function delbans(extra, result)  
if not msg.can_be_deleted_ == true then  
send(msg.chat_id_, msg.id_, "I'm Not Admin Here💘") 
return false
end  
local num = 0 
for k,y in pairs(result.members_) do 
num = num + 1  
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = y.user_id_, status_ = { ID = "ChatMemberStatusLeft"}, }, dl_cb, nil)  
end  
send(msg.chat_id_, msg.id_,"Done UnBlock  - "..num.." - Members💘 ") 
end    
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, delbans, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
if text=="اذاعه خاص" or text == "Share D" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."BROK:Status:Bc") and not DevBROK(msg) then 
send(msg.chat_id_, msg.id_,"The Share is Stpoed BY Dev💘")
return false
end
database:setex(bot_id.."BROK:BROK:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"Send Me Any Thing To Share it \n To Close it Send [ Close & الغاء ]💘") 
return false
end 
if text=="اذاعه" or text == "Share" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."BROK:Status:Bc") and not DevBROK(msg) then 
send(msg.chat_id_, msg.id_,"The Share is Stoped BY Dev💘")
return false
end
database:setex(bot_id.."BROK:BROK:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"Send Me Any Thing To Share it \n To Close it Send [ Close & الغاء ]💘") 
return false
end  
if text=="اذاعه بالتثبيت" or text == "Share With Pin" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."BROK:Status:Bc") and not DevBROK(msg) then 
send(msg.chat_id_, msg.id_,"The Share is Stop BY Dev💘")
return false
end
database:setex(bot_id.."BROK:BROK:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"Send Ms Any Thing To Sahre it \n To Close it Send [ Close & الغاء ]💘 ") 
return false
end  
if text=="اذاعه بالتوجيه" or text == "Share With ForWard" and msg.reply_to_message_id_ == 0  and DevBot(msg) then 
if database:get(bot_id.."BROK:Status:Bc") and not DevBROK(msg) then 
send(msg.chat_id_, msg.id_,"The Share is Stop BY Dev💘")
return false
end
database:setex(bot_id.."BROK:BROK:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"Sned Me ForWard Now💘") 
return false
end 
if text=="اذاعه بالتوجيه خاص" or text == "Share With ForWard D" and msg.reply_to_message_id_ == 0  and DevBot(msg) then 
if database:get(bot_id.."BROK:Status:Bc") and not DevBROK(msg) then 
send(msg.chat_id_, msg.id_,"The Share is Stop BY Dev💘")
return false
end
database:setex(bot_id.."BROK:BROK:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"Send Me ForWard Now💘") 
return false
end 

if text == "تفعيل الاذاعه" or text == "Play Share" and DevBROK(msg) then  
database:del(bot_id.."BROK:Status:Bc") 
send(msg.chat_id_, msg.id_,"\n Done💘 " ) 
return false
end 
if text == "تعطيل الاذاعه" or text == "Close Share" and DevBROK(msg) then  
database:set(bot_id.."BROK:Status:Bc",true) 
send(msg.chat_id_, msg.id_,"\n Done💘") 
return false
end 

if text == "الاعدادات" or text == "Settings" and Addictive(msg) then    
if database:get(bot_id.."BROK:lockpin"..msg.chat_id_) then    
lock_pin = "✓"
else 
lock_pin = "✘"    
end
if database:get(bot_id.."BROK:Lock:tagservr"..msg.chat_id_) then    
lock_tagservr = "✓"
else 
lock_tagservr = "✘"    
end
if database:get(bot_id.."BROK:Lock:text"..msg.chat_id_) then    
lock_text = "✓"
else 
lock_text = "✘"    
end
if database:get(bot_id.."BROK:Lock:AddMempar"..msg.chat_id_) == "kick" then
lock_add = "✓"
else 
lock_add = "✘"    
end    
if database:get(bot_id.."BROK:Lock:Join"..msg.chat_id_) == "kick" then
lock_join = "✓"
else 
lock_join = "✘"    
end    
if database:get(bot_id.."BROK:Lock:edit"..msg.chat_id_) then    
lock_edit = "✓"
else 
lock_edit = "✘"    
end
if database:get(bot_id.."BROK:Get:Welcome:Group"..msg.chat_id_) then
welcome = "✓"
else 
welcome = "✘"    
end
if database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_, "flood") == "kick" then     
flood = "Kiked💘"     
elseif database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"flood") == "keed" then     
flood = "Restriction💘"      
elseif database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"flood") == "mute" then     
flood = "Mute💘"           
elseif database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"flood") == "del" then     
flood = "Remove💘"           
else     
flood = "✘"     
end
if database:get(bot_id.."BROK:Lock:Photo"..msg.chat_id_) == "del" then
lock_photo = "✓" 
elseif database:get(bot_id.."BROK:Lock:Photo"..msg.chat_id_) == "ked" then 
lock_photo = "Restriction💘"   
elseif database:get(bot_id.."BROK:Lock:Photo"..msg.chat_id_) == "ktm" then 
lock_photo = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:Photo"..msg.chat_id_) == "kick" then 
lock_photo = "Kiked💘"   
else
lock_photo = "✘"   
end    
if database:get(bot_id.."BROK:Lock:Contact"..msg.chat_id_) == "del" then
lock_phon = "✓" 
elseif database:get(bot_id.."BROK:Lock:Contact"..msg.chat_id_) == "ked" then 
lock_phon = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:Contact"..msg.chat_id_) == "ktm" then 
lock_phon = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:Contact"..msg.chat_id_) == "kick" then 
lock_phon = "Kiked💘"    
else
lock_phon = "✘"    
end    
if database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) == "del" then
lock_links = "✓"
elseif database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) == "ked" then
lock_links = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) == "ktm" then
lock_links = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) == "kick" then
lock_links = "Kiked💘"    
else
lock_links = "✘"    
end
if database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) == "del" then
lock_cmds = "✓"
elseif database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) == "ked" then
lock_cmds = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) == "ktm" then
lock_cmds = "Mute💘"   
elseif database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) == "kick" then
lock_cmds = "Kiked💘"    
else
lock_cmds = "✘"    
end
if database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) == "del" then
lock_user = "✓"
elseif database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) == "ked" then
lock_user = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) == "ktm" then
lock_user = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) == "kick" then
lock_user = "Kiked💘"    
else
lock_user = "✘"    
end
if database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) == "del" then
lock_hash = "✓"
elseif database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) == "ked" then 
lock_hash = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) == "ktm" then 
lock_hash = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) == "kick" then 
lock_hash = "Kiked💘"    
else
lock_hash = "✘"    
end
if database:get(bot_id.."BROK:Lock:vico"..msg.chat_id_) == "del" then
lock_muse = "✓"
elseif database:get(bot_id.."BROK:Lock:vico"..msg.chat_id_) == "ked" then 
lock_muse = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:vico"..msg.chat_id_) == "ktm" then 
lock_muse = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:vico"..msg.chat_id_) == "kick" then 
lock_muse = "Kiked💘"    
else
lock_muse = "✘"    
end 
if database:get(bot_id.."BROK:Lock:Video"..msg.chat_id_) == "del" then
lock_ved = "✓"
elseif database:get(bot_id.."BROK:Lock:Video"..msg.chat_id_) == "ked" then 
lock_ved = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:Video"..msg.chat_id_) == "ktm" then 
lock_ved = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:Video"..msg.chat_id_) == "kick" then 
lock_ved = "Kiked💘"    
else
lock_ved = "✘"    
end
if database:get(bot_id.."BROK:Lock:Animation"..msg.chat_id_) == "del" then
lock_gif = "✓"
elseif database:get(bot_id.."BROK:Lock:Animation"..msg.chat_id_) == "ked" then 
lock_gif = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:Animation"..msg.chat_id_) == "ktm" then 
lock_gif = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:Animation"..msg.chat_id_) == "kick" then 
lock_gif = "Kiked💘"    
else
lock_gif = "✘"    
end
if database:get(bot_id.."BROK:Lock:Sticker"..msg.chat_id_) == "del" then
lock_ste = "✓"
elseif database:get(bot_id.."BROK:Lock:Sticker"..msg.chat_id_) == "ked" then 
lock_ste = "Restriction💘 "    
elseif database:get(bot_id.."BROK:Lock:Sticker"..msg.chat_id_) == "ktm" then 
lock_ste = "Mute💘 "    
elseif database:get(bot_id.."BROK:Lock:Sticker"..msg.chat_id_) == "kick" then 
lock_ste = "Kiked💘"    
else
lock_ste = "✘"    
end
if database:get(bot_id.."BROK:Lock:geam"..msg.chat_id_) == "del" then
lock_geam = "✓"
elseif database:get(bot_id.."BROK:Lock:geam"..msg.chat_id_) == "ked" then 
lock_geam = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:geam"..msg.chat_id_) == "ktm" then 
lock_geam = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:geam"..msg.chat_id_) == "kick" then 
lock_geam = "Kiked💘"    
else
lock_geam = "✘"    
end    
if database:get(bot_id.."BROK:Lock:vico"..msg.chat_id_) == "del" then
lock_vico = "✓"
elseif database:get(bot_id.."BROK:Lock:vico"..msg.chat_id_) == "ked" then 
lock_vico = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:vico"..msg.chat_id_) == "ktm" then 
lock_vico = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:vico"..msg.chat_id_) == "kick" then 
lock_vico = "Kiked💘"    
else
lock_vico = "✘"    
end    
if database:get(bot_id.."BROK:Lock:Keyboard"..msg.chat_id_) == "del" then
lock_inlin = "✓"
elseif database:get(bot_id.."BROK:Lock:Keyboard"..msg.chat_id_) == "ked" then 
lock_inlin = "Restriction💘"
elseif database:get(bot_id.."BROK:Lock:Keyboard"..msg.chat_id_) == "ktm" then 
lock_inlin = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:Keyboard"..msg.chat_id_) == "kick" then 
lock_inlin = "Kiked💘"
else
lock_inlin = "✘"
end
if database:get(bot_id.."BROK:Lock:forward"..msg.chat_id_) == "del" then
lock_fwd = "✓"
elseif database:get(bot_id.."BROK:Lock:forward"..msg.chat_id_) == "ked" then 
lock_fwd = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:forward"..msg.chat_id_) == "ktm" then 
lock_fwd = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:forward"..msg.chat_id_) == "kick" then 
lock_fwd = "Kiked💘"    
else
lock_fwd = "✘"    
end    
if database:get(bot_id.."BROK:Lock:Document"..msg.chat_id_) == "del" then
lock_file = "✓"
elseif database:get(bot_id.."BROK:Lock:Document"..msg.chat_id_) == "ked" then 
lock_file = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:Document"..msg.chat_id_) == "ktm" then 
lock_file = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:Document"..msg.chat_id_) == "kick" then 
lock_file = "Kiked💘"    
else
lock_file = "✘"    
end    
if database:get(bot_id.."BROK:Lock:Unsupported"..msg.chat_id_) == "del" then
lock_self = "✓"
elseif database:get(bot_id.."BROK:Lock:Unsupported"..msg.chat_id_) == "ked" then 
lock_self = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:Unsupported"..msg.chat_id_) == "ktm" then 
lock_self = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:Unsupported"..msg.chat_id_) == "kick" then 
lock_self = "Kiked💘"    
else
lock_self = "✘"    
end
if database:get(bot_id.."BROK:Lock:Bot:kick"..msg.chat_id_) == "del" then
lock_bots = "✓"
elseif database:get(bot_id.."BROK:Lock:Bot:kick"..msg.chat_id_) == "ked" then
lock_bots = "Restriction💘"   
elseif database:get(bot_id.."BROK:Lock:Bot:kick"..msg.chat_id_) == "kick" then
lock_bots = "Kiked💘"    
else
lock_bots = "✘"    
end
if database:get(bot_id.."BROK:Lock:Markdaun"..msg.chat_id_) == "del" then
lock_mark = "✓"
elseif database:get(bot_id.."BROK:Lock:Markdaun"..msg.chat_id_) == "ked" then 
lock_mark = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:Markdaun"..msg.chat_id_) == "ktm" then 
lock_mark = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:Markdaun"..msg.chat_id_) == "kick" then 
lock_mark = "Kiked💘"    
else
lock_mark = "✘"    
end
if database:get(bot_id.."BROK:Lock:Spam"..msg.chat_id_) == "del" then    
lock_spam = "✓"
elseif database:get(bot_id.."BROK:Lock:Spam"..msg.chat_id_) == "ked" then 
lock_spam = "Restriction💘"    
elseif database:get(bot_id.."BROK:Lock:Spam"..msg.chat_id_) == "ktm" then 
lock_spam = "Mute💘"    
elseif database:get(bot_id.."BROK:Lock:Spam"..msg.chat_id_) == "kick" then 
lock_spam = "Kiked💘"    
else
lock_spam = "✘"    
end        
if not database:get(bot_id.."BROK:Reply:Manager"..msg.chat_id_) then
rdmder = "✓"
else
rdmder = "✘"
end
if not database:get(bot_id.."BROK:Reply:Sudo"..msg.chat_id_) then
rdsudo = "✓"
else
rdsudo = "✘"
end
if not database:get(bot_id.."BROK:Lock:ID:Bot"..msg.chat_id_)  then
idgp = "✓"
else
idgp = "✘"
end
if not database:get(bot_id.."BROK:Lock:ID:Bot:Photo"..msg.chat_id_) then
idph = "✓"
else
idph = "✘"
end
if not database:get(bot_id.."BROK:Lock:kick"..msg.chat_id_)  then
setadd = "✓"
else
setadd = "✘"
end
if not database:get(bot_id.."BROK:Lock:Add:Bot"..msg.chat_id_)  then
banm = "✓"
else
banm = "✘"
end
if not database:get(bot_id.."BROK:Kick:Me"..msg.chat_id_) then
kickme = "✓"
else
kickme = "✘"
end
Num_Flood = database:hget(bot_id.."BROK:flooding:settings:"..msg.chat_id_,"floodmax") or 0
local text = 
"Group Settings "..
"\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ "..
"\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ "..
"\n Links » "..lock_links..
"\n".." UserNames » "..lock_user..
"\n".." Tags » "..lock_hash..
"\n".." Bots » "..lock_bots..
"\n".." ForWard » "..lock_fwd..
"\n".." Pin » "..lock_pin..
"\n".."  Notifications » "..lock_tagservr..
"\n".." MarkDown » "..lock_mark..
"\n".." Edit » "..lock_edit..
"\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ "..
"\n".." Spam » "..lock_spam..
"\n".." KeyBoard » "..lock_inlin..
"\n".." Music » "..lock_vico..
"\n".." GIF » "..lock_gif..
"\n".." Files » "..lock_file..
"\n".." Chat » "..lock_text..
"\n".." Video » "..lock_ved..
"\n".." Pic » "..lock_photo..
"\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ "..
"\n".." Voice » "..lock_muse..
"\n".." Stickers » "..lock_ste..
"\n".." Contacts » "..lock_phon..
"\n".." Join » "..lock_join..
"\n".." Add » "..lock_add..
"\n".." Selfie  » "..lock_self..
"\n".." Play » "..lock_geam..
"\n".." Rewrite » "..flood..
"\n".." WelCome » "..welcome..
"\n".." Count Rewrite » "..Num_Flood..
"\n\n.*" 
send(msg.chat_id_, msg.id_,text)     
end    
if text == "تعطيل اوامر التحشيش" and Owner(msg) then    
send(msg.chat_id_, msg.id_, 'Done💘')
database:set(bot_id.."BROK:Fun_Bots"..msg.chat_id_,"true")
end
if text == "تفعيل اوامر التحشيش" and Owner(msg) then    
send(msg.chat_id_, msg.id_,'Done💘')
database:del(bot_id.."BROK:Fun_Bots"..msg.chat_id_)
end

if text == 'تفعيل الايدي' or text == "Play ID" and Owner(msg) then   
database:del(bot_id..'BROK:Lock:ID:Bot'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'Done💘') 
end
if text == 'تعطيل الايدي' or text == "Stop ID" and Owner(msg) then  
database:set(bot_id..'BROK:Lock:ID:Bot'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'Done💘') 
end
if text == 'تفعيل الايدي بالصوره' or text == "Play ID Pic" and Owner(msg) then   
database:del(bot_id..'BROK:Lock:ID:Bot:Photo'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'Done💘') 
end
if text == 'تعطيل الايدي بالصوره' or text == "Stop ID Pic" and Owner(msg) then  
database:set(bot_id..'BROK:Lock:ID:Bot:Photo'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'Done💘') 
end
if text == 'تعين الايدي' or text == "Put ID" and Owner(msg) then
database:setex(bot_id.."BROK:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_,240,true)  
local Text= [[
Send New ID 
Tou Can Add These 💘
- `#username` > UserName💘
- `#msgs` > Messages💘
- `#photos` > User Pic N💘
- `#id` > User ID💘
- `#auto` > User Status💘
- `#stast` > User Stast💘
- `#edit` > Edit Messages💘
- `#game` > Games💘
- `#AddMem` > Contacts💘
- `#Description` > Pic Description💘
]]
send(msg.chat_id_, msg.id_,Text)
return false  
end 
if text == 'حذف الايدي' or text == 'مسح الايدي' or text == "Rem ID" then
if Owner(msg) then
database:del(bot_id.."BROK:Klesh:Id:Bot"..msg.chat_id_)
send(msg.chat_id_, msg.id_, 'Done💘 ')
end
return false  
end 

if database:get(bot_id.."BROK:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) then 
if text == 'الغاء' or text == "Close" then 
send(msg.chat_id_, msg.id_,"Done💘") 
database:del(bot_id.."BROK:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."BROK:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) 
database:set(bot_id.."BROK:Klesh:Id:Bot"..msg.chat_id_,text:match("(.*)"))
send(msg.chat_id_, msg.id_,'Done💘')    
end

if text == 'ايدي' or text == "ID" and tonumber(msg.reply_to_message_id_) == 0 and not database:get(bot_id..'BROK:Lock:ID:Bot'..msg.chat_id_) then
if not database:sismember(bot_id..'BROK:Spam:Group'..msg.sender_user_id_,text) then
database:sadd(bot_id.."BROK:Spam:Group"..msg.sender_user_id_,text) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = 0,limit_ = 1},function(extra,BROK,success) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'No User💘'
end
local Id = msg.sender_user_id_
local NumMsg = database:get(bot_id..'BROK:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'BROK:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Num_Games = database:get(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_) or 0
local Add_Mem = database:get(bot_id.."BROK:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) or 0
local Total_Photp = (BROK.total_count_ or 0)
local Texting = {
'صورتك فدشي 😘😔❤️',
"صارلك شكد مخليه ",
"وفالله 😔💘",
"كشخه برب 😉💘",
"دغيره شبي هذ 😒",
"عمري الحلوين 💘",
}
local Description = Texting[math.random(#Texting)]
local get_id = database:get(bot_id.."BROK:Klesh:Id:Bot"..msg.chat_id_)
if not database:get(bot_id..'BROK:Lock:ID:Bot:Photo'..msg.chat_id_) then
if BROK.photos_[0] then
if get_id then
local get_id = get_id:gsub('#AddMem',Add_Mem) 
local get_id = get_id:gsub('#id',Id) 
local get_id = get_id:gsub('#username',UserName_User) 
local get_id = get_id:gsub('#msgs',NumMsg) 
local get_id = get_id:gsub('#edit',message_edit) 
local get_id = get_id:gsub('#stast',Status_Gps) 
local get_id = get_id:gsub('#auto',TotalMsg) 
local get_id = get_id:gsub('#Description',Description) 
local get_id = get_id:gsub('#game',Num_Games) 
local get_id = get_id:gsub('#photos',Total_Photp) 
sendPhoto(msg.chat_id_,msg.id_,BROK.photos_[0].sizes_[1].photo_.persistent_id_,get_id)
else
sendPhoto(msg.chat_id_,msg.id_,BROK.photos_[0].sizes_[1].photo_.persistent_id_,''..Description..'\nYour ID💘 '..Id..'\n Your User💘 * ['..UserName_User..']*\n Your Stast💘  '..Status_Gps..'\n Your Messages💘 '..NumMsg..'\nYour Edit Messages💘 '..message_edit..' \n Your Status💘 '..TotalMsg..'\n You Games💘 '..Num_Games..'*') 
end
else
send(msg.chat_id_, msg.id_,'You Have Not Pic💘 \n'..'\n Your ID💘 '..Id..'\n Your User💘 * ['..UserName_User..']*\n Your Stast💘  '..Status_Gps..'\n Your Messages💘 '..NumMsg..'\nYour Edit Messages💘 '..message_edit..' \n Your Status💘 '..TotalMsg..'\n You Games💘 '..Num_Games..'*') 
end
else
if get_id then
local get_id = get_id:gsub('#AddMem',Add_Mem) 
local get_id = get_id:gsub('#id',Id) 
local get_id = get_id:gsub('#username',UserName_User) 
local get_id = get_id:gsub('#msgs',NumMsg) 
local get_id = get_id:gsub('#edit',message_edit) 
local get_id = get_id:gsub('#stast',Status_Gps) 
local get_id = get_id:gsub('#auto',TotalMsg) 
local get_id = get_id:gsub('#Description',Description) 
local get_id = get_id:gsub('#game',Num_Games) 
local get_id = get_id:gsub('#photos',Total_Photp) 
send(msg.chat_id_, msg.id_,'['..get_id..']') 
else
send(msg.chat_id_, msg.id_,'\nYour ID💘 '..Id..'\n Your User💘 * ['..UserName_User..']*\n Your Stast💘  '..Status_Gps..'\n Your Messages💘 '..NumMsg..'\nYour Edit Messages💘 '..message_edit..' \n Your Status💘 '..TotalMsg..'\n You Games💘 '..Num_Games..'*') 
end
end
end,nil)   
end,nil)   
end
end
if text and text:match('^تنظيف (%d+)$') and Addictive(msg) then    
local Number = tonumber(text:match('^تنظيف (%d+)$')) 
if Number > 1000 then 
send(msg.chat_id_, msg.id_,'You Can Not Clear UP 1K Messages💘') 
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576
end
send(msg.chat_id_, msg.id_,'Done Clear '..Number..'* Messages💘')  
end

if text == 'ايدي' or text == "ID" and tonumber(msg.reply_to_message_id_) > 0 and not database:get(bot_id..'BROK:Lock:ID:Bot'..msg.chat_id_) then
function Function_BROK(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
if data.first_name_ == false then
send(msg.chat_id_, msg.id_,'This Account is Deleted💘 ')
return false
end
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'No User💘'
end
local Id = data.id_
local NumMsg = database:get(bot_id..'BROK:messageUser'..msg.chat_id_..':'..data.id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'BROK:message_edit'..msg.chat_id_..data.id_) or 0
local Num_Games = database:get(bot_id.."Tshak:Msg_User"..msg.chat_id_..":"..data.id_) or 0
local Add_Mem = database:get(bot_id.."BROK:Add:Memp"..msg.chat_id_..":"..data.id_) or 0
send(msg.chat_id_, msg.id_,Your ID💘 '..Id..'\n Your User💘 * ['..UserName_User..']*\n Your Stast💘  '..Status_Gps..'\n Your Messages💘 '..NumMsg..'\nYour Edit Messages💘 '..message_edit..' \n Your Status💘 '..TotalMsg..'\n You Games💘 '..Num_Games..'*') 
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_BROK, nil)
return false
end

if text and text:match("^ايدي @(.*)$") and not database:get(bot_id..'BROK:Lock:ID:Bot'..msg.chat_id_) then
local username = text:match("^ايدي @(.*)$")
function Function_BROK(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'No User'
end
local Id = data.id_
local NumMsg = database:get(bot_id..'BROK:messageUser'..msg.chat_id_..':'..data.id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'BROK:message_edit'..msg.chat_id_..data.id_) or 0
local Num_Games = database:get(bot_id.."Tshak:Msg_User"..msg.chat_id_..":"..data.id_) or 0
local Add_Mem = database:get(bot_id.."BROK:Add:Memp"..msg.chat_id_..":"..data.id_) or 0
send(msg.chat_id_, msg.id_,'Your ID💘 '..Id..'\n Your User💘 * ['..UserName_User..']*\n Your Stast💘  '..Status_Gps..'\n Your Messages💘 '..NumMsg..'\nYour Edit Messages💘 '..message_edit..' \n Your Status💘 '..TotalMsg..'\n You Games💘 '..Num_Games..'*') 
end,nil)   
else
send(msg.chat_id_, msg.id_,'No Account in This UserName💘')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_BROK, nil)
return false
end
if text == "سمايلات" or text == "سمايل" then
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."Tshak:Set:Sma"..msg.chat_id_)
Random = {"🍏","🍎","🍐","🍊","🍋","🍉","🍇","🍓","🍈","🍒","🍑","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥒","🌶","🌽","🥕","🥔","🥖","🥐","🍞","🥨","🍟","🧀","🥚","🍳","🥓","🥩","🍗","🍖","🌭","🍔","🍠","🍕","🥪","🥙","☕️","🍵","🥤","🍶","🍺","🍻","🏀","⚽️","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","🏸","🥅","🎰","🎮","🎳","🎯","🎲","🎻","🎸","🎺","🥁","🎹","🎼","🎧","🎤","🎬","🎨","🎭","🎪","🎟","🎫","🎗","🏵","🎖","🏆","🥌","🛷","🚗","🚌","🏎","🚓","🚑","🚚","🚛","🚜","🇮🇶","⚔","🛡","🔮","🌡","💣","📌","📍","📓","📗","📂","📅","📪","📫","📬","📭","⏰","📺","🎚","☎️","📡"}
SM = Random[math.random(#Random)]
database:set(bot_id.."Tshak:Random:Sm"..msg.chat_id_,SM)
send(msg.chat_id_, msg.id_,"🔰┇اسرع واحد يدز هاذا السمايل ? ~ {`"..SM.."`}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak:Random:Sm"..msg.chat_id_) or "").."" and not database:get(bot_id.."Tshak:Set:Sma"..msg.chat_id_) then
if not database:get(bot_id.."Tshak:Set:Sma"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"🎁┇الف مبروك لقد فزت \n♻┇للعب مره اخره ارسل ~{ سمايل , سمايلات }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Set:Sma"..msg.chat_id_,true)
return false
end 
if text == "الاسرع" or tect == "ترتيب" then
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."Tshak:Speed:Tr"..msg.chat_id_)
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","كهوه","سفينه","العراق","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
database:set(bot_id.."Tshak:Klam:Speed"..msg.chat_id_,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"بزونه","ز و ه ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"كهوه","ه ك ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"العراق","ق ع ا ل ر ا")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
send(msg.chat_id_, msg.id_,"🔰┇اسرع واحد يرتبها ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak:Klam:Speed"..msg.chat_id_) or "").."" and not database:get(bot_id.."Tshak:Speed:Tr"..msg.chat_id_) then
if not database:get(bot_id.."Tshak:Speed:Tr"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"🎁┇الف مبروك لقد فزت \n♻┇للعب مره اخره ارسل ~{ الاسرع , ترتيب }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Speed:Tr"..msg.chat_id_,true)
end 

if text == "حزوره" then
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."Tshak:Set:Hzora"..msg.chat_id_)
Hzora = {"الجرس","عقرب الساعه","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعه","22","غلط","كم الساعه","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم"};
name = Hzora[math.random(#Hzora)]
database:set(bot_id.."Tshak:Klam:Hzor"..msg.chat_id_,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعه","اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟ ")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ")
name = string.gsub(name,"الساعه","ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ")
name = string.gsub(name,"كم الساعه","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيتنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","ماهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟ ")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟ ")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟ ")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ")
send(msg.chat_id_, msg.id_,"🔰┇اسرع واحد يحل الحزوره ↓\n {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak:Klam:Hzor"..msg.chat_id_) or "").."" and not database:get(bot_id.."Tshak:Set:Hzora"..msg.chat_id_) then
if not database:get(bot_id.."Tshak:Set:Hzora"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"🎁┇الف مبروك لقد فزت \n♻┇للعب مره اخره ارسل ~{ حزوره }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Set:Hzora"..msg.chat_id_,true)
end 

if text == "معاني" then
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."Tshak:Set:Maany"..msg.chat_id_)
Maany_Rand = {"قرد","دجاجه","بطريق","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فأر","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان"}
name = Maany_Rand[math.random(#Maany_Rand)]
database:set(bot_id.."Tshak:Maany"..msg.chat_id_,name)
name = string.gsub(name,"قرد","🐒")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","🦇")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فأر","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
send(msg.chat_id_, msg.id_,"🔰┇اسرع واحد يدز معنى السمايل ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak:Maany"..msg.chat_id_) or "").."" and not database:get(bot_id.."Tshak:Set:Maany"..msg.chat_id_) then
if not database:get(bot_id.."Tshak:Set:Maany"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"🎁┇الف مبروك لقد فزت \n♻┇للعب مره اخره ارسل ~{ معاني }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Set:Maany"..msg.chat_id_,true)
end 
if text == "العكس" then
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."Tshak:Set:Aks"..msg.chat_id_)
katu = {"باي","فهمت","موزين","اسمعك","احبك","موحلو","نضيف","حاره","ناصي","جوه","سريع","ونسه","طويل","سمين","ضعيف","شريف","شجاع","رحت","عدل","نشيط","شبعان","موعطشان","خوش ولد","اني","هادئ"}
name = katu[math.random(#katu)]
database:set(bot_id.."Tshak:Set:Aks:Game"..msg.chat_id_,name)
name = string.gsub(name,"باي","هلو")
name = string.gsub(name,"فهمت","مافهمت")
name = string.gsub(name,"موزين","زين")
name = string.gsub(name,"اسمعك","ماسمعك")
name = string.gsub(name,"احبك","ماحبك")
name = string.gsub(name,"موحلو","حلو")
name = string.gsub(name,"نضيف","وصخ")
name = string.gsub(name,"حاره","بارده")
name = string.gsub(name,"ناصي","عالي")
name = string.gsub(name,"جوه","فوك")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"ونسه","ضوجه")
name = string.gsub(name,"طويل","قزم")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"شريف","كواد")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","اجيت")
name = string.gsub(name,"عدل","ميت")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"شبعان","جوعان")
name = string.gsub(name,"موعطشان","عطشان")
name = string.gsub(name,"خوش ولد","موخوش ولد")
name = string.gsub(name,"اني","مطي")
name = string.gsub(name,"هادئ","عصبي")
send(msg.chat_id_, msg.id_,"🔰┇اسرع واحد يدز العكس ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak:Set:Aks:Game"..msg.chat_id_) or "").."" and not database:get(bot_id.."Tshak:Set:Aks"..msg.chat_id_) then
if not database:get(bot_id.."Tshak:Set:Aks"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"🎁┇الف مبروك لقد فزت \n♻┇للعب مره اخره ارسل ~{ العكس }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Set:Aks"..msg.chat_id_,true)
end 

if database:get(bot_id.."Tshak:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
send(msg.chat_id_, msg.id_,"عذرآ لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 }\n")
return false  end 
local GETNUM = database:get(bot_id.."Tshak:GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del(bot_id.."Tshak:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)
database:del(bot_id.."Tshak:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_,5)  
send(msg.chat_id_, msg.id_,"مبروك فزت ويانه وخمنت الرقم الصحيح\nتم اضافة { 5 } من النقاط \n")
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:incrby(bot_id.."Tshak:SADD:NUM"..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(database:get(bot_id.."Tshak:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)) >= 3 then
database:del(bot_id.."Tshak:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)
database:del(bot_id.."Tshak:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"اوبس لقد خسرت في اللعبه \nحظآ اوفر في المره القادمه \nكان الرقم الذي تم تخمينه { "..GETNUM.." }")
else
send(msg.chat_id_, msg.id_,"اوبس تخمينك غلط \nlارسل رقم تخمنه مره اخرى ")
end
end
end
end
if text == "خمن" or text == "تخمين" then   
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
Num = math.random(1,20)
database:set(bot_id.."Tshak:GAMES:NUM"..msg.chat_id_,Num) 
send(msg.chat_id_, msg.id_,"\nاهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n".."ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n".."سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ ")
database:setex(bot_id.."Tshak:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end

if database:get(bot_id.."Tshak:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
send(msg.chat_id_, msg.id_,"عذرا لا يوجد سواء { 6 } اختيارات فقط ارسل اختيارك مره اخرى\n")
return false  end 
local GETNUM = database:get(bot_id.."Tshak:Games:Bat"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del(bot_id.."Tshak:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"مبروك فزت وطلعت المحيبس بل ايد رقم { "..NUM.." }\nلقد حصلت على { 3 }من نقاط يمكنك استبدالهن برسائل ")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:del(bot_id.."Tshak:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"للاسف لقد خسرت \nالمحيبس بل ايد رقم { "..GETNUM.." }\nحاول مره اخرى للعثور على المحيبس")
end
end
end

if text == "محيبس" or text == "بات" then
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then   
Num = math.random(1,6)
database:set(bot_id.."Tshak:Games:Bat"..msg.chat_id_,Num) 
TEST = [[
*➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊
📮┇اختر لأستخراج المحيبس الايد التي تحمل المحيبس 
🎁┇الفائز يحصل على { 3 } من النقاط *
]]
send(msg.chat_id_, msg.id_,TEST)
database:setex(bot_id.."Tshak:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end

if text == "المختلف" then
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
mktlf = {"😸","☠","🐼","🐇","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","👨‍🔬","👨‍💻","👨‍🔧","🧚‍♀","🧜‍♂","🧝‍♂","🙍‍♂","🧖‍♂","👬","🕒","🕤","⌛️","📅",};
name = mktlf[math.random(#mktlf)]
database:del(bot_id.."Tshak:Set:Moktlf:Bot"..msg.chat_id_)
database:set(bot_id.."Tshak::Set:Moktlf"..msg.chat_id_,name)
name = string.gsub(name,"😸","😹😹😹😹😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠💀💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻👻👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚🌚")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑🌚🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟")
name = string.gsub(name,"✨","💫💫💫💫💫✨💫💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬")
name = string.gsub(name,"👨‍💻","👩‍💻👩‍💻👩‍‍💻👩‍‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻")
name = string.gsub(name,"👨‍🔧","👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧")
name = string.gsub(name,"👩‍🍳","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"🧝‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"🧖‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️")
name = string.gsub(name,"👬","👭👭👭👭👭👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦")
name = string.gsub(name,"🕒","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥🕥🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆📅📆📆")
send(msg.chat_id_, msg.id_,"🔰┇اسرع واحد يدز الاختلاف ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak::Set:Moktlf"..msg.chat_id_) or "").."" then 
if not database:get(bot_id.."Tshak:Set:Moktlf:Bot"..msg.chat_id_) then 
database:del(bot_id.."Tshak::Set:Moktlf"..msg.chat_id_)
send(msg.chat_id_, msg.id_,"🎁┇الف مبروك لقد فزت \n♻┇للعب مره اخره ارسل ~{ المختلف }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Set:Moktlf:Bot"..msg.chat_id_,true)
end
if text == "امثله" then
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
mthal = {"جوز","ضراطه","الحبل","الحافي","شقره","بيدك","سلايه","النخله","الخيل","حداد","المبلل","يركص","قرد","العنب","العمه","الخبز","بالحصاد","شهر","شكه","يكحله",};
name = mthal[math.random(#mthal)]
database:set(bot_id.."Tshak:Set:Amth"..msg.chat_id_,name)
database:del(bot_id.."Tshak:Set:Amth:Bot"..msg.chat_id_)
name = string.gsub(name,"جوز","ينطي____للماعده سنون")
name = string.gsub(name,"ضراطه","الي يسوق المطي يتحمل___")
name = string.gsub(name,"بيدك","اكل___محد يفيدك")
name = string.gsub(name,"الحافي","تجدي من___نعال")
name = string.gsub(name,"شقره","مع الخيل يا___")
name = string.gsub(name,"النخله","الطول طول___والعقل عقل الصخلة")
name = string.gsub(name,"سلايه","بالوجه امراية وبالظهر___")
name = string.gsub(name,"الخيل","من قلة___شدو على الچلاب سروج")
name = string.gsub(name,"حداد","موكل من صخم وجهه كال آني___")
name = string.gsub(name,"المبلل","___ما يخاف من المطر")
name = string.gsub(name,"الحبل","اللي تلدغة الحية يخاف من جرة___")
name = string.gsub(name,"يركص","المايعرف___يكول الكاع عوجه")
name = string.gsub(name,"العنب","المايلوح___يكول حامض")
name = string.gsub(name,"العمه","___إذا حبت الچنة ابليس يدخل الجنة")
name = string.gsub(name,"الخبز","انطي___للخباز حتى لو ياكل نصه")
name = string.gsub(name,"باحصاد","اسمة___ومنجله مكسور")
name = string.gsub(name,"شهر","امشي__ولا تعبر نهر")
name = string.gsub(name,"شكه","يامن تعب يامن__يا من على الحاضر لكة")
name = string.gsub(name,"القرد","__بعين امه غزال")
name = string.gsub(name,"يكحله","اجه___عماها")
send(msg.chat_id_, msg.id_,"🔰┇اسرع واحد يكمل المثل ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak:Set:Amth"..msg.chat_id_) or "").."" then 
if not database:get(bot_id.."Tshak:Set:Amth:Bot"..msg.chat_id_) then 
database:del(bot_id.."Tshak:Set:Amth"..msg.chat_id_)
send(msg.chat_id_, msg.id_,"🎁┇الف مبروك لقد فزت \n♻┇للعب مره اخره ارسل ~{ امثله }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Set:Amth:Bot"..msg.chat_id_,true)
end
if text == "تعطيل الالعاب" and Owner(msg) then   
database:del(bot_id.."Tshak:Lock:Games"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"\n☑┇تم تعطيل الالعاب") 
end
if text == "تفعيل الالعاب" and Owner(msg) then  
database:set(bot_id.."Tshak:Lock:Games"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"\n☑┇تم تفعيل الالعاب") 
end
if text == 'الالعاب' or text == "Play" then
Teext = [[
Play Menu💘
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ 
بات💘
تخمين💘
الاسرع💘
سمايلات💘
المختلف💘
امثله💘
العكس💘
حزوره💘
معاني💘
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ 
ارسل [ مجوهراتي ] لرؤية عدد مجوهراتك💘
[ بيع مجوهراتي + العدد ] لبيع مجوهراتك ( كل مجوهره مقابل 50 رساله)💘
]]
send(msg.chat_id_, msg.id_,Teext) 
end
if text == 'رسائلي' or text == "MY Messages" then
local nummsg = database:get(bot_id..'BROK:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 1
local Text = 'Your Messages 💘'..nummsg..'*'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح رسائلي' or text == "Rem MY Messages" then
database:del(bot_id..'BROK:messageUser'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = 'Done Remove All Your Messages💘 '
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'سحكاتي' or text == 'تعديلاتي' or text == "MY Edit" then
local edit = database:get(bot_id..'BROK:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = 'Your Edited Messages💘  '..edit..'*'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' or text == "Rem MY Edited Message" then
database:del(bot_id..'BROK:message_edit'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = 'Done💘 '
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'جهاتي' or text == "MY Contacts" then
local addmem = database:get(bot_id.."BROK:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) or 0
local Text = 'Your Countacts💘  '..addmem..'*'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح جهاتي' or text == "Rem MY Contacts" then
database:del(bot_id..'BROK:Add:Memp'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = 'Done💘 '
send(msg.chat_id_, msg.id_,Text) 
end

if text == "مجوهراتي" or text == "MY Games" then 
local Num = database:get(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_) or 0
if Num == 0 then 
Text = "You Don Not Play Already💘"
else
Text = "Your Games 💘{ "..Num.." } "
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match("^بيع مجوهراتي (%d+)$") then
local NUMPY = text:match("^بيع مجوهراتي (%d+)$") 
if tonumber(NUMPY) == tonumber(0) then
send(msg.chat_id_,msg.id_,"\n I Can Not Sell Under 1💘") 
return false 
end
if tonumber(database:get(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_)) == tonumber(0) then
send(msg.chat_id_,msg.id_,"You Have Not Any Game💘 ") 
else
local NUM_GAMES = database:get(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_)
if tonumber(NUMPY) > tonumber(NUM_GAMES) then
send(msg.chat_id_,msg.id_,"\n You Have Not This Number💘") 
return false 
end
local NUMNKO = (NUMPY * 50)
database:decrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_,NUMPY)  
database:incrby(bot_id.."BROK:messageUser"..msg.chat_id_..":"..msg.sender_user_id_,NUMNKO)  
send(msg.chat_id_,msg.id_,"Done , I Take{ "..NUMPY.." }* From Your Games \n And I Add To You { "..(NUMPY * 50).." } Messages💘")
end 
return false 
end
if text ==("مسح") or text == ("Rem") and Addictive(msg) and tonumber(msg.reply_to_message_id_) > 0 then
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})   
end   
if database:get(bot_id.."Tshak:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id.."Tshak:id:user"..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "Done💘 ") 
database:del(bot_id.."Tshak:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."Tshak:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id.."Tshak:id:user"..msg.chat_id_)  
database:del(bot_id.."Tshak:Msg_User"..msg.chat_id_..":"..msg.sender_user_id_) 
database:incrby(bot_id.."BROK:messageUser"..msg.chat_id_..":"..iduserr,numadded)  
send(msg.chat_id_, msg.id_,"Done , I Add To He {"..numadded.."} Messages💘")  
end 
if database:get(bot_id.."Tshak:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id.."Tshak:idgem:user"..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "Done💘 ") 
database:del(bot_id.."Tshak:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."Tshak:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id.."Tshak:idgem:user"..msg.chat_id_)  
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..iduserr,numadded)  
send(msg.chat_id_, msg.id_,"Done , I Add To He {"..numadded.."} Games💘")  
end
------------------------------------------------------------
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then    
BROK = text:match("^اضف رسائل (%d+)$")
database:set(bot_id.."Tshak:id:user"..msg.chat_id_,BROK)  
database:setex(bot_id.."Tshak:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, "Send Me Messgaes Number💘") 
return false
end
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
BROK = text:match("^اضف مجوهرات (%d+)$")
database:set(bot_id.."Tshak:idgem:user"..msg.chat_id_,BROK)  
database:setex(bot_id.."Tshak:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, "Send Me Games Number💘") 
return false
end
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف مجوهرات (%d+)$")
function reply(extra, result, success)
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_,"Done , I Add To He  {"..Num.."} Games💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function reply(extra, result, success)
database:del(bot_id.."Tshak:Msg_User"..msg.chat_id_..":"..result.sender_user_id_) 
database:incrby(bot_id.."BROK:messageUser"..msg.chat_id_..":"..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_, "\n Done , I Add To He {"..Num.."} Messages💘")  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end

if text == "تنظيف المشتركين" and DevBROK(msg) then
local pv = database:smembers(bot_id..'BROK:UsersBot')  
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m»» THE USER IS SAVE ME ↓\n»» '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m»» THE USER IS BLOCK ME ↓\n»» '..pv[i]..'\n\27[1;37m')
database:srem(bot_id..'BROK:UsersBot',pv[i])  
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then 
send(msg.chat_id_, msg.id_,'Not Found Lie Members💘 ')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'Count Members💘 '..#pv..'\n I Found '..sendok..' Member Blocked Me \n Count Members Now ~ '..ok..' 💘 *')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "تنظيف الكروبات" and DevBROK(msg) then
local group = database:smembers(bot_id..'BROK:Chek:Groups')  
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m»» THE BOT IS NOT ADMIN ↓\n»» '..group[i]..'\n\27[1;37m')
database:srem(bot_id..'BROK:Chek:Groups',group[i])  
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'BROK:Chek:Groups',group[i])  
q = q + 1
print('\27[30;35m»» THE BOT IS LEFT GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'BROK:Chek:Groups',group[i])  
q = q + 1
print('\27[30;36m»» THE BOT IS KICKED GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'BROK:Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'Not Found Lie Groups💘 ')   
else
local BROK = (w + q)
local sendok = #group - BROK
if q == 0 then
BROK = ''
else
BROK = '\n I Remove '..q..' Groups From Me💘'
end
if w == 0 then
storm = ''
else
storm = '\n I Remove ~'..w..' Group BeCause I'm Member💘'
end
send(msg.chat_id_, msg.id_,' Count Groups  '..#group..' Group💘 '..storm..''..BROK..'\n Count Groups Now ~ '..sendok..' 💘*\n')   
end
end
end,nil)
end
return false
end
if text == ("تحديث السورس") or text == ("Update SRC") and DevBROK(msg) then  
send(msg.chat_id_,msg.id_,'Updated💘')
os.execute('rm -rf BROK.la')
os.execute('rm -rf start.lua')
download_to_file('https://raw.githubusercontent.com/BROKz/BROK/master/BROK.lua', 'BROK.lua') 
download_to_file('https://raw.githubusercontent.com/BROKz/BROK/master/start.lua', 'start.lua') 
dofile('BROK.lua')  
return false
end


if text == 'تفعيل البوت الخدمي' and DevBROK(msg) then  
database:del(bot_id..'BROK:Free:Add:Bots') 
send(msg.chat_id_, msg.id_,'Done💘 ') 
end
if text == 'تعطيل البوت الخدمي' and DevBROK(msg) then  
database:set(bot_id..'BROK:Free:Add:Bots',true) 
send(msg.chat_id_, msg.id_,'Done💘') 
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") and DevBROK(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") 
database:set(bot_id..'BROK:Num:Add:Bot',Num) 
send(msg.chat_id_, msg.id_,'Done Put Members *~'..Num..'Member💘')
end
if text =='الاحصائيات' or text == "Status" and DevBot(msg) then
local Groups = database:scard(bot_id..'BROK:Chek:Groups')  
local Users = database:scard(bot_id..'BROK:UsersBot')  
send(msg.chat_id_, msg.id_,'Status Bot💘 \n\n Count Groups💘 *~ '..Groups..'\n Count Members💘 ~ '..Users..'*')
end
if text == 'جلب نسخه احتياطيه' or text == "GP Links" and DevBROK(msg) then
local list = database:smembers(bot_id..'BROK:Chek:Groups')  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'BROK Chat'
ASAS = database:smembers(bot_id.."BROK:Basic:Constructor"..v)
MNSH = database:smembers(bot_id.."BROK:Constructor"..v)
MDER = database:smembers(bot_id.."BROK:Manager"..v)
MOD = database:smembers(bot_id.."BROK:Mod:User"..v)
link = database:get(bot_id.."BROK:Link_Group"..v) or ''
if k == 1 then
t = t..'"'..v..'":{"BROK":"'..NAME..'",'
else
t = t..',"'..v..'":{"BROK":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./File_Libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,'./File_Libs/'..bot_id..'.json', 'Groups💘 { '..#list..'}')
end
if text == 'المطور' or text == 'مطور' or text == 'المطورين' or text == "Dev" then
local Text_Dev = database:get(bot_id..'BROK:Text_Dev')
if Text_Dev then 
send(msg.chat_id_, msg.id_,Text_Dev)
else
tdcli_function ({ID = "GetUser",user_id_ = Id_Sudo},function(arg,result) 
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
sendText(msg.chat_id_,Name,msg.id_/2097152/0.5,'md')
end,nil)
end
end
if text == 'الملفات' or text == "Files" and DevBROK(msg) then
t = 'All Files💘 : \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
i = 0
for v in io.popen('ls BROK_Files'):lines() do
if v:match(".lua$") then
i = i + 1
t = t..i..'*~ '..v..'*\n'
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == "متجر الملفات" or text == 'المتجر' then
if DevBROK(msg) then
local Get_Files, res = https.request("https://raw.githubusercontent.com/BROKabas/files_BROK/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n Hi in TeaM [ Z ] Shop💘 \n The Files \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n\n"
local TextE = "\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n File OK (✔) \n".."File Stop (✖) \n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local Check_File_is_Found = io.open("BROK_Files/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "(✔)"
else
CeckFile = "(✖)"
end
NumFile = NumFile + 1
TextS = TextS..'*'..NumFile.."~⪼* {`"..name..'`} » '..CeckFile..'\n[- File Information]('..Info..')\n'
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"No API💘 \n") 
end
return false
end
end

if text and text:match("^(تعطيل ملف) (.*)(.lua)$") and DevBROK(msg) then
local name_t = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("BROK_Files/"..file,"r")
if file_bot then
io.close(file_bot)
t = " File » {"..file.."}\n Done Stop it💘 \n✓*"
else
t = "Already Remove This File💘 » {"..file.."} \n✓*"
end
local json_file, res = https.request("https://raw.githubusercontent.com/BROKabas/files_BROK/master/files_BROK/"..file)
if res == 200 then
os.execute("rm -fr BROK_Files/"..file)
send(msg.chat_id_, msg.id_,t) 
dofile('BROK.lua')  
else
send(msg.chat_id_, msg.id_,"Not Found This File in Shop💘\n") 
end
return false
end
if text and text:match("^(تفعيل ملف) (.*)(.lua)$") and DevBROK(msg) then
local name_t = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("BROK_Files/"..file,"r")
if file_bot then
io.close(file_bot)
t = "Already Play This File 💘 » {"..file.."} \n✓*"
else
t = "File » {"..file.."}\n Done DowLoad & Play it💘 \n*"
end
local json_file, res = https.request("https://raw.githubusercontent.com/BROKabas/files_BROK/master/files_BROK/"..file)
if res == 200 then
local chek = io.open("BROK_Files/"..file,'w+')
chek:write(json_file)
chek:close()
send(msg.chat_id_, msg.id_,t) 
dofile('BROK.lua')  
else
send(msg.chat_id_, msg.id_,"Not Found This File in Shop💘 \n") 
end
return false
end
if text == "مسح جميع الملفات" and DevBROK(msg) then
os.execute("rm -fr BROK_Files/*")
send(msg.chat_id_,msg.id_,"Done💘")
return false
end
if text == 'نقل الاحصائيات' and DevBROK(msg) then
local Users = database:smembers('BROK:'..bot_id.."userss")
local Groups = database:smembers('BROK:'..bot_id..'groups') 
for i = 1, #Groups do
database:sadd(bot_id..'BROK:Chek:Groups',Groups[i])  
local list1 = database:smembers('BROK:'..bot_id..'creatorbasic:'..Groups[i])
for k,v in pairs(list1) do
database:sadd(bot_id.."BROK:Basic:Constructor"..Groups[i], v)
end
local list2 = database:smembers('BROK:'..bot_id..'creator:'..Groups[i])
for k,v in pairs(list2) do
database:sadd(bot_id.."BROK:Constructor"..Groups[i], v)
end
local list3 = database:smembers('BROK:'..bot_id..'owners:'..Groups[i])
for k,v in pairs(list3) do
database:sadd(bot_id.."BROK:Manager"..Groups[i], v)
end
local list4 = database:smembers('BROK:'..bot_id..'mods:'..Groups[i])
for k,v in pairs(list4) do
database:sadd(bot_id.."BROK:Mod:User"..Groups[i], v)
end
database:set(bot_id.."BROK:Lock:tagservrbot"..Groups[i],true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'BROK:'..lock..Groups[i],"del")    
end
end
for i = 1, #Users do
database:sadd(bot_id..'BROK:UsersBot',Users[i])  
end
send(msg.chat_id_, msg.id_,'Done Move : '..#Groups..' Group 💘 \n Done Move : '..#Users..' Member 💘 \n To All Update💘')
end
if text == 'حذف كليشه المطور' and DevBROK(msg) then
database:del(bot_id..'BROK:Text_Dev')
send(msg.chat_id_, msg.id_,'Done💘')
end
if text == 'وضع كليشه المطور' and DevBROK(msg) then
database:set(bot_id..'BROK:Set:Text_Dev'..msg.chat_id_..':'..msg.sender_user_id_,true)
send(msg.chat_id_,msg.id_,'Send it Now💘')
return false
end
if text and database:get(bot_id..'BROK:Set:Text_Dev'..msg.chat_id_..':'..msg.sender_user_id_) then
if text == 'الغاء' or text == "Cloae" then 
database:del(bot_id..'BROK:Set:Text_Dev'..msg.chat_id_..':'..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,'Done Close💘')
return false
end
database:set(bot_id..'BROK:Text_Dev',text)
database:del(bot_id..'BROK:Set:Text_Dev'..msg.chat_id_..':'..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,'Done Save it💘')
return false
end
if text == 'رفع النسخه الاحتياطيه' and DevBROK(msg) then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
add_file(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == "تحديث" and DevBROK(msg) then
dofile("BROK.lua")  
send(msg.chat_id_, msg.id_, "Done💘")
end
if text == 'السورس' or text == 'سورس' or text == 'ياسورس' or text == 'يا سورس' or text == "SRC" then
Text = [[
Hi in TeaM [ Z ] SRC
This SRC Done BY [ TOFE & BROK ]
______________________
 [TeaM Z](https://t.me/xBROKK)
______________________
 [SRC Dev](https://t.me/wzzzz)
______________________
 [TeaM Z BOT](https://t.me/W_zzBot)
]]
send(msg.chat_id_, msg.id_,Text)
end
if text == 'الاوامر' and Addictive(msg) then
Text = [[
it's 5 Orders💘
______________________
[ O1 & م1 ] => لعرض اوامر الحمايه 💘
[ O1 & م1 ] => لعرض اوامر الادمنيه 💘
[ O3 & م3 ] => لعرض اوامر المدراء 💘
[ O4 & م4 ] => لعرض اوامر المنشئ 💘
[ O5 & م5 ] => لعرض اوامر المطور 💘
______________________
[ TeaM Z Channel ](https://t.me/xBROKK)
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م1' or text == "O1" and Addictive(msg) then
Text = [[
Orders Protect💘
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ Close & Open ] - [ قفل & فتح ]
[ Close & Open ] BY (BROK , Mute , Kiked) - [ قفل & فتح ] (بلكتم . بلتقيد . بلطرد)
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ Links & الروابط ]
[ UserName & المعرف ]
[ Tag & التاك ]
[ Slash & الشارحه ]
[ Edit & التعديل ]
[ Pin & التثبيت ]
[ GIF & المتحركه ]
[ Files & الملفات ]
[ Pic & الصور ]

[ Stickers & الملصقات ]
[ Video & الفديديو ]
[ OnLins & الانلاين ] 
[ Chat & الدردشه ]
[ ForWard & التوجيه ]
[ Music & الاغاني ]
[ Voice & الصوت ]
[ Contacts & الجهات ]
[ nn & الاشعارات ]

[ MarkDown & الماركدون ]
[ Bots & البوتات
[ Rewrite & التكرار ]
[ Selfie & السيلفي ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ TeaM Z Channel ](https://t.me/xBROKK)
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م2' or text == "O2" and Addictive(msg) then
Text = [[
Admins Orders💘
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ Add & رفع ] مميز - [ Rem & تنزيل ] مميز
[ Tag To All & تاك للكل ]
[ Count Group & عدد الكروب ]
[ Mute & كتم ] - [ Open Mute & الغاء كتم ]
[ Block & حظر ] - [ UnBlock - الغاء حظر ]
[ Kik & طرد ] 
[ X & منع ] - [ UnX & الغاء منع ]
[ تقيد ] - [ الغاء تقيد ]
[ Block Menu & المحظورين ]
[ Mute Menu & المكتومين ]
[ Elites Members & المميزين ]
[ الصلاحيات ]
[ قائمه المنع ]

[ Pin - تثبيت ] - [ UnPin - الغاء تثبيت ]
[ Settings & الاعدادات ]

[ Link & الرابط ]
[ Rules & القوانين ]

[ WelCome & الترحيب ]
[ Open & Close ] WelCome - [ تفعيل & تعطيل ] الترحيب
[ اضف & مسح ] صلاحيه
[ وضع تكرار + العدد ]
[ ID & ايدي ]
[ MY Contacts & جهاتي ]
[ MY Edited Messages & سحكاتي ]
[ MY Messages & رسائلي ]
[ Bots & كشف البوتات ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ Put & وضع ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ Name & اسم ]
[ Link & رابط ]
[ Pic & صوره ]
[ Description & وصف ]
[ Rules & قوانين ]
[ WelCome & ترحيب ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ Clear Or Rem & مسح ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ X Menu & قائمه المنع ]
[ Blocked & المحظورين ]
[ Elites Members & المميزين ]
[ Muted & المكتومين ]
[ Kiked & المطرودين ]
[ Rules & القوانين ]
[ Bots & البوتات ]
[ Pic & الصوره ]
[ Status & الصلاحيات ]
[ Link & الرابط ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ TeaM Z Channel ](https://t.me/xBROKK)
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م3' or text == "O3" and Owner(msg) then
Text = [[
Mangers Orders💘
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ Add & Rem ] Admin - [ رفع & تنزيل ] ادمن
[ Lift The Restrictions & Restrictions ] - [ رفع & كشف ] القيود
[ Rem All & تنزيل الكل ]

[ Play & Stop ] ID With Pic - [ تفعيل & تعطيل ] الايدي بلصوره
[ Play & Stop ] ID - [ تفعيل & تعطيل ] الايدي
[ Play & Stop ] Dev Replays - [ تفعيل & تعطيل ] ردود المطور
[ تفعيل & تعطيل ] الالعاب
[ تفعيل & تعطيل ] ردود المدير
[ Close & Open ] Add And Rem - [ تفعيل & تعطيل ] الرفع و التنزيل
[ تفعيل & تعطيل ] الحظر و الطرد
[ تفعيل & تعطيل ] جلب الرابط
[ تفعيل & تعطيل ] اوامر التحشيش

[ Put & Rem ] ID - [ تعين - مسح ] الايدي

[ Add Admins & رفع الادمنيه ]
[ Add Replay & اضف رد ] 
[ Admin & الادمنيه ] 
[ Mangers Replayes & ردود المدير ] 

[ تنظيف + عدد ] ( مو اكثر من 1K )
[ Rem Admins & مسح الادمنيه ]
[ Rem Manger Replayes & مسح ردود المدير ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
Change ID Replay💘
تغير رد المطور + النص
تغير رد المنشئ الاساسي + النص
تغير رد المنشئ + النص
تغير رد المدير + النص
تغير رد الادمن + النص
تغير رد المميز + النص
تغير رد العضو + النص
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ TeaM Z Channel ](https://t.me/xBROKK)
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م4' or text == "O4" and Constructor(msg) then
Text = [[
Main Owner Orders💘
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ Add & Rem ] Owner - [ رفع & تنزيل ] منشئ
[ Owners & المنشئين ]
[ Rem Owners & مسح المنشئين ]

Owner Orders💘
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ Add & Rem ] Manger & [ رفع & تنزيل ] مدير
[ Mangers & المدراء ]
[ Rem Mangers & مسح المدراء ]
[ Put & Rem ] ID - [ تعين & مسح ] الايدي 
[ اضف & حذف ] امر
[ Menu Add Orders & الاوامر المضافه ]
[ Rem Add Orders & مسح الاوامر المضافه ]
[ اضف رسائل + العدد ] (بلرد)
[ اضف مجوهرات + العدد ] (بلرد)
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ TeaM Z Channel ](https://t.me/xBROKK)
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == 'م5' or text == "O6" and DevBot(msg) then
Text = [[
Main Dev Orders💘  
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ Ban & حظر عام ]
[ UnBan & الغاء العام ]
[ Clear Menu Ban & مسح قائمه العام ]
[ Add & Rem ] Dev - [ رفع & تنزيل ] مطور
[ Devs & المطورين ]
[ Rem Devs & مسح المطورين ]
[ Add Replay To All & اضف رد للكل ]
[ Rem Dev Rplayes & مسح ردود المطور ]
[ Dev Replayes & ردود المطور ]
[ وضع & حذف ] كليشة المطور

[ Update SRC & تحديث السورس ]

[ تفعيل & تعطيل ] البوت الخدمي
[ تعين عدد الاعضاء + العدد ]
[ تفعيل & تعطيل ] المغادره
[ Close & Open ] Share - [ تفعيل & تعطيل ] الاذاعه
[ تفعيل & تعطيل ] ملف + اسم الملف
[ Files & الملفات
[ Rem All Files & مسح جميع الملفات ]
[ Shop & المتجر 

Dev Order💘
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ Start Bot & Stop Bot ] - [ تفعيل & تعطيل ]

[ Add & Rem ] Main Owner - [ رفع & تنزيل ] منشئ اساسي
[ Add & Rem ] Owner - [ رفع & تنزيل ] منشئ
[ Rem Main Owners & مسح المنشئين الاساسين ]
[ Main Owners & المنشئين الاساسين ]
[ Leave & غادر ]
[ Share & اذاعه ]
[ Share With ForWard & اذاعه بلتوجيه خاص ]
[ Share D & اذاعه خاص ]
[ Share With Pin & اذاعه بلتثبيت ]
[ Status & الاحصائيات ]
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
[ TeaM Z Channel ](https://t.me/xBROKK)
]]
send(msg.chat_id_, msg.id_,Text)
return false
end

end ---- Chat_Type = 'GroupBot' 
end ---- Chat_Type = 'GroupBot' 

if text == 'تفعيل' or text == "Start Bot" and DevBot(msg) then 
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'I'm Not Admin Here💘') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'BROK:Num:Add:Bot') or 0) and not DevBROK(msg) then
send(msg.chat_id_, msg.id_,'Count Group Members is Less {'..(database:get(bot_id..'BROK:Num:Add:Bot') or 0)..'💘')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if database:sismember(bot_id..'BROK:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'This Group is Already Activated💘')
else
Reply_Status(msg,result.id_,'reply_Add','Done Activate Group💘 '..chat.title_..'')
database:sadd(bot_id..'BROK:Chek:Groups',msg.chat_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local NumMember = data.member_count_
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'Not Found💘'
end
Text = 'Done Activate New Group 💘\n'..
'\n BY '..Name..''..
'\n Group ID  `'..IdChat..'`'..
'\n  Count Group Member '..NumMember..'*'..
'\n Group Name ['..NameChat..']'..
'\n Group Link ['..LinkGp..']'
if not DevBROK(msg) then
sendText(Id_Sudo,Text,0,'md')
end
end
end,nil) 
end,nil) 
end,nil)
end
if text == 'تعطيل' or text == "Stop Bot" and DevBot(msg) then 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if not database:sismember(bot_id..'BROK:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'This Group is Already Disabled💘')
else
Reply_Status(msg,result.id_,'reply_Add','Done Disabled Group💘 '..chat.title_..'')
database:srem(bot_id..'BROK:Chek:Groups',msg.chat_id_)  
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'Not Found💘'
end
Text = 'Done Disabled New Group💘 \n'..
'\n BY '..Name..''..
'\n Group ID `'..IdChat..'`'..
'\n Group Name  ['..NameChat..']'..
'\n Group Link  ['..LinkGp..']'
if not DevBROK(msg) then
sendText(Id_Sudo,Text,0,'md')
end
end
end,nil) 
end,nil) 
end
if text == 'تفعيل' or text == "Start Bot" and not DevBot(msg) and not database:get(bot_id..'BROK:Free:Add:Bots') then 
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'I'm Not Admin Here💘') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
if da and da.user_id_ == msg.sender_user_id_ then
if da.status_.ID == "ChatMemberStatusCreator" then
var = 'Owner💘'
elseif da.status_.ID == "ChatMemberStatusEditor" then
var = 'Admin💘'
else 
var= 'Member💘'
end
if database:sismember(bot_id..'BROK:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'This Group Already Activated💘 ')
else
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'BROK:Num:Add:Bot') or 0) and not DevBROK(msg) then
send(msg.chat_id_, msg.id_,'Count Group Members is Less {'..(database:get(bot_id..'BROK:Num:Add:Bot') or 0)..'💘')
return false
end
Reply_Status(msg,result.id_,'reply_Add','Done Activate Group💘 '..chat.title_..'')
database:sadd(bot_id..'BROK:Chek:Groups',msg.chat_id_)  
database:sadd(bot_id..'BROK:Basic:Constructor'..msg.chat_id_, msg.sender_user_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NumMember = data.member_count_
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'Not Found💘'
end
Text = 'Done Activate New Group💘\n'..
'\n BY '..Name..''..
'\n His Stast is Group '..AddPy..'' ..
'\n Group Link `'..IdChat..'`'..
'\n Count Group Members '..NumMember..'*'..
'\n Group Name ['..NameChat..']'..
'\n Group Link ['..LinkGp..']'
if not DevBROK(msg) then
sendText(Id_Sudo,Text,0,'md')
end
end
end
end
end,nil)   
end,nil) 
end,nil) 
end,nil)
end

function tdcli_update_callback(data)
if data.ID == "UpdateChannel" then 
if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
database:srem(bot_id..'BROK:Chek:Groups','-100'..data.channel_.id_)  
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
local text = msg.content_.text_
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print("OLD MESSAGE")
return false
end
if msg.sender_user_id_ and Muted_Groups(msg.chat_id_,msg.sender_user_id_) then 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
return false  
end
--------------------------------------------------------------------------------------------------------------
if tonumber(msg.sender_user_id_) ~= tonumber(bot_id) then  
if msg.sender_user_id_ and Ban_Groups(msg.chat_id_,msg.sender_user_id_) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false  
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_Groups(msg.chat_id_,msg.content_.members_[0].id_) then 
Kick_Group(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Ban_All_Groups(msg.sender_user_id_) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_All_Groups(msg.content_.members_[0].id_) then 
Kick_Group(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
end 
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == "MessagePinMessage" or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatChangeTitle" or msg.content_.ID == "MessageChatDeleteMember" then   
if database:get(bot_id.."BROK:Lock:tagservr"..msg.chat_id_) then  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false
end    
end   
if text and not database:sismember(bot_id..'BROK:Spam:Group'..msg.sender_user_id_,text) then
database:del(bot_id..'BROK:Spam:Group'..msg.sender_user_id_) 
end
------------------------------------------------------------------------
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
database:set(bot_id..'BROK:User:Name'..msg.sender_user_id_,data.username_)
end;end,nil)   
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
database:set(bot_id.."BROK:Who:Added:Me"..msg.chat_id_..":"..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."BROK:Lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Addictive(msg) and Bots == "kick" then   
https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
Get_Info = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(Get_Info)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_Addictive(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."BROK:Lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Addictive(msg) and Bots == "del" then   
Get_Info = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(Get_Info)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_Addictive(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
------------------------------------------------------------------------
if text and database:get(bot_id.."BROK:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = database:get(bot_id.."BROK:Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
database:del(bot_id.."BROK:Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
database:del(bot_id.."BROK:Set:Cmd:Group:New"..msg.chat_id_)
database:srem(bot_id.."BROK:List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"🔰┇تم ازالة الامر من المجموعه")  
else
send(msg.chat_id_, msg.id_,"🔰┇لا يوجد امر بهاذا الاسم تاكد من الامر واعد المحاوله")  
end
database:del(bot_id.."BROK:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
------------------------------------------------------------------------
if data.message_.content_.text_ then
local NewCmmd = database:get(bot_id.."BROK:Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
local Name_Bot = (database:get(bot_id.."BROK:Name:Bot") or "تشاكي")
if not database:get(bot_id.."BROK:Fun_Bots"..msg.chat_id_) then
if text ==  ""..Name_Bot..' شنو رئيك بهاذا' and tonumber(msg.reply_to_message_id_) > 0 then     
function FunBot(extra, result, success) 
local Fun = {'لوكي وزاحف من ساع زحفلي وحضرته 😒','خوش ولد و ورده مال الله 🙄','يلعب ع البنات 🙄', 'ولد زايعته الكاع 😶🙊','صاك يخبل ومعضل ','محلو وشواربه جنها مكناسه 😂🤷🏼‍♀️','اموت عليه 🌝','هوه غير الحب مال اني ❤️','مو خوش ولد صراحه ☹️','ادبسز وميحترم البنات  ', 'فد واحد قذر 🙄😒','ماطيقه كل ما اكمشه ريحته جنها بخاخ بف باف مال حشرات 😂🤷‍♀️','مو خوش ولد 🤓' } 
send(msg.chat_id_, result.id_,''..Fun[math.random(#Fun)]..'')   
end   
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end  
if text == ""..Name_Bot..' شنو رئيك بهاي' and tonumber(msg.reply_to_message_id_) > 0 then    
function FunBot(extra, result, success) 
local Fun = {'الكبد مال اني هيه ','ختولي ماحبها ','خانتني ويه صديقي 😔','بس لو الكفها اله اعضها 💔','خوش بنيه بس عده مكسرات زايده وناقصه منا ومنا وهيه تدري بنفسها 😒','جذابه ومنافقه سوتلي مشكله ويه الحب مالتي ','ئووووووووف اموت ع ربها ','ديرو بالكم منها تلعب ع الولد 😶 ضحكت ع واحد قطته ايفون 7 ','صديقتي وختي وروحي وحياتي ','فد وحده منحرفه 😥','ساكنه بالعلاوي ونته حدد بعد لسانها لسان دلاله 🙄🤐','ام سحوره سحرت اخويا وعلكته 6 سنوات 🤕','ماحبها 🙁','بله هاي جهره تسئل عليها ؟ ','بربك ئنته والله فارغ وبطران وماعدك شي تسوي جاي تسئل ع بنات العالم ولي يله 🏼','ياخي بنيه حبوبه بس لبعرك معمي عليها تشرب هواي 😹' } 
send(msg.chat_id_,result.id_,''..Fun[math.random(#Fun)]..'') 
end  
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end    
end
if text and text:match('^'..Name_Bot..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..Name_Bot..' ','')
end
------------------------------------------------------------------------
BROK_Started_Bot(msg,data)
BROK_Files(msg)
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
database:incr(bot_id..'BROK:message_edit'..result.chat_id_..result.sender_user_id_)
local Text = result.content_.text_
if database:get(bot_id.."BROK:Lock:edit"..msg.chat_id_) and not Text and not BasicConstructor(result) then
Reply_Status(result,result.sender_user_id_,"reply","📬┇قام بالتعديل على الميديا")  
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
end
local text = result.content_.text_
if not Addictive(result) then
------------------------------------------------------------------------
if text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("[hH][tT][tT][pP][sT]") or text and text:match("[tT][eE][lL][eE][gG][rR][aA].[Pp][Hh]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa].[Pp][Hh]") then
if database:get(bot_id.."BROK:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(@)(.*)") then
if database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("@") then
if database:get(bot_id.."BROK:Lock:User:Name"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(#)(.*)") then
if database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("#") then
if database:get(bot_id.."BROK:Lock:hashtak"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("/") then
if database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end 
if text and text:match("(.*)(/)(.*)") then
if database:get(bot_id.."BROK:Lock:Cmd"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text then
local BROK_Msg = database:get(bot_id.."BROK:Add:Filter:Rp2"..text..result.chat_id_)   
if BROK_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","📬┇"..BROK_Msg)  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
end
end,nil)
------------------------------------------------------------------------
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local Get_Msg_Pin = database:get(bot_id..'BROK:Msg:Pin:Chat'..msg.chat_id_)
if Get_Msg_Pin ~= nil then
if text == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) if d.ID == 'Ok' then;database:del(bot_id..'BROK:Msg:Pin:Chat'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if Get_Msg_Pin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'BROK:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'BROK:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'BROK:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
end
end
if (data.ID == "UpdateOption" and data.value_.value_ == "Ready") then
print('\27[30;32m»» يرجى الاننتضار لحين تنظيف المجموعات الوهميه ««\n\27[1;37m')
local list = database:smembers(bot_id..'BROK:UsersBot')  
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local list = database:smembers(bot_id..'BROK:Chek:Groups') 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
database:srem(bot_id..'BROK:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'BROK:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'BROK:Chek:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'BROK:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id..'BROK:Chek:Groups',v)  
end end,nil)
end;CleangGroups();end;end.
