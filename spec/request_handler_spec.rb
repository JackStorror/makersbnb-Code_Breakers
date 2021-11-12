require_relative '../model/request_handler'

describe RequestHandler do
  describe '.request_booking' do
    it 'creates a new booking request' do
      populate_users_table
      populate_spaces_table
      request = RequestHandler.request_booking(space_id: 1, request_start: "01-03-2022", request_end: "04-03-2022", user_id: '2', host_id: '1')
      persisted_data = persist_request_id(request_id: request.request_id, table: 'requests')

      expect(request).to be_a RequestHandler
      expect(request.space_id).to eq persisted_data.first['space_id']
      expect(request.request_start).to eq '2022-01-03'
      expect(request.request_end).to eq '2022-04-03'
    end

    describe '.get_user_requests' do 
      it 'checks we can get user requests' do 
        populate_users_table
        populate_spaces_table
        connect_to_db_makers_bnb.exec("INSERT INTO requests(space_id, request_start, request_end, user_id, host_id) VALUES(1, '01-03-2032', '04-03-2032', 3, 1)")
        connect_to_db_makers_bnb.exec("INSERT INTO requests(space_id, request_start, request_end, user_id, host_id) VALUES(1, '01-03-2022', '04-03-2022', 3, 1)")
        expect(RequestHandler.get_user_requests(host_id: 1).first.user_id).to eq "3"

      end 

    end

  end

end
