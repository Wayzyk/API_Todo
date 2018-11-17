class Task < ApplicationRecord
  include RailsSortable::Model
  set_sortable :sort
  belongs_to :project

  has_many :comments, dependent: :destroy

  validates_presence_of :name
end
