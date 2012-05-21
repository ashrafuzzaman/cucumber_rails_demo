class Event < ActiveRecord::Base
  attr_accessible :description, :end_at, :published, :start_at, :title
end
