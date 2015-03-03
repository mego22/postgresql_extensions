require 'spec_helper'
describe 'postgresql_extensions' do

  context 'with defaults for all parameters' do
    it { should contain_class('postgresql_extensions') }
  end
end
