module Ruby3
  module Template
    class Report
      def initialize
        @title = 'monthly report'
        @text = ['Things are going', 'really well']
      end

      def output_report
        start = output_start
        head = output_head
        body =
          body_start + "#{@text.map { |line| output_line(line) }.join}" +
            body_end
        endText = output_end
        start + head + body + endText
      end

      def output_start
        ''
      end
      def output_head
        ''
      end
      def output_line(line)
        line
      end
      def body_start
        ''
      end
      def body_end
        ''
      end
      def output_end
        ''
      end
    end
    class HTMLReport < Report
      def output_start
        '<html><head></head>'
      end
      def output_head
        "<title>#{@title}</title>"
      end
      def body_start
        '<body>'
      end
      def body_end
        '</body>'
      end
      def output_line(line)
        "<p>#{line}</p>"
      end
      def output_end
        '</html>'
      end
    end
    class MarkDownReport < Report
      def output_head
        "##{@title}"
      end
      def body_start
        "\n"
      end
      def output_line(line)
        "#{line}\n"
      end
    end
  end
end
