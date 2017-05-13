require 'spec_helper'

RSpec.describe PgUtils do
  it 'has a version number' do
    expect(PgUtils::VERSION).not_to be nil
  end

  it 'accepts config data from yml' do
    PgUtils.configure_with('config/pg_utils.yml.sample')
    configuration = PgUtils.configuration
    expect(configuration.ssh_host).to eq '3.3.3.3'
  end
end
