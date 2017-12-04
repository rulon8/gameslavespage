class Post < ApplicationRecord
  belongs_to :user
  has_many :pictures
  #validates_associated :user No hay posts sin usuario
  validates :title, :date, :user_id, presence: true #verifica existencia de usuario, fecha y titulo

  def previous_post
    @post_prohibido = self.class.where("id > ?", 5).order(id: :asc).first
    if @post_prohibido && id == @post_prohibido.id
      self.class.where("id < ?", 5).order(id: :desc).first
    else
      self.class.where("id < ?", id).order(id: :desc).first
    end
  end

  def next_post
    @post_prohibido = self.class.where("id < ?", 5).order(id: :desc).first
    if @post_prohibido && id == @post_prohibido.id
      self.class.where("id > ?", 5).order(id: :asc).first
    else
      self.class.where("id > ?", id).order(id: :asc).first
    end
  end
  #def self.listing(page)
    #order(created_at: :desc).page(params[:page]).per(1)
  #end
  
end
