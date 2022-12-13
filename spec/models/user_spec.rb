require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users
  context "when using fixtures" do
    let(:user) { fixture :user, :user }
    let(:admin) { fixture :user, :admin }

    it 'does not create a new user' do
      expect { user }.not_to change(described_class, :count)
    end

    it 'finds the non-admin user' do
      expect(user).not_to be_admin
    end

    it 'finds the admin user' do
      expect(admin).to be_admin
    end

    it 'fails with meaningful error when fixture undefined' do
      expect { fixture :user, :undefined }.to raise_error("undefined fixture not found for user")
    end

    it 'fails with meaningful error when wrong class name used' do
      expect { fixture :wrong_user_class, :user }.to raise_error("No class found for wrong_user_class")
    end
  end

  context 'when using factories' do
    let(:user) { create :user }
    let(:admin) { create :user, :admin }

    it 'creates a new user' do
      expect { user }.to change(described_class, :count).by(1)
    end

    it 'can create a non-admin user' do
      expect(user).not_to be_admin
    end

    it 'can create an admin user' do
      expect(admin).to be_admin
    end
  end
end
