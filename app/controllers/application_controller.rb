
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :markdown, :syntax_highlighter
  def current_user
    @_user || User.find(session[:user_id]) if session[:user_id]
  end

  def markdown(text)
   render_options = {filter_html:     true,
                     hard_wrap:       true, 
                     link_attributes: { rel: 'nofollow' }
                    }

    renderer = Redcarpet::Render::HTML.new(render_options)

    extensions = { autolink:           true,
                   fenced_code_blocks: true,
                   lax_spacing:        true,
                   no_intra_emphasis:  true,
                   strikethrough:      true,
                   superscript:        true
                 }

  syntax_highlighter(Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe)
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
end
