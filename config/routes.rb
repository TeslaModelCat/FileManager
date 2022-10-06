Rails.application.routes.draw do
  devise_for :users,
                defaults: { format: :json },
                controllers: {
                  sessions: 'auth/sessions',
                  registrations: 'auth/registrations'
                }
  namespace 'api' do
    resources :files, only: %i[index create destroy] do
      collection do
        post :get_presigned_url
      end
    end
    resources :users, only: [] do
      collection do
        get :me
        post :set_notification_settings
        post :send_mail_notification
      end
    end
    resources :notifications, only: [:index] do
      collection do
        get :update_status
      end
    end
  end
end
