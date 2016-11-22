class ApplicationController < ActionController::Base
  if ENV['BASIC_AUTH']
    user, pass = ENV['BASIC_AUTH'].split(':')
    http_basic_authenticate_with name: user, password: pass
  end

  before_action :meta, if: "request.get?"

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Devise, require authenticate by default
  before_filter :authenticate_user!

  # CanCan, check authorization unless authorizing with devise
  check_authorization unless: :skip_check_authorization?

  # Special handling for ajax requests.
  # Must appear before other rescue_from statements.
  rescue_from Exception, with: :handle_uncaught_exception

  include CommonHelper
  include ErrorReportingConcern
  include AuthorizationErrorsConcern

  protected

  def skip_check_authorization?
    devise_controller? || is_a?(RailsAdmin::ApplicationController)
  end

  # Reset response so redirect or render can be called again.
  # This is an undocumented hack but it works.
  def reset_response
    self.instance_variable_set(:@_response_body, nil)
  end

  # Respond to uncaught exceptions with friendly error message during ajax requets
  def handle_uncaught_exception(exception)
    if request.format == :js
      report_error(exception)
      flash.now[:error] = Rails.env.development? ? exception.message : I18n.t('errors.unknown')
      render 'layouts/uncaught_error.js'
    else
      raise
    end
  end

  def meta(options={})
    site_name   = "Cup Of Me"
    description = options[:description] || "Делись знаниями"
    image       = options[:image]       || "/banner.jpg"
    type        = options[:type]        || "article"
    current_url = request.url
    noindex     = options[:noindex]     || Rails.env.production? ? false : true

    # options[:t] - динамическая часть тега title
    page_namespace = "#{controller_name}.#{action_name}"
    title = I18n.t("titles.#{page_namespace}", title: options[:t])  unless I18n.t("titles.#{page_namespace}", default: '').blank?

    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      image_src:   image,
      description: description,
      reverse: true,
      noindex: noindex,
      twitter: {
        site_name: site_name,
        site: '@cupofme_dev',
        card: 'summary',
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: {
          _: image,
          width: 1200,
          height: 600,
          type: 'image/png'
        },
        description: description,
        type: type
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags(options.except(:t))
  end
end
