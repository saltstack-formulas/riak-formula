include:
  - riak

riak-cs:
  pkg.installed:
    - require: 
      - pkg: riak

riak-cs-control:
  pkg.installed:
    - require: 
      - pkg: riak-cs

stanchion: 
  pkg.installed:
    - order: last
