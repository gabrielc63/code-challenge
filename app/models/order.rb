class Order < ApplicationRecord
  include PgSearch::Model

  belongs_to :product

  STATUS = ['processing'].concat(Fedex::Shipment::STATUS).freeze

  validates :customer_name, presence: true
  validate :proper_status?

  before_validation :set_default_status, on: :create

  
  pg_search_scope :search_by_customer, against: :customer_name

  scope :filter_by_status, ->(status) { where(status: status) if status.present? }

  scope :filter_by_customer_name, ->(name) { search_by_customer(name) if name.present? }

  scope :filter_by_date_range, ->(start_date, end_date) { 
    where(created_at: start_date..end_date) if start_date.present? && end_date.present?
  }
  scope :sort_by_field, ->(sort, direction) { order(sort => direction) if sort.present? && direction.present? }

  private

  def proper_status?
    errors.add(:status, "is not valid") unless STATUS.include?(self.status)
  end

  def set_default_status
    self.status ||= 'processing'
  end
end
