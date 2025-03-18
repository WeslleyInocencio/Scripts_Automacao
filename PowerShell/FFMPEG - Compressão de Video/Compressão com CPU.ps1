# Caminho para o executável do FFmpeg (substitua pelo caminho correto)
$ffmpegPath = 'D:\caminho\para\ffmpeg\bin\ffmpeg.exe'

# Caminho completo para o vídeo original
$inputFile = 'C:\caminho\para\video.mp4'

# Diretório de saída para salvar o vídeo comprimido
$outputDirectory = 'C:\caminho\para\salvar'

# Nome do arquivo de saída
$outputFile = 'video_compress.mp4'

# Criar diretório de saída, se não existir
if (-Not (Test-Path -Path $outputDirectory)) {
    New-Item -ItemType Directory -Force -Path $outputDirectory
}

# Caminho completo para o arquivo de saída
$outputFile = Join-Path $outputDirectory $outputFile

# Opções de compressão (NVIDIA NVENC H.265)
$compressionOptions = "-c:v hevc_nvenc -preset slow -rc vbr_hq -b:v 6M -c:a aac -b:a 128k"

# Para AMD, use esta linha e comente a anterior:
#$compressionOptions = "-c:v hevc_amf -quality quality -b:v 6M -c:a aac -b:a 128k"

# Executar FFmpeg
$ffmpegArgs = "-i `"$inputFile`" $compressionOptions `"$outputFile`""
Start-Process -FilePath $ffmpegPath -ArgumentList $ffmpegArgs -NoNewWindow -Wait

Write-Host "Compressão concluída!"