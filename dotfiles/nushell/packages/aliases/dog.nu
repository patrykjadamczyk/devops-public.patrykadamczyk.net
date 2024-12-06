#!/usr/bin/env nu

alias dog = doge

def --env --wrapped "dog ALL" [...$args] {
    if (which doge | is-empty) {
        if (which cargo | is-not-empty) {
            pm install rust dns-doge
        } else {
            print $"(ansi red)doge command not found and golang not found(ansi reset)"
        }
    }
    $in | doge -t A -t AAAA -t AFSDB -t APL -t CAA -t CDNSKEY -t CDS -t CERT -t CNAME -t CSYNC -t DHCID -t DLV -t DNAME -t DS -t EUI48 -t EUI64 -t HINFO -t HIP -t IPSECKEY -t KX -t LOC -t MX -t NAPTR -t NS -t NSEC -t NSEC3 -t NSEC3PARAM -t OPENPGPKEY -t PTR -t RP -t RRSIG -t SMIMEA -t SOA -t SRV -t SSHFP -t TLSA -t TXT -t URI ...$args
}

def --env --wrapped "dog ALL_COMMON" [...$args] {
    if (which doge | is-empty) {
        if (which cargo | is-not-empty) {
            pm install rust dns-doge
        } else {
            print $"(ansi red)doge command not found and golang not found(ansi reset)"
        }
    }
    $in | doge -t A -t AAAA -t CAA -t CNAME -t HINFO -t LOC -t MX -t NS -t PTR -t SOA -t SRV -t TXT -t NAPTR -t OPENPGPKEY -t SSHFP -t TLSA -t URI -t EUI48 -t EUI64 ...$args
}
