enum FormStoresType { register, update }
enum FormMallStoresType { register, update }
enum FormMallsType { register, update }
enum DialogFloorType { add, update }
enum MapAddressingStep { firstMarker, secondMarker, finish }
enum PaymentType { credit, online }
enum ReceiverType { driver, carrier }
enum RequestSteps {
  add,
  acceptByDriver,
  acceptByCarrier,
  introductionDriverByCarrier,
  acceptCarrierByOwner,
  acceptDriverByOwner,
  cancelByOwner,
  cancelByDriver,
  cancelByCarrier,
  start,
  end,
  confirmByOwner
}
enum TransactionType {onlinePay,chargingWallet,walletPay}
enum FCMType {message,request}
enum RequestError {timeOut,noNet,wrongApiToken,unauthorized,unknown}
enum StoreItemsType {store, passageStore}
enum MapAddType {add, edit}
enum MarkerType {store, passage}