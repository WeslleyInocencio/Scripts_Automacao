#!/bin/bash
# Script escrito por WeslleyInocencio
# Inicia e finaliza VM conforme parâmetros
# ./administravm.sh NOMEDAVM stop (finaliza VM)
# ./administravm.sh NOMEDAVM start (inicia VM)

# Variáveis
resourcegroup="NAMEGROUP"

param1="$1"
param2="$2"
nomevm="$param1"
tarefa="$param2"

# Local para os Logs
log="/var/log/automacao/$nomevm.log"
data=$(date +%d/%m/%Y_%H:%M)

# Função para registrar logs
log_message() {
    echo "$(date +%d/%m/%Y_%H:%M) - $1" | tee -a $log
}

# Verifica se os parâmetros estão corretos
if [ -z "$param1" ] || [ -z "$param2" ]; then
    log_message "Erro: Parâmetros insuficientes."
    echo "Uso correto: ./administravm.sh NOMEDAVM TAREFA"
    echo "TAREFA = stop | start | status"
    exit 1
fi

# Criação dos cabeçalhos nos logs para registrar o início do script e a data e hora da execução
log_message "Início do script automacao.sh"
log_message "Data de execução: $data"

# Utilização de um case statement para executar a tarefa com base no segundo parâmetro fornecido
case $param2 in
    stop)
        log_message "Finalizando a VM: $nomevm"
        if /usr/bin/az vm deallocate --name "$nomevm" --resource-group "$resourcegroup" -o tsv --verbose >> $log 2>&1; then
            log_message "VM $nomevm finalizada com sucesso."
        else
            log_message "Erro ao finalizar a VM $nomevm."
            exit 1
        fi
        ;;
    start)
        log_message "Iniciando a VM: $nomevm"
        if /usr/bin/az vm start --name "$nomevm" --resource-group "$resourcegroup" -o tsv --verbose >> $log 2>&1; then
            log_message "VM $nomevm iniciada com sucesso."
        else
            log_message "Erro ao iniciar a VM $nomevm."
            exit 1
        fi
        ;;
    status)
        log_message "Exibindo status da VM: $nomevm"
        /usr/bin/az vm get-instance-view --name "$nomevm" --resource-group "$resourcegroup" \
            --query "instanceView.statuses[?starts_with(code, 'PowerState/')].displayStatus" -o tsv --verbose >> $log 2>&1
        ;;
    *)
        # Caso a tarefa não seja reconhecida, imprime uma mensagem de erro e mostra como utilizar o script
        log_message "Erro: Tarefa desconhecida $param2"
        echo "TAREFA inválida! Use stop | start | status."
        exit 1
        ;;
esac

# Criação dos rodapés nos logs para registrar o fim do script e a data e hora da execução
log_message "Fim do script automacao.sh"
log_message "Data de conclusão: $(date +%d/%m/%Y_%H:%M)"
