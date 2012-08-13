Veewee::Session.declare({
  :cpu_count => '2',
  :memory_size=> '2048',
  :disk_size => '10140',
  :disk_format => 'VDI',
  :hostiocache => 'off',

  :os_type_id => 'RedHat_64',
  :iso_file => "CentOS-6.3-x86_64-minimal.iso", 
  :iso_src => "http://ftp.nluug.nl/ftp/pub/os/Linux/distr/CentOS/6.3/isos/x86_64/CentOS-6.3-x86_64-minimal.iso", 
  :iso_md5 => "087713752fa88c03a5e8471c661ad1a2", 
  :iso_download_timeout => 1000,

  :boot_wait => "10",
  :boot_cmd_sequence => [
    '<Tab> text ks=http://%IP%:%PORT%/ks.cfg<Enter>'
  ],

  :kickstart_port => "7122",
  :kickstart_timeout => 10000,
  :kickstart_file => "ks.cfg",

  :ssh_login_timeout => "100",
  :ssh_user => "vagrant",
  :ssh_password => "vagrant",
  :ssh_key => "",
  :ssh_host_port => "7222",
  :ssh_guest_port => "22",

  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "/sbin/halt -h -p",

  :postinstall_files => [ "postinstall.sh"],
  :postinstall_timeout => 10000
})
