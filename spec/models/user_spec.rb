require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'given correct input' do
      it 'saves successfully' do
        user = User.new(first_name: 'John',
                        last_name: 'Doe',
                        email: 'jd@example.com',
                        password: 'password',
                        password_confirmation: 'password')
        expect(user).to be_valid
      end
    end
    context 'given passwords that do not match' do
      it 'returns an error' do
        user = User.new(first_name: 'John',
                        last_name: 'Doe',
                        email: 'jd@example.com',
                        password: 'password',
                        password_confirmation: 'pass')
        expect(user).to_not be_valid
        expect(user.errors.messages[:password_confirmation]).to include("doesn't match Password")
      end
    end
    context 'given already registered email' do
      it 'returns an error' do
        user1 = User.create(first_name: 'John',
                            last_name: 'Doe',
                            email: 'jd@example.com',
                            password: 'password',
                            password_confirmation: 'password')
        user2 = User.new(first_name: 'John',
                        last_name: 'Doe',
                        email: 'JD@example.com',
                        password: 'password',
                        password_confirmation: 'password')
        expect(user2).to_not be_valid
        expect(user2.errors.messages[:email]).to include("has already been taken")
      end
    end
    context 'given no password' do
      it 'returns an error' do
        user = User.new(first_name: 'John',
                        last_name: 'Doe',
                        email: 'jd@example.com')
        expect(user).to_not be_valid
        expect(user.errors.messages[:password]).to include("can't be blank")
      end
    end
    context 'given no email' do
      it 'returns an error' do
        user = User.new(first_name: 'John',
                        last_name: 'Doe',
                        password: 'password',
                        password_confirmation: 'password')
        expect(user).to_not be_valid
        expect(user.errors.messages[:email]).to include("can't be blank")
      end
    end
    context 'given no first_name' do
      it 'returns an error' do
        user = User.new(last_name: 'Doe',
                        email: 'jd@example.com',
                        password: 'password',
                        password_confirmation: 'password')
        expect(user).to_not be_valid
        expect(user.errors.messages[:first_name]).to include("can't be blank")
      end
    end
    context 'given no last_name' do
      it 'returns an error' do
        user = User.new(first_name: 'John',
                        email: 'jd@example.com',
                        password: 'password',
                        password_confirmation: 'password')
        expect(user).to_not be_valid
        expect(user.errors.messages[:last_name]).to include("can't be blank")
      end
    end
    context 'given a password that is too short' do
      it 'returns an error' do
        user = User.new(first_name: 'John',
                        last_name: 'Doe',
                        email: 'jd@example.com',
                        password: 'abc',
                        password_confirmation: 'abc')
        expect(user).to_not be_valid
        expect(user.errors.messages[:password]).to include("is too short (minimum is 4 characters)")
      end
    end
  end

  describe '.authenticate_with_credentials' do
    context 'given valid credentials' do
      it 'returns the user object' do
        User.create(first_name: 'John',
                    last_name: 'Doe',
                    email: 'jd@example.com',
                    password: 'password',
                    password_confirmation: 'password')
        expect(User.authenticate_with_credentials('jd@example.com', 'password')).to be_instance_of(User)
      end
    end
    context 'given invalid password' do
      it 'returns nil' do
        User.create(first_name: 'John',
                    last_name: 'Doe',
                    email: 'jd@example.com',
                    password: 'password',
                    password_confirmation: 'password')
        expect(User.authenticate_with_credentials('jd@example.com', 'test')).to be_nil
      end
    end
    context 'given invalid email' do
      it 'returns nil' do
        User.create(first_name: 'John',
                    last_name: 'Doe',
                    email: 'jd@example.com',
                    password: 'password',
                    password_confirmation: 'password')
        expect(User.authenticate_with_credentials('test@example.com', 'password')).to be_nil
      end
    end
    context 'given valid credentials with whitespace at the start' do
      it 'returns the user object' do
        User.create(first_name: 'John',
                    last_name: 'Doe',
                    email: 'jd@example.com',
                    password: 'password',
                    password_confirmation: 'password')
        expect(User.authenticate_with_credentials('  jd@example.com', 'password')).to be_instance_of(User)
      end
    end
    context 'given valid credentials with wrong case' do
      it 'returns the user object' do
        User.create(first_name: 'John',
                    last_name: 'Doe',
                    email: 'jd@example.com',
                    password: 'password',
                    password_confirmation: 'password')
        expect(User.authenticate_with_credentials('JD@example.COM', 'password')).to be_instance_of(User)
      end
    end
  end
end
