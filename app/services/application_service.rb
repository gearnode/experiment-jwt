class ApplicationService

  include ActiveModel::Validations

  attr_accessor :result

  def self.call(**args)
    instance = new(args)
    instance.result = instance.call
    instance
  end

  def success?
    if errors.empty?
      true 
    else
     false 
    end
  end

end
