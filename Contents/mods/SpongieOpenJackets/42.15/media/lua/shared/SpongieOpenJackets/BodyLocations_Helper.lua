local BodyLocations_Helper = {}


local group = BodyLocations.getGroup("Human")

local function doList(name, list, method)
    for i, v in ipairs(list) do
        method(name, v)
    end
end

function BodyLocations_Helper.AddLocation(name, i)
	group:getOrCreateLocation(name)
	group:moveLocationToIndex(name, i)
end

function BodyLocations_Helper.SetExclusive(name, list)
    -- for i, v in ipairs(list) do
    --     group:setExclusive(name, v)
    -- end
    doList(name, list, group.setExclusive)
end

function BodyLocations_Helper.SetHidden(name, list)
    -- for i, v in ipairs(list) do
    --     group:setHideModel(name, v)
    -- end
    doList(name, list, group.setHideModel)
end

function BodyLocations_Helper.SetAltModel(name, list)
    -- for i, v in ipairs(list) do
    --     group:setAltModel(name, v)
    -- end
    doList(name, list, group.setAltModel)
end

function BodyLocations_Helper.CreateLocation(name, data)
    BodyLocations_Helper.AddLocation(name, data.index)
    BodyLocations_Helper.SetExclusive(name, data.exclusive)
    BodyLocations_Helper.SetHidden(name, data.hidden)
    BodyLocations_Helper.SetAltModel(name, data.altModel)
end

return BodyLocations_Helper