module PgUtils
  class Configuration
    attr_accessor :ssh_host, :ssh_user, :ssh_port, :ssh_password, :remote_backup_folder,
                  :remote_database_name, :remote_database_username, :remote_database_password,
                  :local_folder, :local_database, :local_database_username, :local_database_password

    def initialize
      self.instance_variables.each do |var|
        instance_variable_set("@#{var}", nil)
      end
      @ssh_port ||= 22
    end
  end
end
