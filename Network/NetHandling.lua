function Initialize()
	CONNECTION=0
	CREDIBILITY=0
	REQUIREMENT=7
	start=1
	LASTSTATE=CONNECTION
end


function connection(state)
	state=tonumber(state)
	if CONNECTION==0 then
		CONNECTION=state
		connection_confirm()
		return end
	if state==0 then return end
	--print("State: " .. state .. "  Creditbility:" .. CREDIBILITY )
	if CONNECTION~=state then
		CREDIBILITY = CREDIBILITY + 1
		else
		CREDIBILITY = 0
		end
	if CREDIBILITY>=REQUIREMENT then
		CONNECTION=state
		if LASTSTATE~=CONNECTION then connection_confirm() end
		end
end

function connection_confirm()
	CREDIBILITY = 0
	if CONNECTION==1 then
		LASTSTATE=1
		SKIN:Bang('[!SetOption "meterRefresh" "ImageTint"  "#*Color*#"][!DisableMeasure Flash][!SetOption "meterRefresh" "ImageAlpha"  "255"][!CommandMeasure Animation "Execute 4"]')
		else
		LASTSTATE=0
		SKIN:Bang('[!SetOption "meterRefresh" "ImageTint"  "100,100,100"][!EnableMeasure Flash][!SetOption "meterRefresh" "ImageAlpha"  "255"]')
	end
	if CONNECTION==-1 then SKIN:Bang('[!CommandMeasure Animation "Execute 2"]') end
	if CONNECTION==1 then
		if start==1 then start=0 else
		SKIN:Bang('[!CommandMeasure Animation "Execute 1"]')
		end
	end
end