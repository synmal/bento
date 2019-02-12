require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    authentications: Field::HasMany,
    feeds: Field::HasMany,
    articles: Field::HasMany,
    podcasts: Field::HasMany,
    projects: Field::HasMany,
    videos: Field::HasMany,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    email: Field::String,
    encrypted_password: Field::String,
    confirmation_token: Field::String,
    remember_token: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    avatar: Field::String,
    developer_type: Field::String,
    interest: Field::String,
    user_languages_skill: Field::String.with_options(searchable: false),
    roles: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :authentications,
    :feeds,
    :articles,
    :podcasts,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :authentications,
    :feeds,
    :articles,
    :podcasts,
    :projects,
    :videos,
    :id,
    :created_at,
    :updated_at,
    :email,
    :encrypted_password,
    :confirmation_token,
    :remember_token,
    :first_name,
    :last_name,
    :avatar,
    :developer_type,
    :interest,
    :user_languages_skill,
    :roles,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :authentications,
    :feeds,
    :articles,
    :podcasts,
    :projects,
    :videos,
    :email,
    :encrypted_password,
    :confirmation_token,
    :remember_token,
    :first_name,
    :last_name,
    :avatar,
    :developer_type,
    :interest,
    :user_languages_skill,
    :roles,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
