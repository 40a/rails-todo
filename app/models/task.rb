class Task < ActiveRecord::Base
  scope :plan, -> { where(status: 'plan').order(:created_at).reverse_order }
  scope :done, -> { where(status: 'done').order(:created_at).reverse_order }

  def plan?
    status.to_s == 'plan'
  end

  def done?
    status.to_s == 'done'
  end
end
