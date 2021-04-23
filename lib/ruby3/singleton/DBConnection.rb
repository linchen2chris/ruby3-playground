class Dbconnection
  @@instance = Dbconnection.new
  @@counter = 1

  def self.instance
    return @@instance
  end

  def plus
    @@counter = @@counter + 1
  end
  private_class_method :new
end
