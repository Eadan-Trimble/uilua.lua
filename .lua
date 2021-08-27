--[[

	Real UILIB
	
]]
local Output = function(...)

end
local function Create(Name,Properties)
	local new = Instance.new(Name);
	table.foreach(Properties,function(i,v)
		new[i] = v;
	end)
	return new;
end
lib = {};
function lib:Startup(AutoConfig)
	
	-- Content
	self.Offset = UDim2.new(0,0,0.2,0);
	self.Tabs = {};
	self.Containers = {};
	self.ScreenGui = Create('ScreenGui',{Parent = game.CoreGui});
	
	-- Styles
	
	self.Styles = {
		TextButton = function()
			print'TextButton Sampled'
			local Sizer = Create('Frame',{Transparency = 0});
			local TextButton = Create('TextButton',{Parent = Sizer,
				
			});
			
			return {Main = Sizer};
		end,
		Slider = function()
			local Sizer = Create('Frame',{Transparency = 0});
			local Slider = Create('Frame',{Parent = Sizer,
				
			});
			
			return {Main = Sizer};
		end
	}
	
	-- Functions
	
	function self:AddTab(Name)
	    local tab = {Contents = {}};
	    self.Tabs[Name] = tab;
		
		
	end
	
	function self:AddFeature(tab,Name,Type)
	    if self.Styles[Type] then
			tab.Contents[Name] = self.Styles[Type]();
			
		else
			Output("Error, type of Style doesnt exist -- Feature");
		end
	end
	
	return self;
end


ui = lib:Startup(readfile());
print(ui.ScreenGui.TextButton);
