local text = "oh no what the fuck did you just do"


local function hasLetter(letter)
	if string.len(letter) != 1 then return false end
	letter = string.lower(letter)
	local text = Format("sound/animalese/%s.wav", letter)
	return file.Exists(text, "GAME") and text or false
end

local func = function(text)
	local i = 1
	local letter = ''
	local len = string.len(text)
	if len < 1 then return end

	while (i <= len) do
		letter = hasLetter(text[i])
		if letter then
			surface.PlaySound(string.Right(letter, string.len(letter)-6))
			Msg(text[i])
		end
		coroutine.wait(0.075)
		i = i + 1
	end
end
local co = coroutine.create( func )
coroutine.resume(co,text)

hook.Add("Think","da",function ()
	coroutine.resume(co)
end)