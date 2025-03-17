local opcoes = {"Novo", "Antigo"}
local indice, sistema = choose("Qual sistema de XP está sendo usado?", opcoes, 1)
local xpganho = tonumber(inputQuery("Xp Ganhado")) or 0
local jogadores = choosePlayers("Selecione quais players ganharam XP")

for i = 1, #jogadores do
    local personagem = getCharacterOfPlayer(jogadores[i].login)
    local node = getCharacterSheet(personagem)

    node.nivel = tonumber(node.nivel) or 1
    node.xpatual = tonumber(node.xpatual) or 0
    node.expAtual = tonumber(node.expAtual) or 0

    if sistema == "Novo" then
        node.expAtual = tonumber(node.expAtual) or 0
        node.expMax = tonumber(node.expMax) or 1
        node.expAtual = node.expAtual + xpganho

        while node.exp >= node.expMax do
            node.nivel = node.nivel + 1
            node.exp = node.expAtual - node.expMax
        end
    else
        node.xp = tonumber(node.xp) or 1
        node.xpatual = node.xpatual + xpganho

        while node.xpatual >= node.xp do
            node.nivel = node.nivel + 1
            node.xpatual = node.xpatual - node.xp
        end
    end
end