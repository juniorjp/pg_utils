require "spec_helper"

RSpec.describe PgUtils do
  it "has a version number" do
    expect(PgUtils::VERSION).not_to be nil
  end

  it "has a default config file path" do
    expect(PgUtils::Config::DEFAULTS).to eq({config_file: "config/pg_utils.yml"})
  end
end
