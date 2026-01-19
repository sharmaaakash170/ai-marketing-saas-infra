class Api::TestController < ApplicationController
  def ping
    render json: { message: "Backend connected" }
  end
end
