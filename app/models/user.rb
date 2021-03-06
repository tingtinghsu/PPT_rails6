class User < ApplicationRecord
  validates :account, presence: true, uniqueness: true, length: {minimum: 2}
  validates :password, presence: true, uniqueness: true, length: {minimum: 2}

  has_many :board_masters
  has_many :boards, through: :board_masters

  has_many :posts
  has_many :comments

  has_many :favorite_boards
  # 來源source 放model
  has_many :favorited_boards, through: :favorite_boards, source: :board

  # 密碼只能加密一次，不能放在before_save, 不然變成每次更新、存檔後都會再加密一次
  before_create :encrypt_password
  #類別方法
  def self.login(params)
    if params[:account] && params[:password]
      find_by(account: params[:account],
              password: add_salt(params[:password]))
    end
  end

  def self.has_this_id?(id)
    one?{ |user| user.id == id }
  end

  def toggle_favorite_board(b)
    if favorited_boards.exists?(b.id)
      favorited_boards.destroy(b)
    else
      favorited_boards << b
    end
  end

  private
  # 實體方法
  def encrypt_password
    # 註冊時加密\
    # 實體方法裡的self是實體方法
    # 取用給值的方法時候要用self（不然會以為是區域變數），取值時不用
    self.password = User.add_salt(self.password) 
  end
  # 類別方法
  def self.add_salt(password)
    Digest::SHA1.hexdigest("x#{password}y")
  end

  #private_class_method :add_salt
end
