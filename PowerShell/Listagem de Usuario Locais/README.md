# Listagem de Usuários Locais - PowerShell

## Descrição
Este script em PowerShell obtém informações sobre os usuários locais de um sistema Windows e gera um relatório no formato CSV contendo:
- Nome do usuário
- Status da conta (Ativa, Desabilitada ou Nunca Logou)
- Data e hora do último acesso
- Quantidade de dias sem login (quando aplicável)

O arquivo gerado será salvo na área de trabalho do usuário atual.

## Requisitos
- Sistema operacional Windows
- Permissões administrativas para execução do PowerShell
- PowerShell 5.1 ou superior

## Uso
1. Abra o PowerShell como Administrador.
2. Copie e cole o código do script no terminal ou salve-o como um arquivo `.ps1`.
3. Execute o script.

```powershell
./script.ps1
```

4. Ao final da execução, o arquivo CSV será salvo na área de trabalho do usuário atual com o nome `ListagemDeUsuarioAtivoDesativo.csv`.

## Exemplo de Saída do CSV
```csv
"Nome","StatusConta","UltimoAcesso","DiasSemLogar"
"Admin","Ativa","2024-03-12 14:35:00","5"
"User1","Desabilitada","2024-02-20 08:15:00","N/A"
"User2","Nunca Logou","N/A","N/A"
```

## Tratamento de Erros
Caso ocorra um erro durante a execução, uma mensagem será exibida no terminal informando a falha.

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
