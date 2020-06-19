storage "raft" {
  path    = "/opt/vault"
  node_id = "vault01"

  retry_join {
   leader_api_addr = "https://vault01.domain.com:8200"
   leader_ca_cert_file = "/etc/vault.d/ca.crt"
   leader_client_cert_file = "/etc/vault.d/vault01.crt"
   leader_client_key_file = "/etc/vault.d/vault01.key"
 }
  retry_join {
   leader_api_addr = "https://vault02.domain.com:8200"
   leader_ca_cert_file = "/etc/vault.d/ca.crt"
   leader_client_cert_file = "/etc/vault.d/vault02.crt"
   leader_client_key_file = "/etc/vault.d/vault02.key"
 }
}
listener "tcp" {
  address     = "0.0.0.0:8200"
  cluster_address     = "0.0.0.0:8201"
  tls_cert_file       = "/etc/vault.d/vault01.crt"
  tls_key_file        = "/etc/vault.d/vault01.key"
  tls_client_ca_file  = "/etc/vault.d/ca01.crt"
  tls_disable = false
}
api_addr = "https://vault01.domain.com:8200"
cluster_addr = "https://vault01.domain.com:8201"
disable_mlock = true
ui=true

