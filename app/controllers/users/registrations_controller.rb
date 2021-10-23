class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to user_path(current_user.id), alert: 'ゲストユーザーの更新・削除はできません。'
    end
  end
  def after_sign_up_path_for(resource)
    questions_path
  end


  def after_update_path_for(resource)
    questions_path
  end
end

