# Automação de Criacao de Usuarios e Gerenciamento de Pastas no Windows

## Descricao
Este script PowerShell automatiza a criacao de usuarios locais no Windows, atribui grupos especificos e gerencia a criacao de pastas com base na unidade e setor do usuario. Ele interage com o usuario para coletar informacoes necessarias e executa as acoes de forma segura e eficiente.

## Requisitos
- Windows 10/11 ou Windows Server com suporte a `New-LocalUser`
- Execucao do PowerShell com permissao de Administrador
- Modulo `Microsoft.PowerShell.LocalAccounts`

## Funcionalidades
- Criacao de usuarios locais via entrada interativa
- Adicao de usuarios a grupos especificos
- Criacao automatica de pastas baseadas na unidade e setor

## Como Usar
1. Execute o PowerShell como Administrador.
2. Navegue ate o diretorio do script.
3. Execute o comando:
   ```powershell
   .\script.ps1
   ```
4. Preencha os dados solicitados:
   - UserName
   - GivenName
   - Surname
   - Description
   - Password
   - Selecao de grupos
   - Selecao de unidade
   - Selecao de setor
5. O script criara o usuario, adicionara aos grupos e criara a pasta correspondente.

## Estrutura de Pastas
Dependendo da unidade e setor selecionados, as pastas serao criadas conforme a seguinte estrutura:

| Unidade + Setor | Caminho da Pasta |
| -------------- | ---------------- |
| 001.SP + COMERCIAL | E:\001.PublicoSp\3.COMERCIAL\ |
| 002.RS + COMERCIAL | E:\002.PublicoRs\3.COMERCIAL\ |
| 003.MS + COMERCIAL | E:\003.PublicoMs\3.COMERCIAL\ |

## Exemplo de Execucao
```plaintext
Digite o UserName: jdoe
Digite o GivenName: John
Digite o Surname: Doe
Digite a Description: Funcionario de vendas
Digite o Password: ********
Selecione os grupos: 1,3
Digite a Unidade: 001.SP
Esta correto a unidade informada "001.SP" (Y/N): Y
Selecione o Setor: 2
Usuário jdoe criado com sucesso.
Usuário jdoe adicionado ao grupo 001.GestorComerc.SP.
Pasta "E:\001.PublicoSp\3.COMERCIAL\JDOE" criada com sucesso.
```

## Notas
- O script verifica se o usuario ja existe antes de criar.
- Se um grupo nao existir, ele sera ignorado.
- O nome da pasta sera criado em letras maiusculas.

## Melhorias Futuras
- Adicionar logs para auditoria
- Melhorar validacoes de entrada
- Integracao com Active Directory

## 👨‍💻 Contato

Se você tiver alguma dúvida ou sugestão, pode me encontrar nas seguintes redes sociais:

<div id="badges">
  <a href = "https://linkedin.com/in/weslley-inoc%C3%AAncio-cnse-csae-cpte-ceh-trained-830601128">
    <img src="https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Badge"/>
  </a>

  <a href = "mailto:weslley.inocencio@proton.me">
    <img src="https://img.shields.io/badge/Twitter-blue?style=for-the-badge&logo=twitter&logoColor=white" alt="Twitter Badge"/>
  </a>
</div>

---

Obrigado por utilizar e contribuir para este repositório! 🙌

