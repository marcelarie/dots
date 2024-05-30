function stu-health
    switch $argv[1]
        case beta
            set env beta
            set url 'https://api.beta.stuart.com/health'
        case sandbox
            set env sandbox
            set url 'https://api.sandbox/health'
        case '*'
            set env prod
            set url 'https://api.stuart.com/health'
    end

    printf "Status for $env: %s"

    set response (curl -s -o /dev/null -w "%{http_code}" $url)

    if test $response -ge 500 -a $response -lt 600
        echo "Server returned HTTP $response error"
    else
        set server_status (curl -s $url | jq -r .status)

        if test $server_status = "pass"
            echo "server is up and running"
        else
            echo "server is down"
        end
    end
end
