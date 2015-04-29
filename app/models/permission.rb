class Permission < Struct.new(:user)
  def allow?(controller, action)
    controller == "users" && action == "index"
  end
end