class GreetingsController < ApplicationController
  def hindi
    render plain: 'नमस्ते!'
  end

  def english
    render plain: 'Hello!'
  end
end
