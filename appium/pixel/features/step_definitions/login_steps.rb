Dado("que acesso a tela de Login") do
  find_element(id: "qaninja.com.pixel:id/accountButt").click
end

Quando("eu faço login com {string} e {string}") do |email, senha|
  find_element(id: "qaninja.com.pixel:id/usernameTxt").send_keys(email)
  find_element(id: "qaninja.com.pixel:id/passwordTxt").send_keys(senha)
  find_element(id: "qaninja.com.pixel:id/loginButt").click
end

Então("posso ver a tela minha conta") do
  find_element(id: "qaninja.com.pixel:id/accountButt").click
  conta = find_element(id: "qaninja.com.pixel:id/account")
  expect(conta.displayed?).to be true
end

Então("devo ver {string} como popup") do |mensagem_esperada|
  popup = find_element(id: "android:id/message")
  expect(popup.text).to eql mensagem_esperada
end

Quando("logo sem sucesso {int} vezes") do |tentativas|
  tentativas.times do 
    steps %(
      Quando eu faço login com "tony@stark.com" e "123pass"
    )
    popup = find_element(id: "android:id/message")
    expect(popup.displayed?).to be true
    back #sai do popup sem sair da sessao (retorna uma tela anterior)
  end
end

Quando("faço login na ultima tentativa") do
   steps %(
      Quando eu faço login com "tony@stark.com" e "pass123"
    )

end