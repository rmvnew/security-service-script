

Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

local guardas = {}
local grupoGuardas = GetHashKey("grupo_guardas")
local guardsConfig = Config.Guardas

AddRelationshipGroup("grupo_guardas")
SetRelationshipBetweenGroups(0, grupoGuardas, grupoGuardas)

function LoadModel(model)
    if not HasModelLoaded(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(10)
        end
    end
end

function VerificarPermissoes(user_id, permissoes, callback)
    local eventName = "guarda:callbackPermissao" .. user_id .. GetGameTimer()

    AddEventHandler(eventName, function(result)
        callback(result)
        RemoveEventHandler(eventName)
    end)
    TriggerServerEvent("guarda:verificarPermissao", user_id, permissoes)
end

local function criarGuarda(index, config, guardaIndex, rota)
    local modelHash = GetHashKey(config.mguarda)
    LoadModel(modelHash)

    local coords = rota

    local guarda = CreatePed(4, modelHash, coords.x, coords.y, coords.z, 0.0, true, true)
    SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(guarda), true)
    SetEntityAsNoLongerNeeded(guarda)
    
    SetPedMaxHealth(guarda, 500)
    SetPedRelationshipGroupHash(guarda, grupoGuardas)
    SetPedCombatAttributes(guarda, 46, true)
    SetPedFleeAttributes(guarda, 0, false)

    local armaHash = GetHashKey(config.arma)
    GiveWeaponToPed(guarda, armaHash, 255, true, true)
    SetCurrentPedWeapon(guarda, armaHash, true)

    SetPedArmour(guarda, 300)

     guardas[index] = { ped = guarda, config = config, rotaIndex = 1, guardaIndex = guardaIndex }
    
     --  Lógica de detecção e combate imediato após a criação
    local jogadorMaisProximo = GetClosestPlayerToPed(guarda, config.distanciaDeteccao)
     if jogadorMaisProximo then
        local jogadorId = GetPlayerServerId(NetworkGetEntityOwner(jogadorMaisProximo))
        VerificarPermissoes(jogadorId, config.permissoes, function(temPermissao)
             if not temPermissao then
                 if GetEntityHealth(jogadorMaisProximo) > 101 then
                    TaskCombatPed(guarda, jogadorMaisProximo, 0, 16)
                    end
                 end
             end)
         end
    
    return guarda
end

local function removerGuarda(index)
    if guardas[index] and DoesEntityExist(guardas[index].ped) then
        DeletePed(guardas[index].ped)
        guardas[index] = nil
    end
end

CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())

        for i, config in ipairs(guardsConfig) do
            for j = 1, config.quantidade do
                for k, rota in ipairs(config.rotas) do
                    local index = i .. "-" .. j .. "-" .. k
                    local guardaData = guardas[index]
                    local distance = #(playerCoords - vector3(rota.x, rota.y, rota.z))

                    if distance <= 30 then
                        if not guardaData then
                            criarGuarda(index, config, j, rota)
                        end
                     elseif guardaData then
                        removerGuarda(index)
                     end
                 end
            end
        end

        for i, guardaData in pairs(guardas) do
             local ped = guardaData.ped
             local config = guardaData.config
             local rota = config.rotas
             if DoesEntityExist(ped) and not IsEntityDead(ped) then
                 local jogadorMaisProximo = GetClosestPlayerToPed(ped, config.distanciaDeteccao)
                 if jogadorMaisProximo then
                     local jogadorId = GetPlayerServerId(NetworkGetEntityOwner(jogadorMaisProximo))
                     VerificarPermissoes(jogadorId, config.permissoes, function(temPermissao)
                         if temPermissao then
                             ClearPedTasks(ped)
                         else
                             if GetEntityHealth(jogadorMaisProximo) > 101 then
                                 TaskCombatPed(ped, jogadorMaisProximo, 0, 16)
                             end
                         end
                     end)
                 else
                   if config.andar then
                     local atualCoords = GetEntityCoords(ped)
                     local destino = rota[guardaData.rotaIndex]

                     if #(atualCoords - vector3(destino.x, destino.y, destino.z)) < 1.5 then
                            guardaData.rotaIndex = (guardaData.rotaIndex % #rota) + 1
                             destino = rota[guardaData.rotaIndex]
                     end

                     TaskGoStraightToCoord(ped, destino.x, destino.y, destino.z, 1.0, -1, 0.0, 0.0)
                   else
                        ClearPedTasks(ped)
                  end
                 end
              end
        end
        Wait(1000)
    end
end)


function VerificarPermissoes(jogadorId, permissoes, callback)
    TriggerServerEvent("guarda:verificarPermissao", jogadorId, permissoes)
    RegisterNetEvent("guarda:callbackPermissao")
    AddEventHandler("guarda:callbackPermissao", function(temPermissao)
        callback(temPermissao)
    end)
end

function GetClosestPlayerToPed(ped, radius)
    local players = GetActivePlayers()
    local closestPlayer, closestDistance = nil, radius

    for _, player in ipairs(players) do
        local playerPed = GetPlayerPed(player)
        local distance = #(GetEntityCoords(playerPed) - GetEntityCoords(ped))
        if distance < closestDistance then
            closestDistance = distance
            closestPlayer = playerPed
        end
    end
    return closestPlayer
end