require 'spec_helper'
describe 'tarsnap' do

  context 'with defaults for all parameters' do
    it { should contain_class('tarsnap') }
  end
end
