# Compressão de Imagens em Lote

Este repositório contém um script em PowerShell que permite comprimir várias imagens no formato PNG em um diretório de entrada e salvar as versões comprimidas em um diretório de saída. O script utiliza o **FFmpeg** para realizar a compressão, ajustando a qualidade das imagens com base em um valor entre 2 e 31 (onde 2 é a melhor qualidade e 31 é a pior).

## Funcionalidade

- **Comprime imagens PNG** de um diretório especificado.
- **Salva as imagens comprimidas** em um diretório de saída.
- Utiliza o **FFmpeg** para comprimir as imagens, mantendo um controle de qualidade ajustável.

## Pré-requisitos

Antes de rodar o script, é necessário ter:

1. **PowerShell** instalado em sua máquina (geralmente vem pré-instalado em sistemas Windows).
2. **FFmpeg** instalado e configurado corretamente no seu sistema. O FFmpeg é utilizado para realizar a compressão das imagens. [Link para download do FFmpeg](https://ffmpeg.org/download.html).

### Configurando o FFmpeg

Certifique-se de que o caminho para o executável do FFmpeg esteja corretamente configurado no script.

Exemplo:
```powershell
& "C:\caminho\para\ffmpeg\bin\ffmpeg.exe"
```

## Como Usar

### 1. Defina os diretórios de entrada e saída

No script, você precisa definir os caminhos dos diretórios de **entrada** e **saída**. O diretório de entrada contém as imagens PNG que você deseja comprimir, e o diretório de saída é onde as imagens comprimidas serão salvas.

```powershell
$dirIn = "C:\caminho\para\imagens\entrada"
$dirOut = "C:\caminho\para\imagens\saida"
```

### 2. Execute o Script

O script irá percorrer o diretório de entrada, encontrar todas as imagens PNG e usar o FFmpeg para criar versões comprimidas das imagens. As imagens comprimidas serão salvas no diretório de saída especificado.

### 3. Resultados

- As imagens comprimidas serão salvas no diretório de saída.
- O valor de `-q:v 5` define a qualidade da compressão (onde 2 é a melhor e 31 é a pior). Você pode ajustar esse valor conforme necessário para equilibrar qualidade e tamanho do arquivo.

## Contribuições

Se você deseja contribuir com este projeto, por favor, siga os seguintes passos:

1. Faça um **fork** deste repositório.
2. Crie uma nova branch para suas alterações (`git checkout -b minha-alteracao`).
3. Faça as modificações necessárias.
4. Envie um **pull request** com uma descrição detalhada das mudanças.

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
