module ApplicationHelper
  require "redcarpet"
  require "coderay"


  def markdown(text)
    options = {
      filter_html:     true,     
      hard_wrap:       true,     
      space_after_headers: true, 
      space_after_headers: true,
      with_toc_data: true
    }

    extensions = {
      autolink:           true,  
      no_intra_emphasis:  true,  
      fenced_code_blocks: true,  
      strikethrough:      true,  
      superscript:        true,  
      tables:             true,  
      underline:          true,  
      highlight:          true,  
      quote:              true,  
      footnotes:          true,  

      
      xhtml: true,               
      lax_html_blocks: true,     
      lax_spacing: true,         
      no_images: true,           
      no_links: true,            
      no_styles: true,           
      safe_links_only: true,     
      disable_indented_code_blocks: true, 
      escape_html: true,         
      with_toc_data: true,       
      prettify: true,            
      link_attributes: true,     
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

    class HTMLwithCoderay < Redcarpet::Render::HTML
        def block_code(code, language)
            language = language.split(':')[0]

            case language.to_s
            when 'rb'         
                lang = 'ruby'
            when 'yml'
                lang = 'yaml'
            when 'css'
                lang = 'css'
            when 'html'
                lang = 'html'
            when ''
                lang = 'md'  
            else
                lang = language
            end

            CodeRay.scan(code, lang).div
        end
    end
end
