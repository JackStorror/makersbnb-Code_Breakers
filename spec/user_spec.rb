require_relative '../model/user_handler'
describe UserHandler do
  describe '.create_user' do
    it 'creates a new user' do
      UserHandler.create_user('Batman')
      expect(UserHandler.get_user_name).to eq 'Batman'
    end
  end
end
