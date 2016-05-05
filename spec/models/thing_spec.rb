require 'rails_helper'

RSpec.describe Thing, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'thingが生成される事' do
    it 'is valid' do
      thing = FactoryGirl.create(:thing)
      expect(thing).to be_valid
    end
  end

  describe 'thingに紐付くuserが生成される事' do
    it 'is valid' do
      thing = FactoryGirl.create(:thing)
      user = thing.user
      expect(user).to be_valid
    end
  end

  describe 'thingに紐付くuserが想定通りである事' do
    it 'is valid' do
      thing = FactoryGirl.create(:thing)
      user = thing.user
      expect(user.name).to eq('MyString')
    end
  end

  describe 'thingに紐付くuserが生成される事' do
    it 'is valid' do
      thing = FactoryGirl.create(:thing, :with_user)
      user = thing.user
      expect(user.name).to eq('MyString')
    end
  end

  describe 'thingに紐付くuserが生成される事' do
    it 'is valid' do
      thing = FactoryGirl.create(:test_thing, :with_test_user)
      user = thing.user
      expect(user.name).to eq('test_name')
    end
  end

  describe 'thingに紐付くuserが生成される事' do
    it 'is valid' do
      thing = FactoryGirl.create(:test_thing, :with_test_user_name_change)
      user = thing.user
      expect(user.name).to eq('user_name_change')
    end
  end

  describe 'thingに紐付くuserが生成されない事' do
    it 'is not valid' do
      # 紐付くuserなしのためbuildで確認する
      thing = FactoryGirl.build(:thing, :without_user)
      expect(thing).not_to be_valid
    end
  end

  describe 'thingに紐付くuserがない場合、エラーになる事' do
    it 'is not valid' do
      thing = FactoryGirl.create(:thing)
      thing.user = nil
      expect(thing).not_to be_valid
    end
  end

  describe 'scope:with_user thingに紐付くuserが1件存在する事' do
    it 'is valid' do
      thing = FactoryGirl.create(:test_thing, :with_test_user)
      things = Thing.with_user.where(id: thing.id)
      # thingに紐付くuserは必ず1件存在する
      expect(things.size).to eq(1)
    end
  end

  describe 'scope:with_user thingに紐付くuserが想定通りである事' do
    it 'is valid' do
      thing = FactoryGirl.create(:test_thing, :with_test_user)
      things = Thing.with_user.where(id: thing.id)
      expect(things.size).to eq(1)
      things.each do |thing|
        expect(thing.title).to eq('test_title')
      end
    end
  end

  describe 'thingからassociationによりuserが取得できる事' do
    it 'is valid' do
      create_thing = FactoryGirl.create(:test_thing, :with_test_user)
      things = Thing.where(id: create_thing.id)
      expect(things.size).to eq(1)
      things.each do |thing|
        Rails.logger.debug("### thing: #{thing.inspect}")
        user = thing.user
        Rails.logger.debug("### user: #{user.inspect}")
        expect(user).to be_valid
      end
    end
  end

  describe 'scope:with_user_eager_load thingとuserの外部結合の結果が取得できる事' do
    it 'is valid' do
      create_thing = FactoryGirl.create(:test_thing, :with_test_user)
      things = Thing.with_user_eager_load.where(id: create_thing.id)
      expect(things.size).to eq(1)
      things.each do |thing|
        Rails.logger.debug("### thing: #{thing.inspect}")
        user = thing.user
        Rails.logger.debug("### user: #{user.inspect}")
        expect(user).to be_valid
      end
    end
  end

  describe 'scope:with_user、with_user_eager_loadの組合せ thingとuserの内部結合の結果が取得できる事' do
    it 'is valid' do
      create_thing = FactoryGirl.create(:test_thing, :with_test_user)
      things = Thing.with_user.with_user_eager_load.where(id: create_thing.id)
      expect(things.size).to eq(1)
      things.each do |thing|
        Rails.logger.debug("### thing: #{thing.inspect}")
        user = thing.user
        Rails.logger.debug("### user: #{user.inspect}")
        expect(user).to be_valid
      end
    end
  end

  describe 'thingからassociationによりtagが取得できる事' do
    it 'is valid' do
      create_thing = FactoryGirl.create(:thing_with_tag, :with_tag)
      things = Thing.where(id: create_thing.id)
      expect(things.size).to eq(1)
      things.each do |thing|
        tags = thing.tags
        expect(tags.size).to eq(1)
        tags.each do |tag|
          Rails.logger.debug("### tag: #{tag.inspect}")
          expect(tag).to be_valid
        end
      end
    end
  end

  describe 'scope:with_tags thingに紐付くtagが取得できる事' do
    it 'is valid' do
      create_thing = FactoryGirl.create(:thing_with_tag, :with_tag)
      things = Thing.with_tags.where(id: create_thing.id)
      expect(things.size).to eq(1)
      things.each do |thing|
        Rails.logger.debug("### thing: #{thing.inspect}")
        thing.tags.each do |tag|
          Rails.logger.debug("### tag: #{tag.inspect}")
          expect(tag).to be_valid
        end
      end
    end
  end

  describe 'scope:with_tags_eager_load thingに紐付くtagが取得できる事' do
    it 'is valid' do
      create_thing = FactoryGirl.create(:thing_with_tag, :with_tag)
      things = Thing.with_tags_eager_load.where(id: create_thing.id)
      expect(things.size).to eq(1)
      things.each do |thing|
        Rails.logger.debug("### thing: #{thing.inspect}")
        thing.tags.each do |tag|
          Rails.logger.debug("### tag: #{tag.inspect}")
          expect(tag).to be_valid
        end
      end
    end
  end

  describe 'scope:with_tags、with_tags_eager_loadの組合せ thingとtagの内部結合の結果が取得できる事' do
    it 'is valid' do
      create_thing = FactoryGirl.create(:thing_with_tag, :with_tag)
      things = Thing.with_tags.with_tags_eager_load.where(id: create_thing.id)
      expect(things.size).to eq(1)
      things.each do |thing|
        Rails.logger.debug("### thing: #{thing.inspect}")
        thing.tags.each do |tag|
          Rails.logger.debug("### tag: #{tag.inspect}")
          expect(tag).to be_valid
        end
      end
    end
  end

  describe 'thingからassociationによりthing_tagが取得できる事' do
    it 'is valid' do
      create_thing = FactoryGirl.create(:thing_with_tag, :with_tag)
      things = Thing.where(id: create_thing.id)
      expect(things.size).to eq(1)
      things.each do |thing|
        thing_tags = create_thing.thing_tags
        expect(thing_tags.size).to eq(1)
        thing_tags.each do |thing_tag|
          Rails.logger.debug("### thing_tag: #{thing_tag.inspect}")
          expect(thing_tag).to be_valid
        end
      end
    end
  end

  describe 'scope:with_thing_tags thingに紐付くthing_tagが取得できる事' do
    it 'is valid' do
      create_thing = FactoryGirl.create(:thing_with_tag, :with_tag)
      things = Thing.with_thing_tags.where(id: create_thing.id)
      expect(things.size).to eq(1)
      things.each do |thing|
        Rails.logger.debug("### thing: #{thing.inspect}")
        thing.thing_tags.each do |thing_tag|
          Rails.logger.debug("### thing_tag: #{thing_tag.inspect}")
          expect(thing_tag).to be_valid
        end
      end
    end
  end

end
