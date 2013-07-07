add-riak-repo:
  pkgrepo.managed:
    - name: deb http://apt.basho.com precise main
    - disabled: False
    - key_url: http://apt.basho.com/gpg/basho.apt.key
    - require_in:
      - pkg: riak

riak:
  pkg.installed
