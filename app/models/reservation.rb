class Reservation < ApplicationRecord
  belongs_to :customer
  before_create :reservation_code_gen
  after_create :send_mail

  private
  def send_mail
    puts 'Mail Gönderildi'
  end

  private
  def reservation_code_gen
    @reservation_code = (0...8).map { (65 + rand(26)).chr }.join
    self.reservation_code = @reservation_code
  end
  
end
