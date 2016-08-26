class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user = nil, record)
    @user = user
    @record = record.to_model
  end
end
