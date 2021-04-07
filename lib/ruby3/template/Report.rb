module Ruby3
  module Template
    class Report
      def initialize
        @title = 'monthly report'
        @test = ['Things are going', 'really well']
      end

      def output_report
        puts('<html>')
        puts('<head>')
        puts("<title>#{@title}</title>")
        puts('</head>')

        return '</head>'
      end
    end
  end
end
