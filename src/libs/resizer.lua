--- qwreey75
local Signal = require(script.Parent.Parent.Parent.signal)

local module = {}

local MouseTracker = game.Players.LocalPlayer.PlayerGui:FindFirstChild("MouseTracker") or Instance.new("ScreenGui",game.Players.LocalPlayer.PlayerGui)
MouseTracker.Name = "MouseTracker"
MouseTracker.ResetOnSpawn = false
MouseTracker.DisplayOrder = 2147483647

local Mouse = game.Players.LocalPlayer:GetMouse()

function ReleaserB()
	local n = Instance.new("ImageButton")
	n.Size = UDim2.new(0, 5000, 0, 5000)
	n.Position = UDim2.new(0.5, 0, 0.5, 0)
	n.AnchorPoint = Vector2.new(0.5,0.5)
	n.BackgroundTransparency = 1
	n.Name = "ResizeTracker"
	n.ZIndex = 2147483647
	n.Parent = MouseTracker
	return n
end

function module.SetResizer(Main,Settings)

	--Settings.CheckResizable

	local HandleC = {}

	local ReturnData = {}
	local Sizing = false
	local Releaser = nil
	local Face = ""

	local ResizeStarted = Signal.new()
	local ResizeEnded = Signal.new()
	ReturnData.ResizeStarted = ResizeStarted
	ReturnData.ResizeEnded = ResizeEnded

	local Size = Main.Size
	local ABS_Size = Main.AbsoluteSize
	local Fx
	local Fy
	local Pos = Main.Position

	local MinX = Settings.MinSizeX or 50
	local MinY = Settings.MinSizeY or 50

	local function Move(xx, yy)
		if Sizing then
			local X  = math.min(math.max(xx-Fx,MinX),Mouse.ViewSizeX)
			local Y  = math.min(math.max(yy-Fy,MinY),Mouse.ViewSizeY)

			local RX = math.min(math.max(Size.X.Offset-(xx - Fx - Size.X.Offset),MinX),Mouse.ViewSizeX)
			local RY = math.min(math.max(Size.Y.Offset-(yy - Fy - Size.Y.Offset),MinY),Mouse.ViewSizeY)

			local RPosX = Pos.X.Offset-RX+ABS_Size.X
			local RPosY = Pos.Y.Offset-RY+ABS_Size.Y

			if Face == "B" then
				Main.Size = UDim2.new(Size.X.Scale, Size.X.Offset, Size.Y.Scale, Y)
			elseif Face == "T" then
				Main.Size = UDim2.new(Size.X.Scale, Size.X.Offset, Size.Y.Scale, RY)
				Main.Position = UDim2.new(Pos.X.Scale,Pos.X.Offset,Pos.Y.Scale,RPosY)

			elseif Face == "R" then
				Main.Size = UDim2.new(Size.X.Scale, X, Size.Y.Scale, Size.Y.Offset)
			elseif Face == "RB" then
				Main.Size = UDim2.new(Size.X.Scale, X, Size.Y.Scale, Y)
			elseif Face == "RT" then
				Main.Size = UDim2.new(Size.X.Scale, X, Size.Y.Scale, RY)
				Main.Position = UDim2.new(Pos.X.Scale,Pos.X.Offset,Pos.Y.Scale,RPosY)

			elseif Face == "L" then
				Main.Size = UDim2.new(Size.X.Scale, RX, Size.Y.Scale, Size.Y.Offset)
				Main.Position = UDim2.new(Pos.X.Scale,RPosX,Pos.Y.Scale,Pos.Y.Offset)
			elseif Face == "LB" then
				Main.Size = UDim2.new(Size.X.Scale, RX, Size.Y.Scale, Y)
				Main.Position = UDim2.new(Pos.X.Scale,RPosX,Pos.Y.Scale,Pos.Y.Offset)
			elseif Face == "LT" then
				Main.Size = UDim2.new(Size.X.Scale, RX, Size.Y.Scale, RY)
				Main.Position = UDim2.new(Pos.X.Scale,RPosX,Pos.Y.Scale,RPosY)
			end
		end
	end

	local function Up()
		Sizing = false
		ResizeEnded:Fire()
		if Releaser ~= nil then
			Releaser:Destroy()
			Releaser = nil
		end
	end

	local function Down(xx, yy)
		if Settings.CheckResizable then
			if not Settings.CheckResizable() then
				return
			end
		end
		Sizing = true
		ResizeStarted:Fire()
		Size = Main.Size
		ABS_Size = Main.AbsoluteSize
		Fx = xx - Size.X.Offset
		Fy = yy - Size.Y.Offset
		Pos = Main.Position

		Releaser = ReleaserB()
		Releaser.MouseMoved:connect(function(x, y) Move(x, y) end)
		Releaser.MouseButton1Up:connect(Up)
		Releaser.MouseLeave:connect(Up)
	end

	function ReturnData:SetToHandle(ThisFace,Item)
		-- you can disconnect it from return data
		if Item then
			local New = Item.MouseButton1Down:Connect(function(xx,yy)
				Face = ThisFace
				Down(xx, yy)
			end)
			HandleC[#HandleC+1] = New
			return New
		end
	end

	function ReturnData:IsResizing()
		-- get is resizing
		return Sizing
	end

	function ReturnData:Destroy()
		Settings = nil
		for _,Connect in pairs(HandleC) do
			Connect:Disconnect()
		end
		HandleC = nil
		Sizing = nil
		Face = nil
		Size = nil
		ABS_Size = nil
		Fx = nil
		Fy = nil
		Pos = nil
		MinX = nil
		MinY = nil
		Move = nil
		Up = nil
		Down = nil
		if ResizeStarted then
			ResizeStarted:DisconnectAll()
			ResizeStarted = nil
		end
		if ResizeEnded then
			ResizeEnded:DisconnectAll()
			ResizeEnded = nil
		end
		if Releaser then
			Releaser:Destroy()
			Releaser = nil
		end
		ReturnData.Destroy = nil
		ReturnData.IsResizing = nil
		ReturnData.SetToHandle = nil
		ReturnData.IsResizing = nil
		ReturnData.ResizeEnded = nil
		ReturnData.ResizeStarted = nil
		ReturnData.ReturnData = nil
		ReturnData.SetToHandle = nil

		ReturnData = nil
		return nil
	end

	if Settings.Handle then
		ReturnData:SetToHandle("B" ,Settings.Handle.B )
		ReturnData:SetToHandle("T" ,Settings.Handle.T )

		ReturnData:SetToHandle("L" ,Settings.Handle.L )
		ReturnData:SetToHandle("LB",Settings.Handle.LB)
		ReturnData:SetToHandle("LT",Settings.Handle.LT)

		ReturnData:SetToHandle("R" ,Settings.Handle.R )
		ReturnData:SetToHandle("RB",Settings.Handle.RB)
		ReturnData:SetToHandle("RT",Settings.Handle.RT)
	end

	return ReturnData
end

module.SetReSizer = module.SetResizer

return module
