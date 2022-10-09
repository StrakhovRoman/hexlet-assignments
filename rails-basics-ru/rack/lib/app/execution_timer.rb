# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start = Time.now
    status, headers, body = @app.call(env)
    duration = ((Time.now - start).to_f * 1000).round(2)
    response = "#{body}\n#{duration}"
    [status, headers, response]
  end
end
