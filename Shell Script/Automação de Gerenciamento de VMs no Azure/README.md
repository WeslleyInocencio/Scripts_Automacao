# Automação de Gerenciamento de VMs no Azure

Este repositório contém um script de automação escrito em Bash que facilita o gerenciamento de máquinas virtuais (VMs) no Azure. O script permite iniciar, parar e verificar o status das VMs com base nos parâmetros fornecidos. Além disso, ele gera logs detalhados para cada ação realizada.

## Descrição

O **`administravm.sh`** é um script de automação que interage com a CLI do Azure (`az`) para executar operações em máquinas virtuais (VMs). Ele oferece três principais funcionalidades:

- **start**: Inicia a máquina virtual.
- **stop**: Desliga a máquina virtual.
- **status**: Exibe o status atual da máquina virtual.

### Requisitos

Para usar este script, você precisará de:

- **CLI do Azure (`az`)** instalada e configurada corretamente.
- Acesso ao Azure com permissões adequadas para gerenciar as VMs.
- Um sistema Linux para rodar o script (por exemplo, Ubuntu ou CentOS).

## Como usar

### Execução do Script

O script `administravm.sh` aceita dois parâmetros:

1. **NOMEDAVM**: O nome da máquina virtual a ser gerenciada.
2. **TAREFA**: A tarefa a ser realizada na VM. As opções são:
   - `start` para iniciar a VM.
   - `stop` para parar a VM.
   - `status` para verificar o status da VM.

**Exemplo de execução:**

```bash
./administravm.sh NOMEDAVM start  # Para iniciar a VM
./administravm.sh NOMEDAVM stop   # Para parar a VM
./administravm.sh NOMEDAVM status # Para verificar o status da VM
```

### Logs

O script gera logs detalhados em tempo real, registrando as ações executadas, como o início e o fim do script, além de capturar as saídas dos comandos executados. O arquivo de log é armazenado em:

```bash
/var/log/automacao/NOMEDAVM.log
```

### Estrutura do Script

1. **Cabeçalhos de Log**: O script começa registrando informações sobre o início da execução, incluindo a data e hora.
2. **Caso (`case`)**: Com base no segundo parâmetro fornecido, o script executa a tarefa correspondente.
   - **stop**: Usa o comando `az vm deallocate` para parar a VM.
   - **start**: Usa o comando `az vm start` para iniciar a VM.
   - **status**: Usa o comando `az vm get-instance-view` para obter e exibir o status da VM.
3. **Rodapé de Log**: Ao final da execução, o script registra a data e hora de término da execução.

### Exemplo de Uso Completo

#### Parar uma VM

```bash
./administravm.sh MinhaVM stop
```

#### Iniciar uma VM

```bash
./administravm.sh MinhaVM start
```

#### Verificar o Status de uma VM

```bash
./administravm.sh MinhaVM status
```

## Crontab (Agendamento de Tarefas)

Para automatizar a execução do script em horários específicos, você pode agendar tarefas usando o **cron**. A seguir estão exemplos de agendamentos configurados no arquivo crontab para iniciar e parar várias VMs:

### Exemplo de Agendamentos

```bash
## Agendamentos de inicalização e desligamento de VMs Azure
## VM PfProxy - Servidor Proxy
10 21 * * 1-5 /home/tecnoapp/scripts/administravm.sh PfProxy stop
40 06 * * 1-5 /home/tecnoapp/scripts/administravm.sh PfProxy start

## VM Cigam
30 07 * * 1-5 /home/tecnoapp/scripts/administravm.sh SrvCigam start

## VM VMTS-BO
45 18 * * 1-5 /home/tecnoapp/scripts/administravm.sh VMTS-BO stop
30 07 * * 1-5 /home/tecnoapp/scripts/administravm.sh VMTS-BO start

## VM VMTS-mirador
30 18 * * 1-5 /home/tecnoapp/scripts/administravm.sh VMTS-Mirador stop
43 07 * * 1-5 /home/tecnoapp/scripts/administravm.sh VMTS-Mirador start

## Outros Agendamentos de VMs...
```

Cada linha define quando o script será executado (hora e dia) e qual VM será gerenciada. 

## Como Contribuir

Se você deseja contribuir com melhorias ou correções para o script, siga estas etapas:

1. Faça um **fork** deste repositório.
2. Crie uma nova **branch** para suas modificações.
3. **Commit** suas alterações.
4. Envie um **pull request** com a descrição das mudanças feitas.

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