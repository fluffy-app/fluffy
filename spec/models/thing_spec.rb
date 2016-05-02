require 'rails_helper'

RSpec.describe Thing, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'FactoryGirlを使用してthingが生成される事の確認' do
    it 'is valid' do
      thing = FactoryGirl.create(:thing)
      expect(thing).to be_valid
    end
  end

  describe 'FactoryGirlを使用してthing経由でuserが生成される事の確認_1' do
    it 'is valid' do
      thing = FactoryGirl.create(:thing)
      user = thing.user
      expect(user).to be_valid
    end
  end

  describe 'FactoryGirlを使用してthing経由でuserが生成される事の確認_2 user.name確認' do
    it 'is valid' do
      thing = FactoryGirl.create(:thing)
      user = thing.user
      expect(user.name).to eq('MyString')
    end
  end

  describe 'FactoryGirlを使用してthing経由でuserが生成される事の確認_3 trait使用_1' do
    it 'is valid' do
      thing = FactoryGirl.create(:thing, :with_user)
      user = thing.user
      expect(user.name).to eq('MyString')
    end
  end

  describe 'FactoryGirlを使用してthing経由でuserが生成される事の確認_4 trait使用_2' do
    it 'is valid' do
      thing = FactoryGirl.create(:test_thing, :with_test_user)
      user = thing.user
      expect(user.name).to eq('test_name')
    end
  end

  describe 'FactoryGirlを使用してthing経由でuserが生成される事の確認_5 trait使用_3' do
    it 'is valid' do
      thing = FactoryGirl.create(:test_thing, :with_test_user_name_change)
      user = thing.user
      expect(user.name).to eq('user_name_change')
    end
  end

  describe 'FactoryGirlを使用してthingが生成される事の確認 紐付くuserなし' do
    it 'is not valid' do
      # 紐付くuserなしのためbuildで確認する
      thing = FactoryGirl.build(:thing, :without_user)
      expect(thing).not_to be_valid
    end
  end

  describe 'Userが紐付かない場合、エラーになる事の確認' do
    it 'is not valid' do
      thing = FactoryGirl.create(:thing)
      thing.user = nil
      expect(thing).not_to be_valid
    end
  end

  describe 'scope:with_userの確認 Userが紐付くThingが1件存在する事' do
    it 'is valid' do
      thing = FactoryGirl.create(:test_thing, :with_test_user)
      things = Thing.with_user.where(id: thing.id)
      # thingに紐付くuserは必ず1件存在する
      expect(things.size).to eq(1)
    end
  end

  describe 'scope:with_userの確認 Userが紐付くThingが想定通りである事' do
    it 'is valid' do
      thing = FactoryGirl.create(:test_thing, :with_test_user)
      things = Thing.with_user.where(id: thing.id)
      # thingに紐付くuserは必ず1件存在する
      expect(things.size).to eq(1)
      things.each do |thing|
        expect(thing.title).to eq('test_title')
      end
    end
  end

end
