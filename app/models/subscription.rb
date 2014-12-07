class Subscription < ActiveRecord::Base
  belongs_to :user, inverse_of: :subscriptions
  belongs_to :lesson, inverse_of: :subscriptions

  validates :user, presence: true
  validates :lesson, presence: true, uniqueness: { scope: :user }

  def self.open?
    now = Time.now

    if ENV['SUBSCRIPTIONS_OPEN_AT'].present? && Time.parse(ENV['SUBSCRIPTIONS_OPEN_AT']) >= now
      return false
    end

    if ENV['SUBSCRIPTIONS_CLOSE_AT'].present? && Time.parse(ENV['SUBSCRIPTIONS_CLOSE_AT']) <= now
      return false
    end

    true
  end

  def self.closed?
    !open?
  end

  def course
    lesson.course
  end
end
