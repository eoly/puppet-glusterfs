require 'puppet'
Puppet::Type.type(:glusterfs_pool).provide(:glusterfs) do

  commands :glusterfs => 'gluster'
  defaultfor :feature => :posix

  def self.instances
    glusterfs('peer','status').split(/\n/).collect do |line|
      if line =~ /Hostname:\s(\S+)$/
        new(:name => $1)
      else
        raise Puppet::Error, "Cannot parse invalid peer line: #{line}"
      end
    end
  end

  def create
    glusterfs('peer','probe', resource[:name])
  end

  def destroy
    glusterfs('peer','detach', resource[:name])
  end

  def exists?
    glusterfs('peer', 'status').split(/\n/).detect do |line|
      line.match(/^Hostname:\s#{Regexp.escape(resource[:name])}$/)
    end
  end
end