class MDFormatter
  def output(context)
    "##{context.title}\n#{context.text.map { |line| "#{line}\n" }.join}"
  end
end
