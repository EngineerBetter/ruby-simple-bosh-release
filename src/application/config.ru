# frozen_string_literal: true

require 'sinatra/base'
require 'json'

class Web < Sinatra::Base
  get '/' do
    "Congratulations! You made a BOSH release\n"
  end
end

run Web.new
