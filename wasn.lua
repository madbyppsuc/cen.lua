local Rayfield = loadstring(game:HttpGet('https://sirius.menu'))()

local Window = Rayfield:CreateWindow({
   Name = "Red Panda Industries - Backrooms Hub",
   LoadingTitle = "Loading backrooms game...",
   LoadingSubtitle = "by wisnouns",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "BackroomsHubConfig",
      FileName = "BigHub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvite",
      RememberJoins = true
   },
   KeySystem = false
})

local MainTab = Window:CreateTab("Main Features", 4483362458) -- Title, Image ID

-- 1. GOD MODE FEATURE
local GodModeToggle = MainTab:CreateToggle({
   Name = "God Mode (Local)",
   CurrentValue = false,
   Flag = "GodModeFlag",
   Callback = function(Value)
      _G.GodMode = Value
      while _G.GodMode do
         task.wait(0.1)
         pcall(function()
            -- Set local player health to math.huge (infinity)
            -- Note: If the game has server-side kill blocks, this may only protect from local damage
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
               game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
               game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
            end
         end)
      end
      -- Reset health back to normal when turned off
      pcall(function()
         if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 100
            game.Players.LocalPlayer.Character.Humanoid.Health = 100
         end
       pcall)
   end,
})

-- 2. MAX LEVEL FEATURE
local MaxLevelButton = MainTab:CreateButton({
   Name = "Attempt Max Level (Client-Side Visual)",
   Callback = function()
      -- WARNING: This is usually visual only unless a RemoteEvent exploit is found.
      -- You must replace "leaderstats" and "Level" with the exact names used by the game.
      pcall(function()
         local player = game.Players.LocalPlayer
         local stats = player:FindFirstChild("leaderstats") or player:FindFirstChild("Data")
         if stats then
            local levelVal = stats:FindFirstChild("Level") or stats:FindFirstChild("Rank")
            if levelVal then
               levelVal.Value = 3201 -- Changes it on your screen
            end
         end
      end)
      Rayfield:Notify({
         Name = "Level Applied",
         Content = "If the game saves data securely, this change is only visual.",
         Duration = 5,
         Image = 4483362458,
      })
   end,
})

-- 3. GET ALL GAMEPASSES FEATURE
local GamepassButton = MainTab:CreateButton({
   Name = "Unlock Gamepass Tools/Skins (Local)",
   Callback = function()
      -- Standard gamepass bypasses involve spoofing the "UserOwnsGamePassAsync" check 
      -- or manually giving yourself the gamepass items found in ReplicatedStorage.
      Rayfield:Notify({
         Name = "Gamepass Unlocker",
         Content = "Scanning game files for hidden gamepass tools...",
         Duration = 4,
         Image = 4483362458,
      })
      
      pcall(function()
         -- Example method: Moving tools from a public folder to your backpack
         -- This only works if the developer left tools accessible in ReplicatedStorage
         for _, item in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            if item:IsA("Tool") then
               local clone = item:Clone()
               clone.Parent = game.Players.LocalPlayer.Backpack
            end
         end
      end)
   end,
})
