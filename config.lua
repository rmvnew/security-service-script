Config = {}

-- Configurações gerais dos guardas
Config.Guardas = {
    {
        -- GUARDAS QG
        quantidade = 3, -- Número de guardas
        rotas = { -- Rotas feitas por TODOS os guardas do mesmo grupo
            vector3(-1362.83,-622.73,30.31),
            vector3(-1366.2,-625.33,30.33),
            vector3(-1371.04,-620.03,30.31),
        },
        mguarda = "g_m_m_chicold_01", -- Modelo do PED, esse é o padrão do GTA que pode ser localizado em https://docs.fivem.net/docs/game-references/ped-models/
        arma = "WEAPON_MILITARYRIFLE", -- Tipo de arma, verifique o nome que sua base está puxando as armas.
        distanciaDeteccao = 15.0, -- Distância para detecção de jogadores, ao chegar nessa área, ele poderá reagir ou não, conforme as permissões dadas.
        rotaSequencial = false, -- Definir se a rota segue sequencialmente ou aleatória
        permissoes = {"perm.bahamas"} -- Lista de permissões para que o guarda ignore quem tem essa permissão.
    },
    {
        -- GUARDAS MANSÃO PRIVADA ILHA
        quantidade = 1, -- Número de guardas
        rotas = { -- Rotas feitas por TODOS os guardas do mesmo grupo
            vector3(-5871.42,1144.55,5.2),
            vector3(-5890.08,1126.4,3.71)
        },
        mguarda = "g_m_m_chicold_01", -- Modelo do PED, esse é o padrão do GTA que pode ser localizado em https://docs.fivem.net/docs/game-references/ped-models/
        arma = "WEAPON_MILITARYRIFLE", -- Tipo de arma, verifique o nome que sua base está puxando as armas.
        distanciaDeteccao = 15.0, -- Distância para detecção de jogadores, ao chegar nessa área, ele poderá reagir ou não, conforme as permissões dadas.
        rotaSequencial = true, -- Definir se a rota segue sequencialmente ou aleatória
        permissoes = {"mansao3.perm", "vipelite.perm"} -- Lista de permissões para que o guarda ignore quem tem essa permissão.
    }
}

-- OBSERVAÇÃO: Se em permissões você colocar mais de uma (o segundo grupo por exemplo), SEMPRE que um jogador possuir essas duas permissões SIMULTÂNEAS, ele será ignorado.
-- Se o jogador possuir apenas 1 das que está informada lá (não tem as duas permissões juntas no mesmo personagem) o guarda irá atirar normalmente! 
-- Então recomendo que coloque apenas 1 permissão para que eles não sejam literais no que está sendo informado.

-- Créditos: #Clebin047
-- Criado para o fórum FIVEMDEV.ORG
-- Não seja cuzão, dê os créditos se for repostar
