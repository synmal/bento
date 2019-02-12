require "administrate/base_dashboard"

class ArticleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    users: Field::HasMany,
    feeds: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    link: Field::String,
    image: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    tags: Field::Text,
    parent_url: Field::String,
    published_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :users,
    :feeds,
    :id,
    :title,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :users,
    :feeds,
    :id,
    :title,
    :link,
    :image,
    :created_at,
    :updated_at,
    :tags,
    :parent_url,
    :published_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :users,
    :feeds,
    :title,
    :link,
    :image,
    :tags,
    :parent_url,
    :published_at,
  ].freeze

  # Overwrite this method to customize how articles are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(article)
  #   "Article ##{article.id}"
  # end
end
