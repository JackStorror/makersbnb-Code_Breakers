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
  end
end