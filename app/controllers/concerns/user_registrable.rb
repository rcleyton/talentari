module UserRegistrable
  extend ActiveSupport::Concern

  included do
    def new_user
      @user = User.new
    end

    def create_user
      @user = User.new(user_params)
      if @user.save
        redirect_to root_path flash[:success] = "Cadastro realizado com sucesso!"
      else
        flash.now[:error] = "Verifique os campos em vermelho!"
        render :new, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:email_address, :password, :password_confirmation, :role)
    end
  end
end
