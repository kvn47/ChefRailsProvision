apt_repository 'webmin' do
  action :add
  uri 'http://download.webmin.com/download/repository'
  distribution 'sarge'
  components ['contrib']
  keyserver 'http://www.webmin.com/jcameron-key.asc'
end

package 'webmin' do
  options '--force-yes'
end