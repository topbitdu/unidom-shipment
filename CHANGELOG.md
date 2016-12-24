# Unidom Shipment Change Log 装运领域模型引擎变更日志

## v0.1
1. Shipment model & migration (20021001000000)
2. Shipment Item model & migration (20021002000000)

## v0.2
1. Shipment Package model & migration (20021011000000)
2. Shipment Package Item model & migration (20021012000000)
3. Shipment Receipt model & migration (20021013000000)
4. Improved the Shipment Item model to add the ``has_many :package_items`` macro

## v0.3
1. As Shipped concern

## v0.3.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v0.3.2
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v0.4
1. Improved the Shipment Package model & migration to add the optional #``serial_number`` field

## v0.5
1. Improve the Shipment Package model to add the :serial_number_is scope

## v0.5.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v0.6
1. Conveyance enum code
2. Improve the Shipment model to configure the Conveyance enum code
