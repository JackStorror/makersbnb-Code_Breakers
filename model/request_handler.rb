class RequestHandler
  attr_reader :request_id, :space_id, :request_start, :request_end, :user_id, :host_id

  def initialize(request_id:, space_id:, request_start:, request_end:, user_id:, host_id:)
    @request_id = request_id
    @space_id = space_id
    @request_start = request_start
    @request_end = request_end
    @user_id = user_id
    @host_id = host_id
  end

  def self.request_booking(space_id:, request_start:, request_end:, user_id:, host_id:)
    Database.connect('makers_bnb')

    request = Database.query(
      "INSERT INTO requests(space_id, request_start, request_end, user_id, host_id) VALUES($1, $2, $3, $4, $5) RETURNING request_id, space_id, request_start, request_end, user_id, host_id;",
      [space_id, request_start, request_end, user_id, host_id],
    )
    RequestHandler.new(request_id: request[0]['request_id'], space_id: request[0]['space_id'], request_start: request[0]['request_start'], request_end: request[0]['request_end'], user_id: request[0]['user_id'], host_id: request[0]['host_id'])
  end

  def self.get_host_requests
    
  end
  end