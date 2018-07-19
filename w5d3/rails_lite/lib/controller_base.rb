require 'active_support'
require 'byebug'
require 'active_support/core_ext'
require 'erb'
require_relative './session'


class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @res = res
    @req = req
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise Exception if @already_built_response
    res.header['location'] = url
    res.status = 302
    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise Exception if @already_built_response
    res['Content-Type']= content_type
    # debugger
    res.write(content)
    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    #template_name = index
    controller_name = self.class.name.underscore
    file_path = "views/#{controller_name}/#{template_name}.html.erb"
    # res.write(reader.)
    file_content = File.read(file_path)
    render_content(ERB.new(file_content).src, 'text/html')
    # debugger
    
  end

  # method exposing a `Session` object
  def session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

