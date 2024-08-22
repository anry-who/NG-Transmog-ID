-- DDDHHHLL | дохлый



local function isempty(s)
  return s == nil or s == ''
end

if isempty(foo) then
  foo = "default value"
end

local function ShowIncomeMessage()
    DEFAULT_CHAT_FRAME:AddMessage("\124cFF9b97d7#\124r\124cFFa18fd1#\124r \124cFF78c7fcV\124r\124cFF7dbff5I\124r\124cFF83b7efE\124r\124cFF89afe9W\124r\124cFF8fa7e3E\124r\124cFF959fddRHELP\124r \124cFF9b97d7v\124r\124cFFa18fd11\124r \124cFF9b97d7b\124r\124cFF959fddy\124r \124cFF8fa7e3д\124r\124cFF89afe9о\124r\124cFF83b7efх\124r\124cFF7dbff5л\124r\124cFF78c7fcый\124r \124cFF9b97d7#\124r\124cFFa18fd1#\124r")
    DEFAULT_CHAT_FRAME:AddMessage("## Для трансмога пропишите: \124cFFFF0000/slotViewer\124r ##")
    DEFAULT_CHAT_FRAME:AddMessage("## Для отправки кода в ЛС пропишите: \124cFFFF0000/slotWhisp\124r ##")
    DEFAULT_CHAT_FRAME:AddMessage("## \124cFFFF0000 ОБЯЗАТЕЛЬНО НУЖЕН ОСМОТР \124r ##")

end

local eventFrame = CreateFrame("Frame")

eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(2, ShowIncomeMessage())
    end
end)

SLASH_VIEWERHELPSLOTVIEWER1 = "/slotViewer"
SlashCmdList["VIEWERHELPSLOTVIEWER"] = function(msg)
    local nickName, realm = UnitName("target")

    if isempty(nickName) then
        DEFAULT_CHAT_FRAME:AddMessage("Возьмите кого-нибудь в цель.")
        return
    else
        DEFAULT_CHAT_FRAME:AddMessage("\124cFF78c7fcП\124r\124cFF7dbff5р\124r\124cFF83b7efе\124r\124cFF89afe9д\124r\124cFF8fa7e3м\124r\124cFF959fddе\124r\124cFF9b97d7т\124r\124cFFa18fd1ы\124r \124cFF9b97d7и\124r\124cFF959fddг\124r\124cFF8fa7e3р\124r\124cFF89afe9о\124r\124cFF83b7efк\124r\124cFF7dbff5а\124r\124cFF78c7fc:\124r "..nickName.."")
    end

    local slots = {
        {id = 1, name = "Голова"},
        {id = 3, name = "Плечи"},
        {id = 15, name = "Спина"},
        {id = 5, name = "Грудь"},
        {id = 4, name = "Рубашка"},
        {id = 19, name = "Табард"},
        {id = 9, name = "Запястья"},
        {id = 10, name = "Перчатки"},
        {id = 6, name = "Пояс"},
        {id = 7, name = "Ноги"},
        {id = 8, name = "Ступни"},
        {id = 16, name = "Правая рука"},
        {id = 17, name = "Левая рука"},
        {id = 18, name = "Дальнобойное"},
    }

    local itemIDs = {}

    for _, slot in ipairs(slots) do
        local itemID = GetInventoryItemID("target", slot.id)

        if itemID and itemID > 0 then
            DEFAULT_CHAT_FRAME:AddMessage("\124cFFf92227"..slot.name.."\124r \124\124  ID: "..itemID.."\124h\124r")
            table.insert(itemIDs, itemID)
        end
    end

    local itemIDString = table.concat(itemIDs, "#")

    DEFAULT_CHAT_FRAME:AddMessage("## \124cFFFF0000 КОД ТРАНСМОГРИФИКАЦИИ \124r ##")
    DEFAULT_CHAT_FRAME:AddMessage(itemIDString)

    collectgarbage()
end

SLASH_VIEWERHELPSLOTWHISP1 = "/slotWhisp"
SlashCmdList["VIEWERHELPSLOTWHISP"] = function(msg)
    local playerName = UnitName("player")
    local targetName = UnitName("target")

    if isempty(targetName) then
        DEFAULT_CHAT_FRAME:AddMessage("Возьмите кого-нибудь в цель.")
        return
    else
        DEFAULT_CHAT_FRAME:AddMessage("\124cFF78c7fcСбор ID предметов с:\124r "..targetName)
    end

    local slots = {
        {id = 1, name = "Голова"},
        {id = 3, name = "Плечи"},
        {id = 15, name = "Спина"},
        {id = 5, name = "Грудь"},
        {id = 4, name = "Рубашка"},
        {id = 19, name = "Табард"},
        {id = 9, name = "Запястья"},
        {id = 10, name = "Перчатки"},
        {id = 6, name = "Пояс"},
        {id = 7, name = "Ноги"},
        {id = 8, name = "Ступни"},
        {id = 16, name = "Правая рука"},
        {id = 17, name = "Левая рука"},
        {id = 18, name = "Дальнобойное"},
    }

    local itemIDs = {}

    for _, slot in ipairs(slots) do
        local itemID = GetInventoryItemID("target", slot.id)

        if itemID and itemID > 0 then
            table.insert(itemIDs, itemID)
        end
    end

    local itemIDString = table.concat(itemIDs, "#")

    if not isempty(itemIDString) then
        SendChatMessage(itemIDString, "WHISPER", nil, playerName)
    else
        DEFAULT_CHAT_FRAME:AddMessage("У цели нет экипированных предметов.")
    end

    collectgarbage()
end