#                             Prefix Verb   URI Pattern                                                                                           Controller#Action
#                            post_comments GET    /posts/:post_id/comments(.:format)                                                                comments#index
#                                          POST   /posts/:post_id/comments(.:format)                                                                comments#create
#                         new_post_comment GET    /posts/:post_id/comments/new(.:format)                                                            comments#new
#                        edit_post_comment GET    /posts/:post_id/comments/:id/edit(.:format)                                                       comments#edit
#                             post_comment GET    /posts/:post_id/comments/:id(.:format)                                                            comments#show
#                                          PATCH  /posts/:post_id/comments/:id(.:format)                                                            comments#update
#                                          PUT    /posts/:post_id/comments/:id(.:format)                                                            comments#update
#                                          DELETE /posts/:post_id/comments/:id(.:format)                                                            comments#destroy
#                                    posts GET    /posts(.:format)                                                                                  posts#index
#                                          POST   /posts(.:format)                                                                                  posts#create
#                                 new_post GET    /posts/new(.:format)                                                                              posts#new
#                                edit_post GET    /posts/:id/edit(.:format)                                                                         posts#edit
#                                     post GET    /posts/:id(.:format)                                                                              posts#show
#                                          PATCH  /posts/:id(.:format)                                                                              posts#update
#                                          PUT    /posts/:id(.:format)                                                                              posts#update
#                                          DELETE /posts/:id(.:format)                                                                              posts#destroy
#                         new_user_session GET    /users/sign_in(.:format)                                                                          users/sessions#new
#                             user_session POST   /users/sign_in(.:format)                                                                          users/sessions#create
#                     destroy_user_session DELETE /users/sign_out(.:format)                                                                         users/sessions#destroy
#                        new_user_password GET    /users/password/new(.:format)                                                                     users/passwords#new
#                       edit_user_password GET    /users/password/edit(.:format)                                                                    users/passwords#edit
#                            user_password PATCH  /users/password(.:format)                                                                         users/passwords#update
#                                          PUT    /users/password(.:format)                                                                         users/passwords#update
#                                          POST   /users/password(.:format)                                                                         users/passwords#create
#                 cancel_user_registration GET    /users/cancel(.:format)                                                                           users/registrations#cancel
#                    new_user_registration GET    /users/sign_up(.:format)                                                                          users/registrations#new
#                   edit_user_registration GET    /users/edit(.:format)                                                                             users/registrations#edit
#                        user_registration PATCH  /users(.:format)                                                                                  users/registrations#update
#                                          PUT    /users(.:format)                                                                                  users/registrations#update
#                                          DELETE /users(.:format)                                                                                  users/registrations#destroy
#                                          POST   /users(.:format)                                                                                  users/registrations#create
#                                  sign_in GET    /sign_in(.:format)                                                                                users/sessions#new
#                                  sign_up GET    /sign_up(.:format)                                                                                users/registrations#new
#                          forgot_password GET    /forgot_password(.:format)                                                                        users/passwords#new
#                           reset_password GET    /reset_password(.:format)                                                                         users/passwords#edit
#                                     root GET    /                                                                                                 application#home
#            rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
#               rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
#            rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
#      rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
#            rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
#             rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
#           rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
#                                          POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
#        new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
#       edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                                 rails/conductor/action_mailbox/inbound_emails#edit
#            rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
#                                          PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#destroy
# new_rails_conductor_inbound_email_source GET    /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
#    rails_conductor_inbound_email_sources POST   /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
#    rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
#                       rails_service_blob GET    /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#                 rails_service_blob_proxy GET    /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                          GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#                rails_blob_representation GET    /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
#          rails_blob_representation_proxy GET    /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                          GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#                       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#                update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
#                     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create

Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
  end

  root to: 'application#home'
end
