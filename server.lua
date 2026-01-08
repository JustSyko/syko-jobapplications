-- Discord webhook URLs for each job
local webhooks = {
    ["Police"] = "https://discord.com/api/webhooks/example",
    ["EMS"] = "https://discord.com/api/webhooks/example",
    ["Mechanic"] = "https://discord.com/api/webhooks/example",
    ["Taxi"] = "https://discord.com/api/webhooks/example",
    ["BurgerShot"] = "https://discord.com/api/webhooks/example",
    ["Weazel News"] = "https://discord.com/api/webhooks/example",
    ["Tow Truck"] = "https://discord.com/api/webhooks/example",
    ["Real Estate"] = "https://discord.com/api/webhooks/example",
    ["Lawyer"] = "https://discord.com/api/webhooks/example",
    ["Judge"] = "https://discord.com/api/webhooks/example",
}

-- Send job application to Discord via webhook
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
            color = 65280, -- green
            footer = { text = "Submitted by " .. name .. " (ID: " .. src .. ")" },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }), { ["Content-Type"] = "application/json" })
end)
