
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local changeFeed = ReplicatedStorage.Remotes.ChangeCameraFeed

changeFeed.OnServerEvent:Connect(function(player, camName)
    local cam = workspace.Cameras:FindFirstChild(camName)
    if cam and cam:IsA("Part") then
        changeFeed:FireClient(player, cam)
    end
end)
