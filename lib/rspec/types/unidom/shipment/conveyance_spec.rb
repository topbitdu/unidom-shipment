describe Unidom::Shipment::Conveyance, type: :type do

  before :each do
  end

  after :each do
  end

  it_behaves_like 'ProgneTapera::EnumConfig', 6, [
    { code: 'CSSP', name: 'customer_shipment', localized_name: '客户装运' },
    { code: 'CSRT', name: 'customer_return',   localized_name: '客户退回' },
    { code: 'PCSP', name: 'purchase_shipment', localized_name: '购买装运' },
    { code: 'PCRT', name: 'purchase_return',   localized_name: '进货退回' },
    { code: 'TRSF', name: 'transfer',          localized_name: '转运'     },
    { code: 'DROP', name: 'drop_shipment',     localized_name: '直接装运' } ]

end
