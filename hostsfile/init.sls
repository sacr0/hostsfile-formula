# create specific hosts file entries

#loop through all hosts file entries listed in the pillar
{%- for hostname, host_details in salt['pillar.get']('hostsfile', {}).iteritems() %}
hostsfile_{{ hostname }}:
  host.present:
    - ip:
    {%- for ip in host_details.get('ips',{}) %}
      - {{ ip }}
    {%- endfor %}
    - names:
    {%- for name in host_details.get('names',{}) %}
      - {{ name }}
    {%- endfor %}
{%- endfor %}