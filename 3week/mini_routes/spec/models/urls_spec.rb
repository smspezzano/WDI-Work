require 'spec_helper'

describe Url do
  describe :show do
    before do
      # create 3 people, only one of which has the yahoo.com domain name
      @google = Url.create({ link: 'https://www.google.com/', random_string: SecureRandom.urlsafe_base64, count: '0' })
      @twitter = Url.create({ link: 'https://twitter.com/', random_string: SecureRandom.urlsafe_base64, count: '0' })
      @facebook = Url.create({ link: 'https://www.facebook.com/', random_string: SecureRandom.urlsafe_base64, count: '0' })
    end

    context 'given a random_string it should show the full link' do
      it 'should return an active record relation' do
        Url.show(SecureRandom.urlsafe_base64).should be_an ActiveRecord::Relation
      end
      
      it 'should return the matching link' do
        Url.show(SecureRandom.urlsafe_base64).should == [@google.link, @twitter.link, @facebook.link]
      end
    end
  end
  describe :create do
    before do
      # create 3 people, only one of which has the yahoo.com domain name
      @google = Url.create({ link: 'https://www.google.com/', random_string: SecureRandom.urlsafe_base64, count: '0' })
      @twitter = Url.create({ link: 'https://twitter.com/', random_string: SecureRandom.urlsafe_base64, count: '0' })
      @facebook = Url.create({ link: 'https://www.facebook.com/', random_string: SecureRandom.urlsafe_base64, count: '0' })
    end

    context 'given a link it should create a random_string' do
      it 'should take a check link for correct attributes' do
        Url.create(@google.link).should == 'https://www.google.com/'
      end

      it 'should create a random_string' do
        Url.create(@google.random_string).should == SecureRandom.urlsafe_base64
      end
    end
  end
  # describe :update_count do
  #   before do
  #     # create 3 people, only one of which has the yahoo.com domain name
  #     @google = Url.create({ link: 'https://www.google.com/', random_string: SecureRandom.urlsafe_base64, count: '1' })
  #     @twitter = Url.create({ link: 'https://twitter.com/', random_string: SecureRandom.urlsafe_base64, count: '1' })
  #     @facebook = Url.create({ link: 'https://www.facebook.com/', random_string: SecureRandom.urlsafe_base64, count: '1' })
  #   end

  #   context 'count should be correct' do
  #     it 'should set count to 1 if random_string was just created'
  #       Url.update_count(:count).should == 1
  #     end

  #     it 'should equal 2 if it is the second time the random_string was entered'do
  #       Url.update_count(:count).should == 2
  #     end
  #   end
end