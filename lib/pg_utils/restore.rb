require 'net/ssh'
require 'net/scp'

module PgUtils
  class Restore
    attr_accessor :local_folder, :local_database, :local_database_username, :local_database_password, :filename

    def initialize()
      PgUtils.configuration.instance_variables.each do |k|
        instance_variable_set(k, PgUtils.configuration.instance_variable_get(k))
      end
    end

    def run()
      if filename && filename.include?(".sql.gz")
        backup_file = "#{local_folder}/#{filename}"
      elsif !filename.blank?
        backup_file = "#{local_folder}/#{filename}.sql.gz"
      else
        backup_file = Dir.glob("#{local_folder}/*").max_by {|f| File.mtime(f)}
      end
      puts "restoring backup: #{backup_file}"
      exec_cmd =  "PGPASSWORD=\"#{local_database_password}\" pg_restore -c -h localhost -U #{local_database_username} -Fc -d #{local_database} #{backup_file} --verbose"
      sh exec_cmd
    end
  end
end
