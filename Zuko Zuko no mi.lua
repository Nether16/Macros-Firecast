Forca = tonumber(sheet.ForcaTotal)
Vigor = tonumber(sheet.VigorTotal)

local ataques = {
    {nome = "Lança Líquida", nivel=1, custo_base = 32, custo_nivel = 10, dano_base = 12, dano_nivel = 8, img = "https://c.tenor.com/cCnsA8o7wZAAAAAd/tenor.gif"},
    {nome = "Barreira Metálica", nivel=1, custo_base = 28, custo_nivel = 10, dano_base = 8, dano_nivel = 8, img = "https://blob.firecast.com.br/blobs/MNUAACEU_3744027/sousou-no-frieren-fern.gif"},
    {nome = "Golpe de Ferro", nivel=1, custo_base = 40, custo_nivel = 10, dano_base = 22, dano_nivel = 12, img = "https://media4.giphy.com/media/ahMaehFrEx2BG/giphy.gif?cid=6c09b952zig6jjtlffpduewpw61bks1nowl1z5afnhawytvt&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=g"}
}

local ataquesDisponiveis = ataques
local nomesAtaques = {}

for i, atk in ipairs(ataquesDisponiveis) do
    table.insert(nomesAtaques, atk.nome)
end

local escolha = choose("Lista de Ataques", nomesAtaques)
local energia = 0

if escolha >= 1 and escolha <= #ataquesDisponiveis then
    local ataque = ataquesDisponiveis[escolha]
    send(ataque.nome)
    send("[§I " .. ataque.img .. "]")

    local custoNivel = ataque.custo_nivel * (ataque.nivel - 1)
    local danoNivel = ataque.dano_nivel * (ataque.nivel - 1)

    if ataque.nome == ataquesDisponiveis[1].nome  then
        energia = ataque.custo_base + custoNivel
        send("Dano : "..ataque.dano_base + danoNivel + Forca)
   elseif ataque.nome == ataquesDisponiveis[2].nome then
        energia = ataque.custo_base + custoNivel
        send("Defesa : "..ataque.dano_base  + danoNivel + math.floor(Vigor / 2))
    elseif ataque.nome == ataquesDisponiveis[3].nome then
        energia = ataque.custo_base + custoNivel
        send("Dano : "..ataque.dano_base + danoNivel + Forca)
    end
end

if energia > 0 then
    myCharacter:asyncUpdate({
        bar1Val = myCharacter.bar1Val - energia
    })
end