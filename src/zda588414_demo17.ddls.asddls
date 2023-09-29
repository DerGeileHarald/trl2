
extend view entity ZDA588414_Carrier with

association [0..*] to /dmo/connection as _ZZConnections on _ZZconnections.carrier_id = /dmo/carrier.carrier_id
 {
  _ZZConnections
}
