class MyRackApp
  def call(env)
    [200, { "Content-Type" => "text/plain" }, ["Hello from Rack!"]]
  end
end
