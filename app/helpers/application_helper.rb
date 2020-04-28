module ApplicationHelper
  # マークダウン形式で記入するためにrequire
  require 'redcarpet'
  require 'coderay'

  # 未読通知を確認するメソッド
  def unchecked_notifications
    current_user.passive_notifications.where(checked: false)
  end

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      language = if language.nil?
                   'html'
                 else
                   language.split(':')[0]
                 end
      lang = case language.to_s
             when 'rb'
               'ruby'
             when 'yml'
               'yaml'
             when 'css'
               'css'
             when 'html'
               'html'
             when ''
               'md'
             else
               language
             end

      CodeRay.scan(code, lang).div
    end
  end

  # マークダウンを可能にするメソッド
  def markdown(text)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    options = {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true,
      hard_wrap: true,
      xhtml: true,
      lax_html_blocks: true,
      strikethrough: true
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end
end
