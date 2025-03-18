# Define os diretórios de entrada e saída
$dirIn = "C:\caminho\para\imagens\entrada"
$dirOut = "C:\caminho\para\imagens\saida"

# Verifica se o diretório de saída existe. Caso contrário, cria o diretório
if (!(Test-Path -Path $dirOut)) {
    New-Item -ItemType Directory -Force -Path $dirOut
}

# Loop através das imagens no diretório de entrada
Get-ChildItem -Path $dirIn -Filter *.png | ForEach-Object {
    # Define os nomes dos arquivos de entrada e saída
    $fileIn = $_.FullName
    $fileOut = Join-Path -Path $dirOut -ChildPath $_.Name

    # Verifica se o arquivo de entrada existe
    if (Test-Path $fileIn) {
        # Executa o comando ffmpeg para converter a imagem de entrada para uma nova imagem comprimida com qualidade ajustada (de 2 a 31, onde 2 é a melhor qualidade)
        & "C:\caminho\para\ffmpeg\bin\ffmpeg.exe" -hide_banner -i $fileIn -q:v 5 $fileOut
    } else {
        Write-Warning "Arquivo de entrada não encontrado: $fileIn"
    }
}
