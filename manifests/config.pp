class cachefilesd::config inherits cachefilesd {
  file { $config:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('cachefilesd/cachefilesd.conf.erb'),
  }
}
