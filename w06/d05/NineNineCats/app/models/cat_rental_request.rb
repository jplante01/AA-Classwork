# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: %w( PENDING APPROVED DENIED )}
  validate :start_must_come_before_end
  validate :does_not_overlap_approved_request


  belongs_to :cat, dependent: :destroy
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat
    
    def approved?
      self.status == 'APPROVED'
    end
  
    def denied?
      self.status == 'DENIED'
    end
  
    def deny!
      self.status = 'DENIED'
      self.save!
    end
  
    def pending?
      self.status == 'PENDING'
    end
  
    private
  
    def assign_pending_status
      self.status ||= 'PENDING'
    end

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: cat_id)
      .where.not('start_date > :end_date OR end_date < :start_date',
                 start_date: start_date, end_date: end_date

  end
  
  def does_not_overlap_approved_request
    # A denied request doesn't need to be checked. A pending request
    # should be checked; users shouldn't be able to make requests for
    # periods during which a cat has already been spoken for.
    return if self.denied?

    unless overlapping_approved_requests.empty?
      errors[:base] <<
        'Request conflicts with existing approved request'
    end
  end
  
  def overlapping_approved_requests
    overlapping_requests.where('status = \'APPROVED\'')
  end

  def overlapping_pending_requests
    overlapping_requests.where('status = \'PENDING\'')
  end
  
  def start_must_come_before_end
    return if start_date < end_date
    errors[:start_date] << 'must come before end date'
    errors[:end_date] << 'must come after start date'
  end
end
