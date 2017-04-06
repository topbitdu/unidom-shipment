##
# Application mailer 是模块内所有电子邮件发送类的基类。

class Unidom::Shipment::ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
