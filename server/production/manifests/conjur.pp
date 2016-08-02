class { conjur:
  conjur_url => 'https://conjur/api',
  conjur_certificate => file("conjur/conjur.pem"),
  conjur_account => demo,

  host_id => "puppet/$fqdn",
  hostfactory_token => '1s306yr32a3tht2hrf26v2wp73m1wgfdgq11kx579n24fkv1a69jxw'
}