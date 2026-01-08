# Syko Job Application UI

A simple, clean job application system for FiveM. Players can apply for jobs, answer custom questions, and have their applications sent directly to Discord.  

---

## Features

- Easy-to-use NUI job selection menu  
- Custom questions for each job  
- Discord webhook support for submissions  
- Phone animation when opening the menu  
- Fully styled, responsive UI  

---

## Installation

1. Place the resource folder (`syko-jobapplications`) in your `resources` folder.  
2. Add `ensure syko-jobapplications` to your `server.cfg`.  
3. Update webhooks and jobs as needed (see below).  

---

## Configuration

### Discord Webhooks

Each job can have its own Discord webhook. Open `server.lua` and edit the `webhooks` table:

```lua
local webhooks = {
    ["Police"] = "https://discord.com/api/webhooks/example",
    ["EMS"] = "https://discord.com/api/webhooks/example",
    ["Mechanic"] = "https://discord.com/api/webhooks/example",
    -- Add more jobs or update existing ones
}
