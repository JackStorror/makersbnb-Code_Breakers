require_relative '../model/user_handler'
describe UserHandler do
  describe '.create_user' do
    it 'creates a new user with encrypted password' do
      expect(BCrypt::Password).to receive(:create).with('Gotham')
      UserHandler.create_user(user_name:'Batman', password:'Gotham')
      expect(UserHandler.find_user_name).to eq 'Batman'
    end
  end
end
