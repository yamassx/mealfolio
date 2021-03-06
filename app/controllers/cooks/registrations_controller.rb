# frozen_string_literal: true

class Cooks::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create, :new]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    current_cook.assign_attributes(account_update_params)
    # face_sizing(120,120)
    # background_sizing()
    if current_cook.update(account_update_params)
      sign_in(current_cook, bypass: true)
      redirect_to cooks_path(current_cook.id), notice: 'プロフィールを更新しました'
    else
      render "edit"
    end
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def cook_params
    params.require(:cook).permit(:name, :email, :password, :password_confirmation, :greeting, :history, :face, :background )
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :firstname, :last_name, :greeting, :history, :background, :face])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   'cooks/index'
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   'cooks/index'
  # end

  def face_sizing(width, height)
    if params[:face] != nil
      img = MiniMagick::Pfimage.read(params[:image1])
      img.resize_to_fill 'width,height,"Center"'
      img.write "public/images/portfolio.jpg"
    end
  end

  def background_sizing(width, height)
    if params[:background] != nil
      img = MiniMagick::Pfimage.read(params[:image1])
      img.resize_to_fill 'width,height,"Center"'
      img.write "public/images/portfolio.jpg"
    end
  end
end
