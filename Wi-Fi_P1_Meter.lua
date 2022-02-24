_=loadfile and loadfile("TQAE.lua") {
    offline = true,
    logColors = { ["SYS"] = 'yellow', ["ERROR"]='red', ["WARN"] = 'orange', ["TRACE"] = 'blue', ["TEXT"] = 'grey' },
    fibColors = { ["DEBUG"] = 'red', ["TRACE"] = 'blue', ["WARNING"] = 'orange', ["ERROR"] = 'red', ["TEXT"] = 'grey' },
}

--%%name="Wi-Fi P1 meter"
--%%type="com.fibaro.deviceController"
--%%quickVars = {['IPv4'] = "192.168.2.43:1880"}

----------------------------------------------------------------------------------
-- Wi-Fi P1 meter
-- Version 1.0 (February 2022)
-- Copyright (c)2022 Joep Verhaeg <info@joepverhaeg.nl>

-- If you like using this Quick App you can buy me a coffee:
-- https://www.buymeacoffee.com/joep

-- Full documentation you can find at:
-- https://docs.joepverhaeg.nl/homewizard-p1-meter
----------------------------------------------------------------------------------
-- DESCRIPTION:
-- This Quick App reads the HomeWizard Wi-Fi P1 meter local API. It shows the 
-- energy meter readings and is optimized for the Energy Panel.

-- QUICK SETUP:
-- 1. Enable the LOCAL API in the HomeWizard Energy App under Settings -> Meters
-- 2. Set the IPv4 QUICK APP VARIABLE to the IP address of the Wi-Fi P1 meter you
--    want to read.
----------------------------------------------------------------------------------

class 'TotalPowerImportT1'(QuickAppChild)
function TotalPowerImportT1:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
    if fibaro.getValue(self.id, "rateType") ~= "consumption" then 
        self:updateProperty("rateType", "consumption")
        self:warning("Configured rateType interface of TotalPowerImportT1 child device (" ..self.id ..") to consumption")
    end
end

function TotalPowerImportT1:updateValue(data)
    self:updateProperty("value", data.total_power_import_t1_kwh) -- write in kWh!
    self:updateProperty("unit", "kWh")
    self:updateProperty("log", data.update_timestamp)
end

class 'TotalPowerImportT2'(QuickAppChild)
function TotalPowerImportT2:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
    if fibaro.getValue(self.id, "rateType") ~= "consumption" then 
        self:updateProperty("rateType", "consumption")
        self:warning(" Configured interface of TotalPowerImportT2 child device (" ..self.id ..") to consumption")
    end
end

function TotalPowerImportT2:updateValue(data)
    self:updateProperty("value", data.total_power_import_t2_kwh) -- write in kWh!
    self:updateProperty("unit", "kWh")
    self:updateProperty("log", data.update_timestamp)
end

class 'TotalPowerExportT1'(QuickAppChild)
function TotalPowerExportT1:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
    if fibaro.getValue(self.id, "rateType") ~= "production" then 
        self:updateProperty("rateType", "production")
        self:warning("Configured rateType interface of TotalPowerExportT1 child device (" ..self.id ..") to production")
    end
    -- Due a bug in the energy panel exclude the return device completely.
    if fibaro.getValue(self.id, "storeEnergyData") ~= false then
        self:updateProperty("storeEnergyData", false)
        self:warning("Configured storeEnergyData property of TotalPowerExportT1 child device (" ..self.id ..") to false")
    end
    if fibaro.getValue(self.id, "saveToEnergyPanel") ~= false then
        self:updateProperty("saveToEnergyPanel", false)
        self:warning("Configured saveToEnergyPanel property of TotalPowerExportT1 child device (" ..self.id ..") to false")
    end
end

function TotalPowerExportT1:updateValue(data)
    self:updateProperty("value", data.total_power_export_t1_kwh) -- write in kWh!
    self:updateProperty("unit", "kWh")
    self:updateProperty("log", data.update_timestamp)
end

class 'TotalPowerExportT2'(QuickAppChild)
function TotalPowerExportT2:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
    if fibaro.getValue(self.id, "rateType") ~= "production" then 
        self:updateProperty("rateType", "production")
        self:warning("Configured rateType interface of TotalPowerExportT2 child device (" ..self.id ..") to production")
    end
    -- Due a bug in the energy panel exclude the return device completely.
    if fibaro.getValue(self.id, "storeEnergyData") ~= false then
        self:updateProperty("storeEnergyData", false)
        self:warning("Configured storeEnergyData property of TotalPowerExportT1 child device (" ..self.id ..") to false")
    end
    if fibaro.getValue(self.id, "saveToEnergyPanel") ~= false then
        self:updateProperty("saveToEnergyPanel", false)
        self:warning("Configured saveToEnergyPanel interface of TotalPowerExportT1 child device (" ..self.id ..") to false")
    end
end

function TotalPowerExportT2:updateValue(data)
    self:updateProperty("value", data.total_power_export_t2_kwh) -- write in kWh!
    self:updateProperty("unit", "kWh")
    self:updateProperty("log", data.update_timestamp)
end

class 'ActivePower'(QuickAppChild)
function ActivePower:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
    -- Check if RateType is needed!
end

function ActivePower:updateValue(data)
    self:updateProperty("value", data.active_power_w) -- write in Watt!
    self:updateProperty("unit", "Watt")
    self:updateProperty("log", data.update_timestamp)
end

class 'ActivePowerL1'(QuickAppChild)
function ActivePowerL1:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
    -- Check if RateType is needed!
end

function ActivePowerL1:updateValue(data)
    self:updateProperty("value", data.active_power_l1_w) -- write in Watt!
    self:updateProperty("unit", "Watt")
    self:updateProperty("log", data.update_timestamp)
end

class 'ActivePowerL2'(QuickAppChild)
function ActivePowerL2:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
    -- Check if RateType is needed!
end

function ActivePowerL2:updateValue(data)
    self:updateProperty("value", data.active_power_l2_w) -- write in Watt!
    self:updateProperty("unit", "Watt")
    self:updateProperty("log", data.update_timestamp)
end

class 'ActivePowerL3'(QuickAppChild)
function ActivePowerL3:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
    -- Check if RateType is needed!
end

function ActivePowerL3:updateValue(data)
    self:updateProperty("value", data.active_power_l3_w) -- write in Watt!
    self:updateProperty("unit", "Watt")
    self:updateProperty("log", data.update_timestamp)
end

class 'TotalGas'(QuickAppChild)
function TotalGas:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
    -- Check if RateType is needed!
end

function TotalGas:updateValue(data)
    self:updateProperty("value", data.total_gas_m3)
    self:updateProperty("unit", "m³")
    self:updateProperty("log", data.gas_timestamp)
end

local function getChildVariable(child, varName)
    for _,v in ipairs(child.properties.quickAppVariables or {}) do
        if (v.name == varName) then 
            return v.value
        end
    end
    return ""
end

function QuickApp:getDeviceInfo()
    --mockdata = '{"product_type":"HWE-P1","product_name":"P1 Meter","serial":"3c39e7aabbcc","firmware_version":"2.11","api_version":"v1"}'
    self.http:request('http://' .. self.ipaddr .. '/api', {
            options = {
                headers = { Accept = "application/json" },
                method = 'GET'
            },
            success = function(response)
                --self:debug(response.status)
                --self:debug(response.data)
                local deviceinfo = json.decode(response.data)
                self:updateView("productLabel", "text", deviceinfo['product_type'])
                self:updateView("serialLabel", "text", "ID: " .. deviceinfo['serial'])
                self:updateView("firmwareLabel", "text", "Software: " .. deviceinfo['firmware_version'])
            end
            ,
            error = function(message)
                self:debug("error:", message)
            end         
        })
end

function QuickApp:updateMeterData()
    self.http:request('http://' .. self.ipaddr .. '/api/v1/data', {
            options = {
                headers = { Accept = "application/json" },
                method = 'GET'
            },
            success = function(response)
                --self:debug(response.status)
                --self:debug(response.data)
                local meterdata = json.decode(response.data,{others = {null=false}})
                local logtime   = os.date('%d-%m %H:%M:%S')
                -- Check if gas time is not nill.
                if (meterdata['gas_timestamp'] ~= nil) then
                    gastime   = string.sub(meterdata['gas_timestamp'],5,6) .. "-" .. string.sub(meterdata['gas_timestamp'],3,4) .. " " .. string.sub(meterdata['gas_timestamp'],7,8) .. ":" .. string.sub(meterdata['gas_timestamp'],9,10) .. ":" .. string.sub(meterdata['gas_timestamp'],11,12)
                else
                    gastime = ""
                end
                
                -- Write meter values to the QA variables at midnight to reset day values to zero.
                if os.date("%H:%M") == "00:00" then
                    self:setVariable("daystart_power_import_t1_kwh", meterdata['total_power_import_t1_kwh'])
                    self:setVariable("daystart_power_import_t2_kwh", meterdata['total_power_import_t2_kwh'])
                    self:setVariable("daystart_power_export_t1_kwh", meterdata['total_power_export_t1_kwh'])
                    self:setVariable("daystart_power_export_t2_kwh", meterdata['total_power_export_t2_kwh'])
                    self:debug("It's midnight, reset day values to zero.")
                end

                -- Update information in main device.
                self:updateView("modelLabel", "text", "Meter type: " .. meterdata['meter_model'])
                self:updateView("smrLabel", "text", "SMR versie: " .. string.format("%.1f", tonumber(meterdata['smr_version'])/10))
                self:updateView("wifiLabel", "text", "Wi-Fi: " .. meterdata['wifi_ssid'] .. " (" .. meterdata['wifi_strength'] .. " %)")

                -- Update the child devices.
                local daystart_power_import_t1_kwh = tonumber(self:getVariable("daystart_power_import_t1_kwh"))
                local daystart_power_import_t2_kwh = tonumber(self:getVariable("daystart_power_import_t2_kwh"))
                local daystart_power_export_t1_kwh = tonumber(self:getVariable("daystart_power_export_t1_kwh"))
                local daystart_power_export_t2_kwh = tonumber(self:getVariable("daystart_power_export_t2_kwh"))
                
                devicedata.total_power_import_t1_kwh = tonumber(meterdata['total_power_import_t1_kwh']) - daystart_power_import_t1_kwh
                devicedata.total_power_import_t2_kwh = tonumber(meterdata['total_power_import_t2_kwh']) - daystart_power_import_t2_kwh
                devicedata.total_power_export_t1_kwh = tonumber(meterdata['total_power_export_t1_kwh']) - daystart_power_export_t1_kwh
                devicedata.total_power_export_t2_kwh = tonumber(meterdata['total_power_export_t2_kwh']) - daystart_power_export_t2_kwh
                devicedata.active_power_w = tonumber(meterdata['active_power_w'])
                devicedata.active_power_l1_w = tonumber(meterdata['active_power_l1_w'])
                devicedata.active_power_l2_w = tonumber(meterdata['active_power_l2_w'])
                devicedata.active_power_l3_w = tonumber(meterdata['active_power_l3_w'])
                devicedata.total_gas_m3 = tonumber(meterdata['total_gas_m3'])
                devicedata.gas_timestamp = gastime
                devicedata.update_timestamp = logtime

                --self:debug(json.encode(devicedata))

                for id,child in pairs(self.childDevices) do 
                    child:updateValue(devicedata) 
                end
            end
            ,
            error = function(message)
                self:debug("Error:", message)
            end         
    })

    local timeout = 60000 - (os.date("%S") * 1000)
    fibaro.setTimeout(timeout, function() -- wait 1 minute
            self:updateMeterData()
        end)

end

function QuickApp:onInit()
    self:debug("QuickApp: Wi-Fi P1 meter initialisation")
    self.childsInitialized = true
    
    self.ipaddr = self:getVariable("IPv4")
    self.http   = net.HTTPClient({ timeout = 5000 })
    
    if not api.get("/devices/" .. self.id).enabled then
        self:warning("The Wi-Fi P1 meter devices is disabled!")
        return
    end
    
    if (self.ipaddr == "none") then
        self:warning("Please set the IPv4 Quick App variable to the IP address of the Wi-Fi P1 Meter!")
        return
    end

    -- Get smart meter data to determine if 1 or 3 phases are connected.
    self.http:request('http://' .. self.ipaddr .. '/api/v1/data', {
            options = {
                headers = { Accept = "application/json" },
                method = 'GET'
            },
            success = function(response)
                --self:debug(response.status)
                --self:debug(response.data)
                local meterdata = json.decode(response.data,{others = {null=false}})
                
                local cdevs = api.get("/devices?parentId="..self.id) or {}
                if #cdevs == 0 then
                    -- Child devices are not created yet, create them...
                    initChildData = {
                        {name="Verbruik vandaag (dal)", className="TotalPowerImportT1", type="com.fibaro.energyMeter"},
                        {name="Verbruik vandaag (normaal)", className="TotalPowerImportT2", type="com.fibaro.energyMeter"},
                        {name="Teruglevering vandaag (dal)", className="TotalPowerExportT1", type="com.fibaro.energyMeter"},
                        {name="Teruglevering vandaag (normaal)", className="TotalPowerExportT2", type="com.fibaro.energyMeter"},
                        {name="Actief vermogen", className="ActivePower", type="com.fibaro.powerMeter"}
                    }

                    if (meterdata['active_power_l1_w'] ~= nil) then
                        initChildData[#initChildData+1]={name="Fase 1", className="ActivePowerL1", type="com.fibaro.powerMeter"}
                    end
                    if (meterdata['active_power_l2_w'] ~= nil) then
                        initChildData[#initChildData+1]={name="Fase 2", className="ActivePowerL2", type="com.fibaro.powerMeter"}
                    end
                    if (meterdata['active_power_l3_w'] ~= nil) then
                        initChildData[#initChildData+1]={name="Fase 3", className="ActivePowerL3", type="com.fibaro.powerMeter"}
                    end
                    if (meterdata['total_gas_m3'] ~= nil) then
                        initChildData[#initChildData+1]={name="Gas", className="TotalGas", type="com.fibaro.gasMeter"}
                    end

                    for _,c in ipairs(initChildData) do
                        local child = self:createChildDevice(
                            {
                                name = c.name,
                                type=c.type,
                                initialProperties = {},
                                initialInterfaces = {},
                            },
                            _G[c.className] -- Fetch class constructor from class name
                        )
                        child:setVariable("className", c.className)  -- Save class name so we know when we load it next time.
                        child.parent = self
                        self:debug("Child device " .. child.name .. " created with id: ", child.id)
                    end

                    -- When the child devices are created, create the QA variables to calculate the day values.
                    self:setVariable("daystart_power_import_t1_kwh", meterdata['total_power_import_t1_kwh'])
                    self:setVariable("daystart_power_import_t2_kwh", meterdata['total_power_import_t2_kwh'])
                    self:setVariable("daystart_power_export_t1_kwh", meterdata['total_power_export_t1_kwh'])
                    self:setVariable("daystart_power_export_t2_kwh", meterdata['total_power_export_t2_kwh'])
                else
                    -- Ok, we already have children, instantiate them with the correct class
                    -- This is more or less what self:initChildDevices does but this can handle 
                    -- mapping different classes to the same type...
                    for _,child in ipairs(cdevs) do
                        local className = getChildVariable(child,"className") -- Fetch child class name
                        local childObject = _G[className](child) -- Create child object from the constructor name
                        self.childDevices[child.id]=childObject
                        childObject.parent = self -- Setup parent link to device controller
                    end
                end

                -- Create a devicedata array
                devicedata = {}
                devicedata.total_power_import_t1_kwh = tonumber(meterdata['total_power_import_t1_kwh'])
                devicedata.total_power_import_t2_kwh = tonumber(meterdata['total_power_import_t2_kwh'])
                devicedata.total_power_export_t1_kwh = tonumber(meterdata['total_power_export_t1_kwh'])
                devicedata.total_power_export_t2_kwh = tonumber(meterdata['total_power_export_t2_kwh'])
                devicedata.active_power_w = tonumber(meterdata['active_power_w'])
                devicedata.active_power_l1_w = tonumber(meterdata['active_power_l1_w'])
                devicedata.active_power_l2_w = tonumber(meterdata['active_power_l2_w'])
                devicedata.active_power_l3_w = tonumber(meterdata['active_power_l3_w'])
                devicedata.total_gas_m3 = tonumber(meterdata['total_gas_m3'])
                devicedata.gas_timestamp = ""
                devicedata.update_timestamp = ""

                self:getDeviceInfo()
                self:updateMeterData()
            end
            ,
            error = function(message)
                self:debug("Error:", message)
            end 
        })
end