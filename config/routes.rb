EssenceDiamant::Application.routes.draw do
	resources :subscribers
  root to: 'static_pages#home'

  match '/english', to: 'static_pages#english', via: 'get'
  match '/lapproche_diamant', to: 'static_pages#texts_1_lapproche_diamant', via: 'get'
  match '/hameed_lenseignant', to: 'static_pages#texts_2_hameed_lenseignant', via: 'get'
  match '/la_collecte_du_miel', to: 'static_pages#texts_3_la_collecte_du_miel', via: 'get'

  match "/mailchimp", to: 'subscribers#mailchimp_event', via: 'get'

end
