module SnippetHelper

  def insert_or_create_snippet(section_name, group_name, snippet_name, text = nil, &block)

    Rails.cache.fetch(['sql', section_name, group_name, snippet_name]) do
      if section = Section.find_by(name: section_name)
        if group = section.groups.find_by(name: group_name)
          if snippet = group.snippets.find_by(name: snippet_name)
            snippet.content.html_safe
          else
            return if text.nil? && !block_given? 
            content = text || capture { block.call }
            group.snippets.create!(name: snippet_name, content: content)
            content.html_safe
          end
        else
          return if text.nil? && !block_given?
          content = text || capture { block.call } 
          group = section.groups.new(name: group_name)
          snippet = group.snippets.new(name: snippet_name, content: content)
          snippet.save!
          content.html_safe
        end
      else
        return if text.nil? && !block_given?
        content = text || capture { block.call }
        section = Section.new(name: section_name)
        group = section.groups.new(name: group_name)  
        snippet = group.snippets.new(name: snippet_name, content: content)
        snippet.save!
        content.html_safe
      end
    end
  end

end