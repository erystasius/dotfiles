####### Proxy

function proxy_refresh
    set -g proxy_candidate localhost:7890
    if test -e ~/.pxy
        set -g proxy_candidate (cat ~/.pxy)
    end
end

function pxyset
    echo $argv[1] > ~/.pxy
end

function pxyres
    rm ~/.pxy
end

function pxyst
    proxy_refresh
    echo "proxy_candicate=$proxy_candidate"
    echo "http_proxy=$http_proxy"
    echo "https_proxy=$https_proxy"
end

function pxyon
    proxy_refresh
    export http_proxy=$proxy_candidate
    export https_proxy=$proxy_candidate
end

function pxyoff
    export http_proxy=
    export https_proxy=
end

function pxydo
    proxy_refresh
    http_proxy=$proxy_candiate \
    https_proxy=$proxy_candidate \
    eval $argv
end

function pxytst
    proxy_refresh
    http_proxy=$proxy_candidate \
    https_proxy=$proxy_candidate \
    curl ipinfo.io
end
