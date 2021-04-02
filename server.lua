AddEventHandler('playerConnecting', function(name, skr, deferrals)
    local onlinePlayers = 0
    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            onlinePlayers = onlinePlayers + 1
        end
    end
    print(onlinePlayers)
    deferrals.defer()
    Wait(750)
    local NolfiAdaptive = [==[

        {
            "type": "AdaptiveCard",
            "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
            "version": "1.3",
            "backgroundImage": {
                "url": "]==]Config.backgroundImage[==["
            },
            "body": [
                {
                    "type": "Image",
                    "url": "]==]Config.ServerLogo[==["
                },
                {
                    "type": "TextBlock",
                    "text": "Velkommen til ]==]Config.ServerName[==[",
                    "wrap": true,
                    "horizontalAlignment": "Center",
                    "color": "light",
                    "size": "medium"
                },
                {
                    "type": "TextBlock",
                    "text": "Vi håber du nyder dit ophold!",
                    "wrap": true,
                    "horizontalAlignment": "Center",
                    "color": "light"
                },
                {
                    "type": "TextBlock",
                    "text": "Online Spillere: ]==]onlinePlayers[==[/]==]Config.Maxplayers[==[",
                    "wrap": true,
                    "horizontalAlignment": "Center",
                    "color": "light"
                },
                {
                    "type": "ActionSet",
                    "actions": [
                        {
                            "type": "Action.Submit",
                            "title": "]==] Config.Button1 [==[",
                            "style": "positive",
                            "id": "connect"
                        }
                    ]
                },
                {
                    "type": "ActionSet",
                    "actions": [
                        {
                            "type": "Action.OpenUrl",
                            "title": "]==] Config.Button2 [==[",
                            "style": "positive",
                            "url": "]==]Config.Website[==["
                        }
                    ]
                },
                {
                    "type": "ActionSet",
                    "actions": [
                        {
                            "type": "Action.OpenUrl",
                            "title": "]==] Config.Button3 [==[",
                            "style": "positive",
                            "url": "]==]Config.Discord[==["
                        }
                    ]
                }
            ]
        }

    ]==],

    deferrals.presentCard(NolfiAdaptive, function(data, rawData)

    if (data.submitId == 'connect') then 
            clicked = true;
            deferrals.done()
        end
    end)
end)