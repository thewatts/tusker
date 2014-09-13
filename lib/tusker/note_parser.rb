require "redcarpet"

module Tusker
  class NoteParser
    attr_reader :raw_data

    def initialize(raw_data = "")
      @raw_data = raw_data
    end

    def data
      @data ||= parse_raw_data
    end

    def markdown
      @markdown ||= Redcarpet::Markdown.new(renderer, extensions)
    end

    def renderer
      Redcarpet::Render::HTML.new(hard_wrap: true, xhtml: true)
    end

    def extensions
      {
        autolink: true,
      }
    end

    def write
      File.delete('/test.html') if File.exists?('/test.html')
      File.open('./test.html', 'w+') do |f|
        f.write(data[:content])
      end
    end

    private

    def parse_raw_data
      splits      = raw_data.split(/\n/)
      title       = splits[1].split("Title:")[1].strip
      tags        = splits[2].split("Tags:")[1].split(',').map(&:strip)
      raw_content = splits[4..-1].join("\n")
      content     = markdown.render(raw_content)

      {
        title: title,
        tags: tags,
        content: content,
      }
    end
  end
end


