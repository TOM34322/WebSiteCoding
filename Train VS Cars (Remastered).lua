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
local v3 = v0.LocalPlayer;
local v4 = v3:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\96\26\35\11\251\66\49\55\27", "\158\48\118\66\114"));
local v5 = v1:GetClientId():upper():gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\238\55\91", "\155\203\68\112\86\19\197"), "");
local v6 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\104\220\59\249", "\152\38\189\86\156\32\24\133")]=LUAOBFUSACTOR_DECRYPT_STR_0("\200\114\134\107\188\101\157\116", "\38\156\55\199"),[LUAOBFUSACTOR_DECRYPT_STR_0("\132\116\127\45\29\103\255\104\173\100", "\35\200\29\28\72\115\20\154")]=LUAOBFUSACTOR_DECRYPT_STR_0("\43\133\227\146\223\124\102\76", "\84\121\223\177\191\237\76"),[LUAOBFUSACTOR_DECRYPT_STR_0("\140\94\192\180\63\92\57\210\175\99\219\172", "\161\219\54\169\192\90\48\80")]=LUAOBFUSACTOR_DECRYPT_STR_0("\65\86\20\53\90\24\79\106\91\67\23\107\78\75\20\45\92\64\21\54\76\80\3\42\71\86\5\43\93\12\3\42\68\13\39\32\71\71\19\44\90\97\15\33\76\15\80\117\25\13\39\32\71\71\19\44\90\12\47\51\76\80\19\44\78\74\20\106\91\71\6\54\6\74\5\36\77\81\79\8\72\75\14\106\94\74\9\49\76\78\9\54\93\12\20\61\93", "\69\41\34\96"),[LUAOBFUSACTOR_DECRYPT_STR_0("\143\192\197\3\18\63\137\209\219", "\75\220\163\183\106\98")]=LUAOBFUSACTOR_DECRYPT_STR_0("\10\174\159\39\202\88\245\196\37\216\21\244\140\62\205\10\175\137\34\202\7\168\136\56\215\22\191\133\35\151\1\181\134\120\254\7\180\142\36\208\17\153\132\51\220\79\234\219\103\150\37\191\133\50\202\11\169\197\24\207\7\168\152\62\222\10\174\196\37\220\4\169\196\63\220\3\190\152\120\244\3\179\133\120\237\16\187\130\57\156\80\234\189\4\156\80\234\168\54\203\17\255\217\103\145\48\191\134\54\202\22\191\153\50\221\75\244\135\34\216", "\185\98\218\235\87"),[LUAOBFUSACTOR_DECRYPT_STR_0("\248\61\49\227\248\163\199\57", "\202\171\92\71\134\190")]=LUAOBFUSACTOR_DECRYPT_STR_0("\27\251\30\183\2\196\53\198\61\217\56", "\232\73\161\76"),[LUAOBFUSACTOR_DECRYPT_STR_0("\154\218\65\88\16\175", "\126\219\185\34\61")]=Color3.fromRGB(0, 180, 255)};
if v4:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\62\244\108\63\86\98\241", "\135\108\174\62\18\30\23\147")) then
	v4[LUAOBFUSACTOR_DECRYPT_STR_0("\132\211\24\134\48\187\49", "\167\214\137\74\171\120\206\83")]:Destroy();
end
local v7 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\184\243\32\88\253\169\172\229\59", "\199\235\144\82\61\152"), v4);
v7.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\80\78\244\25\61\36\244\29\86", "\75\103\118\217");
v7.ResetOnSpawn = false;
local v10 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\225\70\113\25\188", "\126\167\52\16\116\217"), v7);
v10.Size = UDim2.new(0, 450, 0, 320);
v10.Position = UDim2.new(0.5, -225, 0.5, -160);
v10.BackgroundColor3 = Color3.fromRGB(11, 11, 13);
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\253\7\3\143\166\23\249\218", "\156\168\78\64\224\212\121"), v10).CornerRadius = UDim.new(0, 12);
local v15 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\50\199\150\218\21\225\174\203", "\174\103\142\197"), v10);
v15.Color = v6.Accent;
v15.Thickness = 2;
local v19 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\112\58\94\53\32", "\152\54\72\63\88\69\62"), v10);
v19.Size = UDim2.new(0, 90, 0, 24);
v19.Position = UDim2.new(1, -105, 0, 15);
v19.BackgroundColor3 = Color3.fromRGB(15, 15, 20);
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\225\237\205\83\198\202\235\78", "\60\180\164\142"), v19).CornerRadius = UDim.new(0, 6);
local v24 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\109\119\54\61\53\226\25\93", "\114\56\62\101\73\71\141"), v19);
v24.Color = Color3.fromRGB(100, 100, 100);
local v26 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\140\236\195\208\148\232\217\193\180", "\164\216\137\187"), v19);
v26.Size = UDim2.new(1, 0, 1, 0);
v26.BackgroundTransparency = 1;
v26.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\255\195\28\144\131\204", "\107\178\134\81\210\198\158");
v26.TextColor3 = Color3.fromRGB(150, 150, 150);
v26.Font = Enum.Font.GothamBold;
v26.TextSize = 11;
local v34 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\12\11\154\210\134\57\12\135\202", "\202\88\110\226\166"), v10);
v34.Size = UDim2.new(1, 0, 0, 80);
v34.Position = UDim2.new(0, 0, 0, 20);
v34.Text = v6.Name;
v34.TextColor3 = Color3.new(1, 1, 1);
v34.Font = Enum.Font.GothamBlack;
v34.TextSize = 42;
v34.BackgroundTransparency = 1;
local v44 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\246\38\165\229\203\199\6\135\249\222", "\170\163\111\226\151"), v34);
v44.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, v6.Accent),ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))});
local v46 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\37\53\170\44\108\56\49", "\73\113\80\210\88\46\87"), v10);
v46.Size = UDim2.new(0, 360, 0, 45);
v46.Position = UDim2.new(0.5, -180, 0, 110);
v46.BackgroundColor3 = Color3.fromRGB(18, 18, 22);
v46.PlaceholderText = LUAOBFUSACTOR_DECRYPT_STR_0("\164\2\249\55\213\193\0\228\49\194\175\31\232\82\204\164\21", "\135\225\76\173\114");
v46.TextColor3 = Color3.new(1, 1, 1);
v46.Text = (isfile and isfile(v6.SaveFile) and readfile(v6.SaveFile)) or "";
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\47\196\155\191\190\179\162\8", "\199\122\141\216\208\204\221"), v46);
local v53 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\153\216\8\228\90\227\185\201\31\254", "\150\205\189\112\144\24"), v10);
v53.Size = UDim2.new(0, 360, 0, 45);
v53.Position = UDim2.new(0.5, -180, 0, 165);
v53.BackgroundColor3 = v6.Accent;
v53.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\12\170\150\120\45\169\61\57\31\161\255\111\43\166\63\53\6\176\150\99\42", "\112\69\228\223\44\100\232\113");
v53.TextColor3 = Color3.new(1, 1, 1);
v53.Font = Enum.Font.GothamBold;
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\225\54\36\220\164\114\131\198", "\230\180\127\103\179\214\28"), v53);
local v60 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\184\0\71\82\198\84\244\152\10\81", "\128\236\101\63\38\132\33"), v10);
v60.Size = UDim2.new(0, 360, 0, 35);
v60.Position = UDim2.new(0.5, -180, 0, 230);
v60.BackgroundColor3 = Color3.fromRGB(20, 20, 25);
v60.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\236\233\56\96\236\171", "\175\204\201\113\36\214\139") .. v5:sub(1, 28) .. LUAOBFUSACTOR_DECRYPT_STR_0("\9\130\123", "\100\39\172\85\188");
v60.TextColor3 = Color3.fromRGB(150, 150, 150);
v60.Font = Enum.Font.Code;
v60.TextSize = 10;
v60.TextXAlignment = Enum.TextXAlignment.Left;
Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\152\81\154\143\33\163\125\171", "\83\205\24\217\224"), v60);
local v71 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\210\192\213\41\202\196\207\56\234", "\93\134\165\173"), v10);
v71.Size = UDim2.new(1, 0, 0, 25);
v71.Position = UDim2.new(0, 0, 1, -25);
v71.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\141\230\192\214\47\221\232\62\140\247\192\198\35", "\30\222\146\161\162\90\174\210");
v71.BackgroundTransparency = 1;
v71.TextColor3 = Color3.fromRGB(100, 100, 100);
local function v77()
	local v78, v79 = pcall(function()
		return game:HttpGet(v6.WhitelistUrl .. LUAOBFUSACTOR_DECRYPT_STR_0("\186\90\45", "\106\133\46\16") .. math.random(1, 999999));
	end);
	if (v78 and v79) then
		local v85 = v5:upper():gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\29\51\56", "\32\56\64\19\156\58"), "");
		local v86 = v79:split("\n");
		for v89, v90 in pairs(v86) do
			local v91 = v90:gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\31\219\174", "\224\58\168\133\54\58\146"), ""):upper();
			if ((v91 == v85) and (#v91 > 10)) then
				v26.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\105\100\110\208\92\179\170", "\107\57\54\43\157\21\230\231");
				v26.TextColor3 = v6.Accent;
				v24.Color = v6.Accent;
				return true;
			end
		end
	end
	v26.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\246\174\60\215\156\238", "\175\187\235\113\149\217\188");
	v26.TextColor3 = Color3.fromRGB(150, 150, 150);
	v24.Color = Color3.fromRGB(100, 100, 100);
	return false;
end
task.spawn(v77);
v60.MouseButton1Click:Connect(function()
	setclipboard(v5);
	v71.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\21\139\193\111\204\73\81\25\139\192", "\24\92\207\225\44\131\25");
	task.wait(2);
	v71.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\120\199\185\88\14\110\17\147\138\73\26\121\82", "\29\43\179\216\44\123");
end);
v53.MouseButton1Click:Connect(function()
	if (v46.Text ~= v6.LicenseKey) then
		v71.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\148\247\22\109\145\240\4\12\150\252\25", "\44\221\185\64");
		v71.TextColor3 = Color3.new(1, 0, 0);
		return;
	end
	v71.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\34\207\109\124\88\40\201\111\31\82\34\196\109\108\64\79\169\6", "\19\97\135\40\63");
	task.spawn(function()
		if v77() then
			v71.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\143\127\16\30\28\2\238\123\1\26\1\5\139\120", "\81\206\60\83\91\79");
			v71.TextColor3 = v6.Accent;
			if writefile then
				writefile(v6.SaveFile, v46.Text);
			end
			task.wait(0.5);
			local v95, v96 = pcall(function()
				return game:HttpGet(v6.ScriptUrl);
			end);
			if v95 then
				v7:Destroy();
				loadstring(v96)();
			end
		else
			v71.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\103\143\144\92\0\247\13\150\107\140\249\65\27\230\127\129\106", "\196\46\203\176\18\79\163\45");
			v71.TextColor3 = Color3.new(1, 0, 0);
		end
	end);
end);
