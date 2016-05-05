require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'userが生成される事' do
    it 'is valid' do
      create_user = FactoryGirl.create(:user)
      expect(create_user).to be_valid
    end
  end

  describe 'userに紐付くthingが生成されない事' do
    it 'is valid' do
      create_user = FactoryGirl.create(:user)
      things = create_user.things
      expect(things.size).to eq(0)
    end
  end

  describe 'userに紐付くthingがデフォルト件数だけ生成される事' do
    it 'is valid' do
      create_user = FactoryGirl.create(:user, :with_thing)
      things = create_user.things
      expect(things.size).to eq(5)
    end
  end

  describe 'userに紐付くthingが想定通りである事' do
    it 'is valid' do
      create_user = FactoryGirl.create(:user, :with_thing)
      things = create_user.things
      expect(things.size).to eq(5)
      things.each do |thing|
        expect(thing.title).to eq('MyString')
      end
    end
  end

  describe 'userに紐付くthingが引数の件数だけ生成される事' do
    it 'is valid' do
      create_user = FactoryGirl.create(:user, :with_thing, things_count: 3)
      things = create_user.things
      expect(things.size).to eq(3)
    end
  end

  describe 'scope:with_thingsの確認 条件に一致するuserが取得できる事' do
    it 'is valid' do
      create_user = FactoryGirl.create(:user, :with_thing, things_count: 3)
      user_things = User.with_things.where(id: create_user.id)
      expect(user_things.size).to eq(3)
    end
  end

  describe 'scope:with_thingsの確認 条件に一致するuserが取得できる事' do
    it 'is valid' do
      create_user = FactoryGirl.create(:user, :with_thing, things_count: 3)
      user_things = User.with_things.where(id: create_user.id)
      user_things.each do |user|
        expect(user.name).to eq('MyString')
      end
    end
  end

  describe 'userからassociationによりthingが取得できる事' do
    it 'is valid' do
      create_user = FactoryGirl.create(:user, :with_thing, things_count: 3)
      users = User.where(id: create_user.id)
      users.each do |user|
        Rails.logger.debug("### user: #{user.inspect}")
        user.things.each do |thing|
          Rails.logger.debug("### thing: #{thing.inspect}")
          expect(thing).to be_valid
        end
      end
    end
  end

  describe 'scope:with_things_eager_loadの確認 userとthingの外部結合の結果が取得できる事' do
    it 'is valid' do
      create_user = FactoryGirl.create(:user, :with_thing, things_count: 3)
      users = User.with_things_eager_load.where(id: create_user.id)
      expect(users.size).to eq(1)
      users.each do |user|
        Rails.logger.debug("### user: #{user.inspect}")
        user.things.each do |thing|
          Rails.logger.debug("### thing: #{thing.inspect}")
          expect(thing).to be_valid
        end
      end
    end
  end

  describe 'scope:with_thingsとwith_things_eager_loadの組合せ userとthingの内部結合の結果が取得できる事' do
    it 'is valid' do
      create_user = FactoryGirl.create(:user, :with_thing, things_count: 3)
      users = User.with_things.with_things_eager_load.where(id: create_user.id)
      expect(users.size).to eq(3)
      users.each do |user|
        Rails.logger.debug("### user: #{user.inspect}")
        user.things.each do |thing|
          Rails.logger.debug("### thing: #{thing.inspect}")
          expect(thing).to be_valid
        end
      end
    end
  end

end
