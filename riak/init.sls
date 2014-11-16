add-riak-repo:
  pkgrepo.managed:
    - name: deb http://apt.basho.com precise main
    - disabled: False
    - key_url: http://apt.basho.com/gpg/basho.apt.key
    - require_in:
      - pkg: riak

riak:
  pkg.installed

{% set settings = salt['pillar.get']('riak', {}) %}
/etc/riak/app.config:
  file.managed:
    - source: {{ settings.get('template_file', 'salt://riak/files/riakapp.config') }}
    - template: {{ settings.get('template_engine', 'jinja') }}
    - context:
        pb_bind_iface:    {{  grains['ip4_interfaces'][  settings.get('bind_iface', 'lo') ][0] }}
        http_bind_iface:  {{  grains['ip4_interfaces'][  settings.get('bind_iface', 'lo') ][0] }}
