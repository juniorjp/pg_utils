require 'spec_helper'

RSpec.describe ::PgUtils::Restore do

  it 'loads and parse config data' do
    sample_database = 'local_database'
    PgUtils.configure do |config|
      config.local_database = sample_database
    end
    restore = PgUtils::Restore.new()
    expect(PgUtils.configuration.local_database).to eq sample_database
    expect(restore.local_database).to eq sample_database
  end

end
