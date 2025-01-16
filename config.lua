Config = {}

-- Configurações gerais dos guardas
Config.Guardas = {
    {
        -- GUARDAS QG
        quantidade = 15, -- Número de guardas
        mguarda = "g_m_m_chicold_01", -- Modelo do PED, esse é o padrão do GTA que pode ser localizado em https://docs.fivem.net/docs/game-references/ped-models/
        arma = "WEAPON_SPECIALCARBINE", -- Tipo de arma, verifique o nome que sua base está puxando as armas.
        distanciaDeteccao = 10.0, -- Distância para detecção de jogadores, ao chegar nessa área, ele poderá reagir ou não, conforme as permissões dadas.
        rotaSequencial = false, -- Definir se a rota segue sequencialmente ou aleatória
        permissoes = {"perm.bahamas"}, -- Lista de permissões para que o guarda ignore quem tem essa permissão.
        rotas = { -- Rotas feitas por TODOS os guardas do mesmo grupo
            vector3(-1362.83,-622.73,30.31),
            vector3(-1366.2,-625.33,30.33),
            vector3(-1371.04,-620.03,30.31),
            vector3(-1367.09,-615.92,30.31),
            -- vector3(-1397.6,-629.15,30.31),
            -- vector3(-1384.7,-636.11,28.7),
            -- vector3(-1374.03,-611.9,30.31),
            -- vector3(-1381.87,-602.7,30.72),
            -- vector3(-1377.13,-606.13,30.72),
            -- vector3(-1384.95,-600.89,30.72),
            -- vector3(-1410.47,-617.96,30.72),
            -- vector3(-1398.02,-613.93,30.72),
            -- vector3(-1401.75,-618.31,30.72),
            -- vector3(-1375.27,-621.65,30.63),
            -- vector3(-1387.06,-628.43,30.63),
        },
        andar = false, -- Adicionado o parâmetro para controlar o movimento
    },
    {
        -- GUARDAS QG
        quantidade = 15, -- Número de guardas
        mguarda = "g_m_m_chicold_01", -- Modelo do PED, esse é o padrão do GTA que pode ser localizado em https://docs.fivem.net/docs/game-references/ped-models/
        arma = "WEAPON_SPECIALCARBINE", -- Tipo de arma, verifique o nome que sua base está puxando as armas.
        distanciaDeteccao = 15.0, -- Distância para detecção de jogadores, ao chegar nessa área, ele poderá reagir ou não, conforme as permissões dadas.
        rotaSequencial = false, -- Definir se a rota segue sequencialmente ou aleatória
        permissoes = {"perm.vanilla"}, -- Lista de permissões para que o guarda ignore quem tem essa permissão.
         rotas = {
           --  vector3(-1362.83,-622.73,30.31),
           --  vector3(-1366.2,-625.33,30.33),
           --  vector3(-1371.04,-620.03,30.31),
           --  vector3(-1367.09,-615.92,30.31),
           --  vector3(-1397.6,-629.15,30.31),
           --  vector3(-1384.7,-636.11,28.7),
           --  vector3(-1374.03,-611.9,30.31),
        },
        andar = false, -- Adicionado o parâmetro para controlar o movimento
    },
}

-- OBSERVAÇÃO: Se em permissões você colocar mais de uma (o segundo grupo por exemplo), SEMPRE que um jogador possuir essas duas permissões SIMULTÂNEAS, ele será ignorado.
-- Se o jogador possuir apenas 1 das que está informada lá (não tem as duas permissões juntas no mesmo personagem) o guarda irá atirar normalmente! 
-- Então recomendo que coloque apenas 1 permissão para que eles não sejam literais no que está sendo informado.

-- Créditos: #Clebin047
-- Criado para o fórum FIVEMDEV.ORG
-- Não seja cuzão, dê os créditos se for repostar