# Edite este arquivo para introduzir tarefas a serem executadas pelo cron.
#
# Cada tarefa a ser executada deve ser definida por uma única linha
# indicando com diferentes campos quando a tarefa será executada
# e qual comando executar para a tarefa.
#
# Para definir o tempo, você pode fornecer valores concretos para
# minuto (m), hora (h), dia do mês (dom), mês (mon),
# e dia da semana (dow) ou usar '*' nesses campos (para 'qualquer um').#
# Observe que as tarefas serão iniciadas com base na noção de tempo e
# fusos horários do daemon do sistema cron.
#
# A saída das tarefas do crontab (incluindo erros) é enviada por
# e-mail para o usuário proprietário do arquivo crontab (a menos que redirecionado).
#
# Por exemplo, você pode executar um backup de todas as contas de usuário
# às 5 da manhã, toda semana, com:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# Para mais informações, consulte as páginas de manual do crontab(5) e cron(8)
#
# m h  dom mon dow   comando

#-----------------------------------------------------------------------------------#

# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command


## Agendamentos de inicialização e desligamento de VMs Azure
## NOMEDAVM 
10 21 * * 1-5 /home/users/scripts/administravm.sh NOMEDAVM stop
40 06 * * 1-5 /home/users/scripts/administravm.sh NOMEDAVM start
