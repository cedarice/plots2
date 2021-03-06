module NodeShared
  extend ActiveSupport::Concern

  def likes
    self.cached_likes
  end

   def liked_by(uid)
    self.likers.collect(&:uid).include?(uid)
  end

  def comments
    self.drupal_comments
        .order('timestamp DESC')
  end
end