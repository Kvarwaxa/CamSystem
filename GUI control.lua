
local changeFeed = game.ReplicatedStorage.Remotes:WaitForChild("ChangeCameraFeed")
local camButtons = script.Parent.CamButtons
local viewport = script.Parent.CamFeed

local currentCam = nil

for _, btn in pairs(camButtons:GetChildren()) do
	if btn:IsA("TextButton") then
		btn.MouseButton1Click:Connect(function()
			changeFeed:FireServer(btn.Name)
		end)
	end
end

changeFeed.OnClientEvent:Connect(function(camPart)
	if camPart:IsA("Part") then
		local newCam = Instance.new("Camera")
		newCam.CFrame = camPart.CFrame + Vector3.new(0, 2, 0)
		viewport.CurrentCamera = newCam
	end
end)
