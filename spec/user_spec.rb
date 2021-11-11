require_relative '../model/user'
describe User do
  describe '.create_user' do
    it 'creates a new user' do
      User.create_user('Batman')
      expect(User.get_user_name).to eq 'Batman'
    end
  end
end
