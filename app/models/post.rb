class Post < ApplicationRecord
  belongs_to :user
  
  #validates_associated :user No hay posts sin usuario
  validates :title, :date, :user_id, presence: true #verifica existencia de usuario, fecha y titulo
  def next
    Post.where("id > ?", id).limit(1).last
  end

  def prev
    Post.where("id < ?", id).limit(1).first
  end
  def previous_post
    self.class.where("id < ?", id).order(id: :desc).first
  end

  def next_post
    self.class.where("id > ?", id).order(id: :asc).first
  end
  #def self.listing(page)
    #order(created_at: :desc).page(params[:page]).per(1)
  #end
end
