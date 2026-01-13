options {
    directory "{{ bind9_options_directory }}";

    // If there is a firewall between you and nameservers you want
    // to talk to, you may need to fix the firewall to allow multiple
    // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

    // If your ISP provided one or more IP addresses for stable 
    // nameservers, you probably want to use them as forwarders.  
    // Uncomment the following block, and insert the addresses replacing 
    // the all-0's placeholder.

    forwarders {
    {% for forwarder in bind9_options_forwarders %}
        {{ forwarder }};
    {% endfor %}
    };

    //========================================================================
    // If BIND logs error messages about the root key being expired,
    // you will need to update your keys.  See https://www.isc.org/bind-keys
    //========================================================================
    dnssec-validation {{ bind9_options_dnssec_validation }};

    // listen-on-v6 { any; };
  
    // version statement for security to avoid hacking known weaknesses
    // if the real version number is revealed
    version "not currently available";

    // This is the default - allows user queries from any IP
    // allow-query { any; };
    // normal server operations may place items in the cache
    // this prevents any user query from accessing these items
    // only authoritative zone data will be returned
    allow-query-cache { any; };
    // Do not provide recursive service to user queries
    // recursion yes;

};

# statistics, consumable by bind prometheus exporter
# see: https://support.tools/monitor-bind-dns-grafana-prometheus-bind-exporter/
statistics-channels {
{% for item in bind9_statistics_channels %}
    inet {{ item.listen_address }} port {{ item.listen_port }} allow {
        {% for client in item.allow %}
            {{ client }};
        {% endfor %}
    };
{% endfor %}
};


logging {
    channel dnssec_log {
        syslog daemon;
        severity debug 3;
        print-category yes;
    };
    channel update_file {
        file "/var/log/named/update.log" versions 3 size 5m;
        severity dynamic;
        print-time yes;
    };
    category dnssec { dnssec_log; };
    category update { update_file; };
};


//logging {
//    channel default_file {
//        file "/var/log/named/default.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel general_file {
//        file "/var/log/named/general.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel database_file {
//        file "/var/log/named/database.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel security_file {
//        file "/var/log/named/security.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel config_file {
//        file "/var/log/named/config.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel resolver_file {
//        file "/var/log/named/resolver.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel xfer-in_file {
//        file "/var/log/named/xfer-in.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel xfer-out_file {
//        file "/var/log/named/xfer-out.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel notify_file {
//        file "/var/log/named/notify.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel client_file {
//        file "/var/log/named/client.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel unmatched_file {
//        file "/var/log/named/unmatched.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel queries_file {
//        file "/var/log/named/queries.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel network_file {
//        file "/var/log/named/network.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel update_file {
//        file "/var/log/named/update.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel dispatch_file {
//        file "/var/log/named/dispatch.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel dnssec_file {
//        file "/var/log/named/dnssec.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//    channel lame-servers_file {
//        file "/var/log/named/lame-servers.log" versions 3 size 5m;
//        severity dynamic;
//        print-time yes;
//    };
//
//    category default { default_file; };
//    category general { general_file; };
//    category database { database_file; };
//    category security { security_file; };
//    category config { config_file; };
//    category resolver { resolver_file; };
//    category xfer-in { xfer-in_file; };
//    category xfer-out { xfer-out_file; };
//    category notify { notify_file; };
//    category client { client_file; };
//    category unmatched { unmatched_file; };
//    category queries { queries_file; };
//    category network { network_file; };
//    category update { update_file; };
//    category dispatch { dispatch_file; };
//    category dnssec { dnssec_file; };
//    category lame-servers { lame-servers_file; };
//};
