local player = game.Players.LocalPlayer
local varX = player.Character.UpperTorso.Position.X
local varY = player.Character.UpperTorso.Position.Y
local varZ = player.Character.UpperTorso.Position.Z

local webhook = "https://discord.com/api/webhooks/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" --webhook link

local embed = {
    ["title"]="XYZ Location", --title of the embed
    ["description"]="X: "..varX.." Y: "..varY.." Z: "..varZ, --description of the embed
    ["type"]="rich", --type of the embed
    ["color"] = 16711680, --color of the embed (in decimal)
}

local data = {
    ["username"] = "Location Finder", --username of the webhook
    ["embeds"] = {embed},

    --[[

    -- Uncomment the following line to add an avatar to the webhook --
    ["avatar_url"] = "https://cdn.discordapp.com/attachments/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", -- link to the profile picture of the webhook

    --]]

    ["embeds"] = {embed},
}

local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
    ["Content-Type"] = "application/json"
}

--post the data to the webhook
syn.request({ --uses a synapse x function to post the data. We use syn request because a normal http request will not work.
    Url = webhook,
    Method = "POST",
    Headers = headers,
    Body = newdata
})
