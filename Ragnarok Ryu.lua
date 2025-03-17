Forca = tonumber(sheet.ForcaTotal)
Combate = tonumber(sheet.CombateTotal)
arma = 14
bonus = 0

local ataques = {
    {nome = "Járngreipr (Punho de Ferro)", nivel=1, custo_base = 30, custo_nivel = 10, dano_base = 10, dano_nivel = 4, img = ""},
    {nome = "Asgard’s Vörðr (Guardião de Asgard)", nivel=1, custo_base = 40, custo_nivel = 10, dano_base = 16, dano_nivel = 8, img = ""},
    {nome = "Fjölnir's Hregg (Tempestade de Fjölnir)", nivel=1, custo_base = 50, custo_nivel = 10, dano_base = 30, dano_nivel = 12, area = 10, img = ""}
}

local nomesAtaques = {}

for i, atk in ipairs(ataques) do
    table.insert(nomesAtaques, atk.nome)
end

local escolha = choose("Lista de Ataques", nomesAtaques)
local energia = 0

if escolha >= 1 and escolha <= #ataques then
    local ataque = ataques[escolha]
    send(ataque.nome)
    send("[§I " .. ataque.img .. "]")

    local custoNivel = ataque.custo_nivel * (ataque.nivel - 1)
    local danoNivel = ataque.dano_nivel * (ataque.nivel - 1)

    if ataque.nome == "Járngreipr (Punho de Ferro)" then
        energia = ataque.custo_base + custoNivel
        local DT = tonumber(inputQuery("DT"))
        for i = 1, 4 do
            local rolagem = roll("1d20 )
            local atk = rolagem + Combate
            local crit = 1
            if atk >= DT then
                if (i == 4 or rolagem == 20) then crit = 2 end
                send("Dano: " .. ((ataque.dano_base + danoNivel + Forca + bonus + arma) * crit))
            end
        end

    elseif ataque.nome == "Asgard’s Vörðr (Guardião de Asgard)" then
        energia = ataque.custo_base + custoNivel
        send("Dano: " .. (ataque.dano_base + danoNivel + Forca + bonus + arma))

    elseif ataque.nome == "Fjölnir's Hregg (Tempestade de Fjölnir)" then
        energia = ataque.custo_base + custoNivel
        send("Dano: " .. (ataque.dano_base + danoNivel + Forca + bonus + arma) .. ", Em uma área de " .. ataque.area .. "m")
    end
end

if energia > 0 then
    myCharacter:asyncUpdate({
        bar1Val = myCharacter.bar1Val - energia
    })
end