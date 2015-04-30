class Permission < Struct.new(:user)
  def allow?(controller, action)
    if user.nil?
      controller == ("users" || "corrals") && action.in?(%w[index show])
    elsif user.admin?
      true
    else
      controller = "users" && action != "destroy"
      # controller = "corrals" && action != "edit"
    end
  end
end