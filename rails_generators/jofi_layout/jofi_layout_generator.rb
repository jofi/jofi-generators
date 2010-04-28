class JofiLayoutGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    @name = @args.first || 'application'
  end
  
  def manifest
    record do |m|
      m.directory 'app/views/layouts'
      m.directory 'public/stylesheets'
      m.directory 'public/images'
      m.directory 'app/helpers'
      
      if options[:haml]
        m.directory 'public/stylesheets/sass'
        m.template "layout.html.haml", "app/views/layouts/#{file_name}.html.haml"
        m.file     "stylesheet.sass",  "public/stylesheets/sass/#{file_name}.sass"
        m.file     "header_left.gif",  "public/images/header_left.gif"
        m.file     "header_right.gif",  "public/images/header_right.gif"
        m.file     "header_banner.gif",  "public/images/header_banner.gif"
        m.file     "spinner.gif",  "public/images/spinner.gif"                
      else
        m.template "layout.html.erb", "app/views/layouts/#{file_name}.html.erb"
        m.file     "stylesheet.css",  "public/stylesheets/#{file_name}.css"
        m.file     "header_left.gif",  "public/images/header_left.gif"
        m.file     "header_right.gif",  "public/images/header_right.gif"
        m.file     "spinner.gif",  "public/images/header_banner.gif"
        
      end
      m.file "helper.rb", "app/helpers/layout_helper.rb"
    end
  end
  
  def file_name
    @name.underscore
  end

  protected

    def add_options!(opt)
      opt.separator ''
      opt.separator 'Options:'
      opt.on("--haml", "Generate HAML for view, and SASS for stylesheet.") { |v| options[:haml] = v }
    end

    def banner
      <<-EOS
Creates generic layout, stylesheet, and helper files.

USAGE: #{$0} #{spec.name} [layout_name]
EOS
    end
end
