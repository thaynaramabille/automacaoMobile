#language: pt

Funcionalidade: Login
    Para que eu possa fazer compras dos itens  clássicos
    Sendo um usuário cadastrado
    Posso me autenticar pela tela de Login

    @loggin_happy
    Cenario: Usuario logado
    
        Dado que acesso a tela de Login
        Quando eu faço login com "tony@stark.com" e "pass123"
        Então posso ver a tela minha conta

    @login_happiless
    Esquema do Cenario: Tentar logar

        Dado que acesso a tela de Login
        Quando eu faço login com <email> e <senha>
        Então devo ver <mensagem> como popup

    Exemplos: 
        |email|senha|mensagem|
        |"tony@stark.com"|"123pass"|"Usuário e/ou senha inválidos."|
        |"adam.warlok#yahoo.com"|"pass123"|"Usuário e/ou senha inválidos."|
        |""|"pass123"|"Todos os campos são obrigatórios."|
        |"tony@stark.com"|""|"Todos os campos são obrigatórios."|

    @last_try
    Cenario: Login na 3a tentativa

        Dado que acesso a tela de Login
        Quando logo sem sucesso 2 vezes
        E faço login na ultima tentativa
        Então posso ver a tela minha conta


    