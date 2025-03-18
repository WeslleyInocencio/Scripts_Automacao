# Obtém todos os usuários locais
$usuarios = Get-LocalUser

# Array para armazenar informações dos usuários
$dadosUsuarios = @()

# Obtém a data atual
$dataAtual = Get-Date

# Itera sobre cada usuário para obter informações e adicioná-las ao array
foreach ($usuario in $usuarios) {
    # Obtém o status da conta (Desabilitada, Ativa ou Nunca Logada)
    if ($usuario.LastLogon -eq $null) {
        $statusConta = "Nunca Logou"
        $diasSemLogar = "N/A"
    } elseif ($usuario.Enabled) {
        $statusConta = "Ativa"
        # Calcula os dias desde o último acesso
        $diasSemLogar = ($dataAtual - $usuario.LastLogon).Days
    } else {
        $statusConta = "Desabilitada"
        $diasSemLogar = "N/A"
    }

    # Cria um objeto personalizado com as informações do usuário
    $dadosUsuario = [PSCustomObject]@{
        Nome = $usuario.Name
        StatusConta = $statusConta
        UltimoAcesso = $usuario.LastLogon
        DiasSemLogar = $diasSemLogar
    }

    # Adiciona o objeto ao array
    $dadosUsuarios += $dadosUsuario
}

# Exporta os dados para um arquivo CSV
$dadosUsuarios | Export-Csv -Path ".\Desktop\ListagemDeUsuarioAtivoDesativo.csv" -NoTypeInformation