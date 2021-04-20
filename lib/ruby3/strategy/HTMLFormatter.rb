class HTMLFormatter
  def output(context)
    "<html><head></head><title>#{context.title}</title><body>#{context.text.map do |line|
                                                                 "<p>#{line}</p>"
                                                               end.join}</body></html>"
  end
end
