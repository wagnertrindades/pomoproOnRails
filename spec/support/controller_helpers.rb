# https://github.com/plataformatec/devise/wiki/How-To:-Stub-authentication-in-controller-specs
module ControllerHelpers
  def sign_in(scope=:user, user = double('user'))
    unless scope.is_a? Symbol
      user = scope
      scope = :user
    end
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => scope})
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    end
    controller.instance_variable_set("@current_user",user)
  end
end
