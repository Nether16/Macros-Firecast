Forca = tonumber(sheet.ForcaTotal)
bonus = tonumber(inputQuery("Bônus"))

local formas = {"Forma Híbrida", "Forma Completa"}
local formaEscolhida = choose("Escolha a Forma", formas)

local ataques = {
    ["Forma Híbrida"] = {
        {nome = "Fire Ken Pistol", nivel=1, custo_base = 28, custo_nivel = 10, dano_base = 6, dano_nivel = 4, img = "https://i.pinimg.com/originals/b8/53/f9/b853f9b959a3ac8145ff4e95b0c75e24.gif"},
        {nome = "Internal Blast", nivel=1, custo_base = 42, custo_nivel = 10, dano_base = 15, dano_nivel = 8, img = "https://i.pinimg.com/originals/41/ce/fd/41cefd62c7f081f55b0d1efcc56b8a22.gif"},
        {nome = "Infernal Bakudan", nivel=1, custo_base = 58, custo_nivel = 10, dano_base = 29, dano_nivel = 12, img = "https://i.pinimg.com/originals/e4/72/e2/e472e2b66232074198f784b1f4da7232.gif"}
    },
    ["Forma Completa"] = {
        {nome = "Moon Destroyer", nivel=1, custo_base = 44, custo_nivel = 10, dano_base = 18, dano_nivel = 8, img = "https://i.pinimg.com/originals/4e/b2/d1/4eb2d1d2cc5d9f22d7657c23641e6c6f.gif"},
        {nome = "Esfera Cerúlia", nivel=1, custo_base = 50, custo_nivel = 10, dano_base = 15, dano_nivel = 8, img = "https://i.pinimg.com/originals/00/88/76/00887674b4a9f4be1c118c5ca392afc7.gif"},
        {nome = "Fire Dance Blast", nivel=1, custo_base = 70, custo_nivel = 10, dano_base = 35, dano_nivel = 12, img = "https://i.pinimg.com/originals/b2/4a/14/b24a14cd5109ef90223cfda09389c6e6.gif"}
    }
}

local formaSelecionada = formas[formaEscolhida]
local ataquesDisponiveis = ataques[formaSelecionada]
local nomesAtaques = {}

for i, atk in ipairs(ataquesDisponiveis) do
    table.insert(nomesAtaques, atk.nome)
end

local escolha = choose("Lista de Ataques - " .. formaSelecionada, nomesAtaques)
local energia = 0

if escolha >= 1 and escolha <= #ataquesDisponiveis then
    local ataque = ataquesDisponiveis[escolha]
    send(ataque.nome)
    send("[§I " .. ataque.img .. "]")

   local custoNivel = ataque.custo_nivel * (ataque.nivel - 1)
   local danoNivel = ataque.dano_nivel *  (ataque.nivel - 1)

    if ataque.nome == ataquesDisponiveis[1].nome  then
        energia = ataque.custo_base + custoNivel
        send("Dano :  ".. 6 + danoNivel + Forca + bonus)
   elseif ataque.nome == ataquesDisponiveis[2].nome then
        energia = ataque.custo_base + custoNivel
         send("Dano :  ".. 15 + danoNivel + Forca + bonus)
    elseif ataque.nome == ataquesDisponiveis[3].nome then
        energia = ataque.custo_base + custoNivel
        send("Dano :  ".. 29 + danoNivel + Forca + bonus)
    elseif ataque.nome == ataquesDisponiveis[1].nome then
        energia = ataque.custo_base + custoNivel
        send("Dano :  ".. 15 + danoNivel + Forca + bonus)
    elseif ataque.nome == ataquesDisponiveis[2].nome then
        energia = ataque.custo_base + custoNivel
        send("Defesa :  ".. 15 + danoNivel + Forca)
    elseif ataque.nome == ataquesDisponiveis[3].nome then
        energia = ataque.custo_base + custoNivel
        send("Defesa :  ".. 44 + danoNivel + Forca + bonus )
    end
end

if energia > 0 then
    myCharacter:asyncUpdate({
        bar1Val = myCharacter.bar1Val - energia
    })
end