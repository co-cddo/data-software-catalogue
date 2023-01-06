require 'rails_helper'

RSpec.describe Organisation, type: :model do
  let(:organisation) { build :organisation }

  describe '#tag' do
    it 'is valid if just letters' do
      organisation.tag = 'abc'
      expect(organisation).to be_valid
    end

    it 'is valid if letters, numbers, hyphens, and underscores' do
      organisation.tag = 'a-1_B'
      expect(organisation).to be_valid
    end

    it 'is not valid with spaces' do
      organisation.tag = 'a 1_B'
      expect(organisation).to be_invalid
    end

    it 'is not valid with leading hyphen' do
      organisation.tag = '-abc'
      expect(organisation).to be_invalid
    end

    it 'is not valid with leading underscore' do
      organisation.tag = '_abc'
      expect(organisation).to be_invalid
    end

    it 'is not valid with trailing hyphen' do
      organisation.tag = 'abc-'
      expect(organisation).to be_invalid
    end

    it 'is not valid with trailing underscore' do
      organisation.tag = 'abc_'
      expect(organisation).to be_invalid
    end
  end
end
