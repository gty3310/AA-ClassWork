
require 'byebug'
require 'rack'
require_relative '../lib/controller_base'

class MyController < ControllerBase
  def go
    if req.path == "/cats"
      render_content("hello cats!", "text/html")
    else
      redirect_to("/cats")
    end
  end
  
  
  def render_content(content, content_type)
    @already_built_response = true
    debugger
    res.body = content
    res['Content-Type'] = content_type
    
  end
  
  def redirect_to()
    
  end
end
app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  MyController.new(req, res).go
  res.finish
end

class UsersController
  def render_content(content, content_type)
    @already_built_response = true
    debugger
    res.body = content
    res['Content-Type'] = content_type
    
  end

end
Rack::Server.start(
  app: app,
  Port: 3000
)

