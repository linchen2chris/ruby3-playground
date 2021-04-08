module Ruby3
  module Template
    class Report
      def initialize
        @title = 'monthly report'
        @text = ['Things are going', 'really well']
      end

      def output_report
        "<html> <head> <title>#{@title}</title> <body> #{@text.map { |line| "<p>#{line}</p> " }.join}</body> </head> </html>"
      end
    end
  end
end
