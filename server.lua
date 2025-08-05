local webhooks = {
    ["Police"] = "https://discord.com/api/webhooks/1402150421002453033/b0K3iw1kSJFXeG4CtXPFvDOZL18f7bZWPI4sQqNx2ws-Q48bJ5gnNU3RCMCZNUGn05jP",
    ["EMS"] = "https://discord.com/api/webhooks/1402150421002453033/b0K3iw1kSJFXeG4CtXPFvDOZL18f7bZWPI4sQqNx2ws-Q48bJ5gnNU3RCMCZNUGn05jP",
    ["Mechanic"] = "https://discord.com/api/webhooks/1402150421002453033/b0K3iw1kSJFXeG4CtXPFvDOZL18f7bZWPI4sQqNx2ws-Q48bJ5gnNU3RCMCZNUGn05jP",
    ["Taxi"] = "https://discord.com/api/webhooks/1402150421002453033/b0K3iw1kSJFXeG4CtXPFvDOZL18f7bZWPI4sQqNx2ws-Q48bJ5gnNU3RCMCZNUGn05jP",
    ["BurgerShot"] = "https://discord.com/api/webhooks/1402150421002453033/b0K3iw1kSJFXeG4CtXPFvDOZL18f7bZWPI4sQqNx2ws-Q48bJ5gnNU3RCMCZNUGn05jP",
    ["Weazel News"] = "https://discord.com/api/webhooks/1402150421002453033/b0K3iw1kSJFXeG4CtXPFvDOZL18f7bZWPI4sQqNx2ws-Q48bJ5gnNU3RCMCZNUGn05jP",
    ["Tow Truck"] = "https://discord.com/api/webhooks/1402150421002453033/b0K3iw1kSJFXeG4CtXPFvDOZL18f7bZWPI4sQqNx2ws-Q48bJ5gnNU3RCMCZNUGn05jP",
    ["Real Estate"] = "https://discord.com/api/webhooks/1402150421002453033/b0K3iw1kSJFXeG4CtXPFvDOZL18f7bZWPI4sQqNx2ws-Q48bJ5gnNU3RCMCZNUGn05jP",
    ["Lawyer"] = "https://discord.com/api/webhooks/1402150421002453033/b0K3iw1kSJFXeG4CtXPFvDOZL18f7bZWPI4sQqNx2ws-Q48bJ5gnNU3RCMCZNUGn05jP",
    ["Judge"] = "https://discord.com/api/webhooks/1402150421002453033/b0K3iw1kSJFXeG4CtXPFvDOZL18f7bZWPI4sQqNx2ws-Q48bJ5gnNU3RCMCZNUGn05jP",
}

RegisterNetEvent("syko-ui:sendToDiscord", function(job, message)
    local webhook = webhooks[job]
    if not webhook then return end

    local src = source
    local name = GetPlayerName(src)

    PerformHttpRequest(webhook, function(err, text, headers) end, "POST", json.encode({
        username = "Job Application - " .. job,
        embeds = {{
            title = "New Application for " .. job,
            description = message,
            color = 65280,
            footer = { text = "Submitted by " .. name .. " (ID: " .. src .. ")" },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }), { ["Content-Type"] = "application/json" })
end)
