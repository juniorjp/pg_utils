require 'net/ssh'
require 'net/scp'

module PgUtils
  class Backup
    attr_accessor :ssh_host, :ssh_user, :ssh_password, :ssh_port,
                  :remote_backup_folder, :remote_database_name, :remote_database_username, :remote_database_password,
                  :local_folder, :local_database, :local_database_username, :filename

    def initialize()
      PgUtils.configuration.instance_variables.each do |k|
        instance_variable_set(k, PgUtils.configuration.instance_variable_get(k))
      end
    end

    def run()
      system("mkdir -p #{local_folder}")
      datestamp = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
      @filename = "#{remote_database_name}_#{datestamp}_dump.sql.gz"
      backup_file = "#{remote_backup_folder}/#{filename}"

      Net::SSH.start(ssh_host, ssh_user, :password => remote_database_password, :port => ssh_port) do |ssh|
        puts "connected to #{ssh_host}"
        ssh.exec!("mkdir -p #{remote_backup_folder}")
        exec_cmd =  "PGPASSWORD=\"#{remote_database_password}\" pg_dump -Fc -h localhost -U #{remote_database_username} #{remote_database_name} > #{backup_file}"
        ssh.exec!(exec_cmd)
        ssh.scp.download!(backup_file, local_folder)
      end
      puts "Backup finished successfully!"
    end
  end
end
