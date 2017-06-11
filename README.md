# PgUtils

Easily backup and download your remote PostgreSQL database. Restore the backup in your local database.
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pg_utils'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pg_utils

## Usage

Add your config file in config/pg_utils.yml

    ssh_host: '3.3.3.3'
    ssh_user: 'jack'
    ssh_port: '33'
    ssh_password: '33'
    remote_backup_folder: '/my/app/public/backups'
    remote_database_name: 'my_database'
    remote_database_username: 'user'
    remote_database_password: '333'
    local_folder: '/my/backup/folder'
    local_database: 'my_dev_database'
    local_database_username: 'dev'
    local_database_password: '555'

### Backup
Download your database from the remote server using:

    pg_utils backup
    
The above command generates a backup in the remote machine and saves it in the `remote_backup_folder`.

It also downloads the backup file to your local machine `local_folder`. 
    
### Restore    
You can also restore the most recent backup in your local machine using:
    
    pg_utils restore

The restore command gets the most recent backup in the `local_folder` and runs a restore command targeting the `local_database`.
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/juniorjp/pg_utils. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

