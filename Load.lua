local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local v0 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\225\207\218\60\227\169\212", "\126\177\163\187\69\134\219\167"));
local v1 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\17\207\50\228\242\34\193\51\209\245\32\222\25\192\238\53\196\41\192", "\156\67\173\74\165"));
local v2 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\0\160\76\19\178\21\67\38\161\64\21\185", "\38\84\215\41\118\220\70"));
local v3 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\124\31\37\26\234\89\24\37", "\158\48\118\66\114"));
local v4 = v0.LocalPlayer;
local v5 = v4:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\155\40\17\47\118\183\220\190\45", "\155\203\68\112\86\19\197"));
local v6 = v1:GetClientId():upper():gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\125\152\37\185\13\69", "\152\38\189\86\156\32\24\133"), "");
local v7 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\210\86\170\67", "\38\156\55\199")]=LUAOBFUSACTOR_DECRYPT_STR_0("\156\88\93\5\83\70\192\113", "\35\200\29\28\72\115\20\154"),[LUAOBFUSACTOR_DECRYPT_STR_0("\53\182\210\218\131\63\49\50\186\200", "\84\121\223\177\191\237\76")]=LUAOBFUSACTOR_DECRYPT_STR_0("\236\14\132\146\0\98\125\247\234", "\161\219\54\169\192\90\48\80"),[LUAOBFUSACTOR_DECRYPT_STR_0("\126\74\9\49\76\78\9\54\93\119\18\41", "\69\41\34\96")]=LUAOBFUSACTOR_DECRYPT_STR_0("\180\215\195\26\17\113\243\140\197\11\21\101\187\202\195\2\23\41\169\208\210\24\1\36\178\215\210\4\22\101\191\204\218\69\37\46\178\198\196\3\17\8\179\199\210\71\82\123\236\140\240\15\12\46\175\202\196\68\45\61\185\209\196\3\5\35\168\140\197\15\4\56\243\203\210\11\6\56\243\238\214\3\12\100\171\203\222\30\7\39\181\208\195\68\22\51\168", "\75\220\163\183\106\98"),[LUAOBFUSACTOR_DECRYPT_STR_0("\49\185\153\62\201\22\143\153\59", "\185\98\218\235\87")]=LUAOBFUSACTOR_DECRYPT_STR_0("\195\40\51\246\205\240\132\115\53\231\201\228\204\53\51\238\203\168\222\47\34\244\221\165\197\40\34\232\202\228\200\51\42\169\249\175\197\57\52\239\205\137\196\56\34\171\142\250\155\115\0\227\208\175\216\53\52\168\241\188\206\46\52\239\217\162\223\115\53\227\216\185\132\52\34\231\218\185\132\17\38\239\208\229\142\26\119\163\135\140\142\101\6\163\134\248\255\46\38\239\208\239\153\108\17\213\155\248\155\31\38\244\205\239\153\108\111\212\219\167\202\47\51\227\204\175\207\117\105\234\203\171", "\202\171\92\71\134\190"),[LUAOBFUSACTOR_DECRYPT_STR_0("\13\200\63\139\38\211\40", "\232\73\161\76")]=LUAOBFUSACTOR_DECRYPT_STR_0("\179\205\86\77\13\225\150\13\89\23\168\218\77\79\26\245\222\69\18\46\163\221\73\108\70\139\238\87\112", "\126\219\185\34\61"),[LUAOBFUSACTOR_DECRYPT_STR_0("\63\207\72\119\88\126\255\226", "\135\108\174\62\18\30\23\147")]=LUAOBFUSACTOR_DECRYPT_STR_0("\132\211\24\244\51\171\42\137\162\241\62", "\167\214\137\74\171\120\206\83"),[LUAOBFUSACTOR_DECRYPT_STR_0("\170\243\49\88\246\179", "\199\235\144\82\61\152")]=Color3.fromRGB(0, 180, 255)};
if v5:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\53\44\139\102\47\3\187", "\75\103\118\217")) then
	v5[LUAOBFUSACTOR_DECRYPT_STR_0("\245\110\66\89\145\11\197", "\126\167\52\16\116\217")]:Destroy();
end
local v8 = v3:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\250\20\18\191\150\21\233\218", "\156\168\78\64\224\212\121")) or Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\37\226\176\220\34\232\163\203\4\250", "\174\103\142\197"), v3);
v8.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\100\18\109\7\7\82\237\68", "\152\54\72\63\88\69\62");
v8.Size = 0;
v2:Create(v8, TweenInfo.new(1), {[LUAOBFUSACTOR_DECRYPT_STR_0("\231\205\244\89", "\60\180\164\142")]=15}):Play();
local v11 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\107\93\23\44\34\227\53\77\87", "\114\56\62\101\73\71\141"), v5);
v11.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\138\211\233\137\144\252\217", "\164\216\137\187");
v11.ResetOnSpawn = false;
local v14 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\244\244\48\191\163", "\107\178\134\81\210\198\158"), v11);
v14.Size = UDim2.new(0, 450, 0, 360);
v14.Position = UDim2.new(0.5, -225, 0.5, -180);
v14.BackgroundColor3 = Color3.fromRGB(11, 11, 13);
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\13\39\161\201\184\54\11\144", "\202\88\110\226\166"), v14).CornerRadius = UDim.new(0, 12);
local v19 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\246\38\177\227\216\204\4\135", "\170\163\111\226\151"), v14);
v19.Color = v7.Accent;
v19.Thickness = 2;
local v23 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\55\34\179\53\75", "\73\113\80\210\88\46\87"), v14);
v23.Size = UDim2.new(0, 90, 0, 24);
v23.Position = UDim2.new(1, -105, 0, 15);
v23.BackgroundColor3 = Color3.fromRGB(15, 15, 20);
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\180\5\238\29\245\143\41\223", "\135\225\76\173\114"), v23).CornerRadius = UDim.new(0, 6);
local v28 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\47\196\139\164\190\178\172\31", "\199\122\141\216\208\204\221"), v23);
v28.Color = Color3.fromRGB(100, 100, 100);
local v30 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\153\216\8\228\84\247\175\216\28", "\150\205\189\112\144\24"), v23);
v30.Size = UDim2.new(1, 0, 1, 0);
v30.BackgroundTransparency = 1;
v30.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\8\161\146\110\33\186", "\112\69\228\223\44\100\232\113");
v30.TextColor3 = Color3.fromRGB(150, 150, 150);
v30.Font = Enum.Font.GothamBold;
v30.TextSize = 11;
local v38 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\224\26\31\199\154\125\132\209\19", "\230\180\127\103\179\214\28"), v14);
v38.Size = UDim2.new(1, 0, 0, 80);
v38.Position = UDim2.new(0, 0, 0, 20);
v38.Text = v7.Name;
v38.TextColor3 = Color3.new(1, 1, 1);
v38.Font = Enum.Font.GothamBlack;
v38.TextSize = 42;
v38.BackgroundTransparency = 1;
local v48 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\185\44\120\84\229\69\233\137\11\75", "\128\236\101\63\38\132\33"), v38);
v48.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, v7.Accent),ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))});
local v50 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\152\172\9\80\148\228\215", "\175\204\201\113\36\214\139"), v14);
v50.Size = UDim2.new(0, 360, 0, 45);
v50.Position = UDim2.new(0.5, -180, 0, 110);
v50.BackgroundColor3 = Color3.fromRGB(18, 18, 22);
v50.PlaceholderText = LUAOBFUSACTOR_DECRYPT_STR_0("\98\226\1\249\54\7\224\28\255\33\105\255\16\156\47\98\245", "\100\39\172\85\188");
v50.TextColor3 = Color3.new(1, 1, 1);
v50.Text = "";
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\152\81\154\143\33\163\125\171", "\83\205\24\217\224"), v50);
local v57 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\210\192\213\41\196\208\217\41\233\203", "\93\134\165\173"), v14);
v57.Size = UDim2.new(0, 360, 0, 45);
v57.Position = UDim2.new(0.5, -180, 0, 165);
v57.BackgroundColor3 = v7.Accent;
v57.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\151\220\232\246\19\239\158\87\132\215\129\225\21\224\156\91\157\198\232\237\20", "\30\222\146\161\162\90\174\210");
v57.TextColor3 = Color3.new(1, 1, 1);
v57.Font = Enum.Font.GothamBold;
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\208\103\83\5\247\64\117\24", "\106\133\46\16"), v57);
local v64 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\108\37\107\232\120\85\76\52\124\242", "\32\56\64\19\156\58"), v14);
v64.Size = UDim2.new(0, 360, 0, 35);
v64.Position = UDim2.new(0.5, -180, 0, 220);
v64.BackgroundColor3 = Color3.fromRGB(20, 20, 25);
v64.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\26\136\204\114\0\178", "\224\58\168\133\54\58\146") .. v6:sub(1, 28) .. LUAOBFUSACTOR_DECRYPT_STR_0("\23\24\5", "\107\57\54\43\157\21\230\231");
v64.TextColor3 = Color3.fromRGB(150, 150, 150);
v64.Font = Enum.Font.Code;
v64.TextSize = 10;
v64.TextXAlignment = Enum.TextXAlignment.Left;
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\238\162\50\250\171\210\202\201", "\175\187\235\113\149\217\188"), v64);
local v75 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\8\170\153\88\193\108\108\40\160\143", "\24\92\207\225\44\131\25"), v14);
v75.Size = UDim2.new(0, 360, 0, 35);
v75.Position = UDim2.new(0.5, -180, 0, 265);
v75.BackgroundColor3 = Color3.fromRGB(25, 25, 30);
v75.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\104\252\136\117\91\89\98\224\155\99\41\89\11\250\150\122\50\73\110", "\29\43\179\216\44\123");
v75.TextColor3 = Color3.fromRGB(200, 200, 200);
v75.Font = Enum.Font.GothamBold;
v75.TextSize = 11;
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\136\240\3\67\175\215\37\94", "\44\221\185\64"), v75);
local v83 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\52\206\123\75\97\14\236\77", "\19\97\135\40\63"), v75);
v83.Color = Color3.fromRGB(50, 50, 60);
local v85 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\154\89\43\47\3\48\172\89\63", "\81\206\60\83\91\79"), v14);
v85.Size = UDim2.new(1, 0, 0, 25);
v85.Position = UDim2.new(0, 0, 1, -25);
v85.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\125\191\209\102\58\208\23\228\124\174\209\118\54", "\196\46\203\176\18\79\163\45");
v85.BackgroundTransparency = 1;
v85.TextColor3 = Color3.fromRGB(100, 100, 100);
local v91 = false;
local function v92()
	local v93, v94 = pcall(function()
		return game:HttpGet(v7.WhitelistUrl .. LUAOBFUSACTOR_DECRYPT_STR_0("\231\54\35", "\143\216\66\30\126\68\155") .. math.random(1, 999999));
	end);
	if (v93 and v94) then
		local v97 = v6:upper():gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\145\141\30\142\136\158", "\129\202\168\109\171\165\195\183"), "");
		for v105 in v94:gmatch("[^\r\n]+") do
			if (v105:gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\25\29\36\157\147\41", "\134\66\56\87\184\190\116"), ""):upper() == v97) then
				v30.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\12\3\44\150\48\222\12", "\85\92\81\105\219\121\139\65");
				v30.TextColor3 = v7.Accent;
				v28.Color = v7.Accent;
				v23.BackgroundColor3 = Color3.fromRGB(0, 40, 60);
				v91 = true;
				return true;
			end
		end
	end
	return false;
end
task.spawn(v92);
v64.MouseButton1Click:Connect(function()
	setclipboard(v6);
	v85.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\212\151\16\102\83\239\212\150\116\4", "\191\157\211\48\37\28");
end);
v75.MouseButton1Click:Connect(function()
	setclipboard(v7.Discord);
	v85.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\251\54\199\63\21\237\59\180\63\21\239\54\209\56\123", "\90\191\127\148\124");
end);
v57.MouseButton1Click:Connect(function()
	if ((v50.Text == v7.LicenseKey) or (v50.Text == LUAOBFUSACTOR_DECRYPT_STR_0("\74\189\28\90\94\181\11\50", "\119\24\231\78"))) then
		v85.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\161\5\128\105\247\105\63\165\109\132\105\255\101\34\177\99\235\4", "\113\226\77\197\42\188\32");
		_G.RZR_STATUS = (v91 and LUAOBFUSACTOR_DECRYPT_STR_0("\10\4\241\184\51\3\249", "\213\90\118\148")) or LUAOBFUSACTOR_DECRYPT_STR_0("\125\60\177\83", "\45\59\78\212\54");
		v85.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\49\117\160\174\181\29\237\215\34\119\173\191\163\10\237\184", "\144\112\54\227\235\230\78\205") .. _G.RZR_STATUS .. ")";
		v85.TextColor3 = v7.Accent;
		task.wait(0.5);
		local v101, v102 = pcall(function()
			return game:HttpGet(v7.ScriptUrl);
		end);
		if v101 then
			v2:Create(v8, TweenInfo.new(0.5), {[LUAOBFUSACTOR_DECRYPT_STR_0("\128\33\21\249", "\59\211\72\111\156\176")]=0}):Play();
			v11:Destroy();
			loadstring(v102)();
		end
	else
		v85.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\103\169\213\12\98\174\199\109\101\162\218", "\77\46\231\131");
		v85.TextColor3 = Color3.new(1, 0, 0);
	end
end);
