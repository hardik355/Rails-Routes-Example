class LangVerifyConstraint

  def matches?(request)
    request.params[:lang] == 'hi'
  end 
end 