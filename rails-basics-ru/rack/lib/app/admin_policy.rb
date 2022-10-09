# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    return @app.call(env) unless req.path_info[%r{^/admin}]

    [403, { 'Content-Type' => 'text/plain' }, []]
  end
end
