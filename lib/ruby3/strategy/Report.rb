module Ruby3
  module Strategy
    class Report
      attr_reader :title, :text
      attr_accessor :formatter

      def initialize(formatter)
        @title = 'monthly report'
        @text = ['Things are going', 'really well']
        @formatter = formatter
      end

      def output_report
        @formatter.output(self)
      end
    end

    class HTMLFormatter
      def output(context)
        "<html><head></head><title>#{context.title}</title><body>#{context.text.map { |line| "<p>#{line}</p>" }.join}</body></html>"
      end
    end

    class MDFormatter
      def output(context)
        "##{context.title}\n#{context.text.map { |line| "#{line}\n" }.join}"
      end
    end
  end
end
