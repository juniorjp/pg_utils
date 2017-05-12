require 'spec_helper'

RSpec.describe ::PgUtils::Backup do
  it 'loads and parse config data' do
    PgUtils.configure do |config|
      config.ssh_host = '1.1.1.1'
      config.ssh_user = 'chuck'
      config.ssh_port = '23'
    end
    backup = PgUtils::Backup.new()
    expect(PgUtils.configuration.ssh_host).to eq '1.1.1.1'
    expect(backup.ssh_host).to eq '1.1.1.1'
  end


end
