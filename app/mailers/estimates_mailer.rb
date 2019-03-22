class EstimatesMailer < ApplicationMailer
  def notify_approved(estimate_id, email)
    @estimate = Estimate.find(estimate_id)
    mail(to: email, subject: "Orçamento aprovado: #{@estimate.title}")
  end

  def notify_answered_estimate(estimate_id, email)
    @estimate = Estimate.find(estimate_id)
    mail(to: email, subject: "Orçamento Realizado: #{@estimate.title}")
  end  
end
