LizardSTB_DB = LizardSTB_DB or {}

local addon = CreateFrame("Frame")

local function BarToSlots(bar)
    local start = (bar-1)*12 + 1
    local finish = bar*12
    return start, finish
end

local function GetSlotData(slot)

    local t, id, subType = GetActionInfo(slot)
    if not t then return nil end

    if t == "spell" then
        local name = GetSpellInfo(id)
        return {type="spell", name=name}

    elseif t == "item" then
        local name = GetItemInfo(id)
        return {type="item", name=name}

    elseif t == "macro" then
        local name = GetMacroInfo(id)
        return {type="macro", name=name}

    elseif t == "companion" then
        return {type="companion", kind=subType, index=id}
    end
end


local function PlaceSlot(slot,data)

    ClearCursor()

    if not data then
        PickupAction(slot)
        ClearCursor()
        return
    end

    if data.type=="spell" then
        PickupSpell(data.name)

    elseif data.type=="item" then
        PickupItem(data.name)

    elseif data.type=="macro" then
        PickupMacro(data.name)

    elseif data.type=="companion" then
        PickupCompanion(data.kind,data.index)
    end

    PlaceAction(slot)
    ClearCursor()
end


local function SaveBar(bar)

    local s,e = BarToSlots(bar)

    LizardSTB_DB[bar] = {}

    for slot=s,e do
        LizardSTB_DB[bar][slot] = GetSlotData(slot)
    end

    print("|cff00ff00[LizardSTB]|r Saved bar "..bar)
end


local function LoadBar(bar)

    if not LizardSTB_DB[bar] then
        print("|cffff0000[LizardSTB]|r No data for bar "..bar)
        return
    end

    for slot,data in pairs(LizardSTB_DB[bar]) do
        PlaceSlot(slot,data)
    end

    print("|cff00ff00[LizardSTB]|r Loaded bar "..bar)
end


local function ClearBar(bar)

    if not LizardSTB_DB[bar] then
        print("|cffff0000[LizardSTB]|r No saved data for bar "..bar)
        return
    end

    LizardSTB_DB[bar] = nil
    print("|cff00ff00[LizardSTB]|r Cleared saved bar "..bar)
end


local function ListBars()

    local bars = {}

    for bar,_ in pairs(LizardSTB_DB) do
        table.insert(bars, bar)
    end

    if #bars == 0 then
        print("|cff00ff00[LizardSTB]|r No saved bars.")
        return
    end

    table.sort(bars)

    local list = table.concat(bars,", ")

    print("|cff00ff00[LizardSTB]|r Saved bars: "..list)
end


local function ApplyAll()

    for bar,_ in pairs(LizardSTB_DB) do
        LoadBar(bar)
    end
end


addon:RegisterEvent("PLAYER_LOGIN")

addon:SetScript("OnEvent",function()
    ApplyAll()
end)


SLASH_LizardSTB1 = "/lstb"

SlashCmdList["LizardSTB"] = function(msg)

    local cmd,bar = msg:match("(%S+)%s*(%d*)")
    bar = tonumber(bar)

    if cmd=="save" and bar then
        SaveBar(bar)

    elseif cmd=="load" and bar then
        LoadBar(bar)

    elseif cmd=="clear" and bar then
        ClearBar(bar)

    elseif cmd=="list" then
        ListBars()

    else
        print("|cff00ff00LizardSTB commands:")
        print("/lstb save <bar>")
        print("/lstb load <bar>")
        print("/lstb clear <bar>")
        print("/lstb list")
    end
end