module Moip2

  class Response < SimpleDelegator

    def initialize(resp, json)
      if json.is_a? Hash
        super(RecursiveOpenStruct.new(json, recurse_over_arrays: true))
      else
        super(resp)
      end
      @resp = resp
    end

    def success?
      (200..299).include? @resp.code.to_i
    end

    def client_error?
      (400..499).include? @resp.code.to_i
    end

    def server_error?
      (500..599).include? @resp.code.to_i
    end
    
  end

end
