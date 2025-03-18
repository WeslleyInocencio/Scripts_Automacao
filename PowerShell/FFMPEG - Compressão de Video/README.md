# Compressão de Vídeos em Lote com FFmpeg

Este repositório contém scripts em **PowerShell** para comprimir e converter vídeos utilizando **FFmpeg**. Os scripts permitem processar vídeos de um diretório de entrada e salvar as versões comprimidas em um diretório de saída, com suporte para **compressão por CPU e GPU (NVIDIA/AMD)**.

## Funcionalidades

- **Compressão de vídeos** em lote de um diretório especificado.
- **Conversão entre formatos** (exemplo: MKV para MP4).
- **Uso de aceleração por hardware** (NVENC para NVIDIA e AMF para AMD) para compressão mais rápida.
- **Opções configuráveis** para qualidade, taxa de bits e velocidade de processamento.

## Pré-requisitos

Antes de rodar os scripts, certifique-se de ter:

1. **PowerShell** instalado no sistema (disponível por padrão no Windows).
2. **FFmpeg** instalado e configurado corretamente. O FFmpeg é utilizado para a compressão dos vídeos. [Link para download do FFmpeg](https://ffmpeg.org/download.html).

### Configurando o FFmpeg

Certifique-se de que o caminho para o executável do FFmpeg esteja corretamente configurado no script.

Exemplo:
```powershell
$ffmpegPath = "C:\\caminho\\para\\ffmpeg\\bin\\ffmpeg.exe"
```

## Como Usar

### 1. Defina os diretórios de entrada e saída

No script, você precisa definir os caminhos dos diretórios de **entrada** e **saída**. O diretório de entrada contém os vídeos originais, e o diretório de saída é onde os vídeos comprimidos serão salvos.

```powershell
$inputFile = "C:\\Users\\Usuario\\Videos\\meuvideo.mkv"
$outputFile = "C:\\Users\\Usuario\\Videos\\meuvideo_comprimido.mp4"
```

### 2. Escolha o método de compressão

#### **Opção 1: Compressão com GPU (NVIDIA/AMD)**

```powershell
$compressionOptions = "-c:v hevc_nvenc -preset slow -rc vbr_hq -b:v 6M -c:a aac -b:a 128k"
# Para AMD, use esta linha:
#$compressionOptions = "-c:v hevc_amf -quality quality -b:v 6M -c:a aac -b:a 128k"
```

#### **Opção 2: Compressão com CPU**

```powershell
$compressionOptions = "-vcodec libx264 -crf 28 -preset fast -acodec aac -b:a 128k"
```

### 3. Execute o Script

O script irá processar o vídeo original e criar uma versão comprimida no diretório de saída.

### 4. Resultados

- O vídeo comprimido será salvo no diretório de saída.
- O valor de `-crf 28` define a qualidade da compressão (menor valor = maior qualidade, maior valor = mais compressão).
- Se estiver usando aceleração por hardware, a compressão será significativamente mais rápida.

## Contribuições

Se você deseja contribuir com este projeto, siga os seguintes passos:

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