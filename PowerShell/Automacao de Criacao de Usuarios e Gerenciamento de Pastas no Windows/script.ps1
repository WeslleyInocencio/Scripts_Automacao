# Importar o módulo necessário 
Import-Module Microsoft.PowerShell.LocalAccounts

# Função para solicitar entrada do usuário
function Prompt-UserInput {
    <#
    .SYNOPSIS
    Solicita entrada do usuário com uma mensagem de prompt.

    .PARAMETER message
    A mensagem de prompt exibida para o usuário.

    .RETURN
    A entrada do usuário após remoção de espaços em branco extras.
    #>
    param (
        [string]$message
    )
    do {
        $input = Read-Host -Prompt $message
        if ([string]::IsNullOrWhiteSpace($input)) {
            Write-Host "Entrada inválida. O campo não pode estar vazio."
        }
    } while ([string]::IsNullOrWhiteSpace($input))
    return $input.Trim()
}

# Função para criar um novo usuário local e adicionar aos grupos especificados
function Create-User {
    <#
    .SYNOPSIS
    Cria um novo usuário local e adiciona aos grupos especificados.

    .PARAMETER UserName
    O nome de usuário para criar.

    .PARAMETER GivenName
    O nome dado do usuário.

    .PARAMETER Surname
    O sobrenome do usuário.

    .PARAMETER Description
    A descrição do usuário.

    .PARAMETER Password
    A senha do usuário.

    .PARAMETER Groups
    Um array de grupos aos quais o usuário deve ser adicionado.
    #>
    param (
        [string]$UserName,
        [string]$GivenName,
        [string]$Surname,
        [string]$Description,
        [string]$Password,
        [string[]]$Groups
    )
    $SecurePassword = $Password | ConvertTo-SecureString -AsPlainText -Force
    $ExistingUser = Get-LocalUser -Name $UserName -ErrorAction SilentlyContinue
    if ($ExistingUser -eq $null) {
        $LocalUserParameters = @{
            Name                  = $UserName
            FullName              = "$GivenName $Surname"
            Description           = $Description
            Password              = $SecurePassword
            PasswordNeverExpires  = $true
            AccountNeverExpires   = $true
        }
        try {
            $NewLocalUser = New-LocalUser @LocalUserParameters -ErrorAction Stop
            Write-Host "Usuário local $($NewLocalUser.Name) criado com sucesso."
            foreach ($Group in $Groups) {
                if (-not (Test-LocalGroupMember -Group $Group -Member $UserName)) {
                    Add-LocalGroupMember -Group $Group -Member $UserName
                    Write-Host "Usuário $UserName adicionado ao grupo $Group."
                } else {
                    Write-Host "Usuário $UserName já existe no grupo $Group."
                }
            }
        } catch {
            Write-Host "Falha ao criar usuário local $($UserName). Erro: $($_.Exception.Message)"
        }
    } else {
        Write-Host "Usuário $UserName já existe. Pulando a criação."
    }
}

# Função para criar pastas de usuário com base na unidade e setor especificados
function Create-Folders {
    <#
    .SYNOPSIS
    Cria pastas de usuário com base na unidade e setor especificados.

    .PARAMETER Unit
    A unidade do usuário.

    .PARAMETER Sector
    O setor do usuário.

    .PARAMETER UserName
    O nome de usuário para criar a pasta.
    #>
    param (
        [string]$Unit,
        [string]$Sector,
        [string]$UserName
    )
    $basePath = @{
        "001.SP+COMERCIAL" = "E:\001.PublicoSp\3.COMERCIAL"
        "002.RS+COMERCIAL" = "E:\002.PublicoRs\3.COMERCIAL"
        "003.MS+COMERCIAL" = "E:\003.PublicoMs\3.COMERCIAL"
    }

    $key = "$Unit+$Sector"
    if ($basePath.ContainsKey($key)) {
        $path = $basePath[$key]
        $userFolderPath = Join-Path -Path $path -ChildPath $UserName.ToUpper()
        if (-not (Test-Path -Path $userFolderPath)) {
            New-Item -Path $userFolderPath -ItemType Directory -Force
            Write-Host "Pasta do usuário $userFolderPath criada com sucesso."
        } else {
            Write-Host "A pasta do usuário $userFolderPath já existe."
        }
    } else {
        Write-Host "Combinação de Unidade e Setor não encontrada."
    }
}

# Função principal para execução do script
function Main {
    # Obter informações do usuário
    $UserName = Prompt-UserInput "Digite o UserName"
    $GivenName = Prompt-UserInput "Digite o GivenName"
    $Surname = Prompt-UserInput "Digite o Surname"
    $Description = Prompt-UserInput "Digite a Description"
    $Password = Prompt-UserInput "Digite o Password"

    # Listar grupos disponíveis
    Write-Host "Lista de Grupos disponíveis:"
    $groups = @{
        "001" = "001.Sup.Logist"
        "002" = "001.GestorComerc"
        "003" = "001.Adm"
    }
    $groups.GetEnumerator() | ForEach-Object {
        Write-Host "$($_.Key). $($_.Value)"
    }
    $selectedGroups = @()
    do {
        $input = Read-Host -Prompt "Digite os números correspondentes aos grupos separados por vírgula"
        $groupIndices = $input -split ',' | ForEach-Object { $_.Trim() }
        foreach ($index in $groupIndices) {
            if ($groups.ContainsKey($index)) {
                $selectedGroups += $groups[$index]
            } else {
                Write-Host "Grupo '$index' inválido. Por favor, digite um número válido."
            }
        }
    } while ($selectedGroups.Count -eq 0)

    # Listar unidades disponíveis
    Write-Host "Lista de Unidades disponíveis:"
    $availableUnits = @{
        "1" = "001.SP"
        "2" = "002.RS"
        "3" = "003.MS"
    }
    $availableUnits.GetEnumerator() | ForEach-Object {
        Write-Host "$($_.Key). $($_.Value)"
    }
    $unit = Prompt-UserInput "Digite o número correspondente à Unidade"

    # Listar setores disponíveis
    Write-Host "Lista de Setores:"
    $availableSectors = @{
        "1" = "ADMINISTRATIVO"
        "2" = "COMERCIAL"
        "3" = "LOGÍSTICA"
    }
    $availableSectors.GetEnumerator() | ForEach-Object {
        Write-Host "$($_.Key). $($_.Value)"
    }
    $sector = Prompt-UserInput "Digite o número correspondente ao Setor"

    # Criar usuário
    Create-User -UserName $UserName -GivenName $GivenName -Surname $Surname -Description $Description -Password $Password -Groups $selectedGroups

    # Criar pastas
    Create-Folders -Unit $unit -Sector $sector -UserName $UserName
}

# Chamada da função principal
Main