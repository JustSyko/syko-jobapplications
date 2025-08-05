local jobConfigs = {
    ["Police"] = {
        questions = {
            "Why do you want to be a police officer?",
            "What experience do you have in law enforcement?",
            "How would you handle a high-stress situation?",
            "What are your strengths as an officer?"
        }
    },
    ["EMS"] = {
        questions = {
            "Why do you want to be an EMS?",
            "What medical experience do you have?",
            "How do you handle emergency situations?",
            "Why should we pick you?"
        }
    },
    ["Mechanic"] = {
        questions = {
            "Why do you want to be a mechanic?",
            "What experience do you have with vehicles?",
            "What tools are you most comfortable with?",
            "Describe your ideal work environment."
        }
    },
    ["Taxi"] = {
        questions = {
            "Why do you want to be a taxi driver?",
            "How would you deal with a rude customer?",
            "What areas of the city do you know best?",
            "Why should we hire you?"
        }
    },
    ["BurgerShot"] = {
        questions = {
            "Why do you want to work at BurgerShot?",
            "Do you have food service experience?",
            "What’s your favorite menu item?",
            "What makes you a good teammate?"
        }
    },
    ["Weazel News"] = {
        questions = {
            "Why do you want to be a journalist?",
            "Do you have media experience?",
            "How do you find a good story?",
            "What makes you unique?"
        }
    },
    ["Tow Truck"] = {
        questions = {
            "Why do you want to be a tow driver?",
            "Do you know city towing laws?",
            "How would you deal with angry customers?",
            "Have you done this work before?"
        }
    },
    ["Real Estate"] = {
        questions = {
            "Why real estate?",
            "How would you sell a house?",
            "What’s important to a buyer?",
            "How would you handle negotiation?"
        }
    },
    ["Lawyer"] = {
        questions = {
            "Why do you want to be a lawyer?",
            "What legal experience do you have?",
            "How do you prepare for trial?",
            "What makes you good at this job?"
        }
    },
    ["Judge"] = {
        questions = {
            "Why do you want to be a judge?",
            "What is your view on justice?",
            "How do you stay unbiased?",
            "How would you deal with disrespect?"
        }
    },
}

RegisterCommand("apply", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "showJobSelector",
        jobs = jobConfigs
    })
end)

RegisterNUICallback("selectJob", function(data, cb)
    local jobName = data.job
    local config = jobConfigs[jobName]

    if config then
        SendNUIMessage({
            action = "showQuestions",
            job = jobName,
            questions = config.questions
        })
    end

    cb("ok")
end)

RegisterNUICallback("focusOff", function(_, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "hide" })
    cb("ok")
end)

RegisterNUICallback("sendToDiscord", function(data, cb)
    local job = data.job
    local message = data.message or "No message."

    TriggerServerEvent("syko-ui:sendToDiscord", job, message)

    cb("ok")
end)