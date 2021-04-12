class HTMLFormatter
  def output(context)
    "<html><head></head><title>#{context.title}</title><body>#{context.text.map { |line| "<p>#{line}</p>" }.join}</body></html>"
  end
end
