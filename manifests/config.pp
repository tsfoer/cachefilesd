class cachefilesd::config inherits cachefilesd {
  file { $config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('cachefilesd/cachefilesd.conf.erb'),
  }
}
