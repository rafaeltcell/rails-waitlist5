# docker ps | grep tcell_puma_local_web | awk '{print $1}' | xargs docker stats --no-stream $1 | tail -n 1
#curl --unix-socket /var/run/docker.sock http:/containers/885c420b16595168cb4ac2437360cb2e70551d864875c96e5fa651d72b285f74/stats?stream=false

WEB_HOST="http://0.0.0.0:3033"

foo() {
    DOCKER_APP_NAME=$1
    for i in `seq 1 3`;
    do
        #> /dev/null 2>&1
        docker-compose run --rm --service-ports -d $DOCKER_APP_NAME > /dev/null 2>&1
        CONTAINER_ID=$(docker-compose ps -q $DOCKER_APP_NAME)

        # ping: unknown host http://0.0.0.0:3033
        # ping -n 1 $WEB_HOST

        PING_RESULT=$(wget -qO- --retry-connrefused --no-check-certificate -T 60 $WEB_HOST)
        #echo "ping result: $PING_RESULT"

        DOCKER_MEM_STATS=$(docker stats --no-stream $CONTAINER_ID | tail -n 1 | awk '{print $3, $4}')
        echo "\ndocker container stats: :$DOCKER_MEM_STATS:"

        #wget -qO- $WEB_HOST/waitlist_entries > /dev/null 2>&1

        #DOCKER_MEM_STATS=$(docker stats --no-stream $CONTAINER_ID | tail -n 1 | awk '{print $3, $4}')
        #echo "docker container stats: :$DOCKER_MEM_STATS:"

        wget -qO- $WEB_HOST/big_transfer > /dev/null 2>&1

        DOCKER_MEM_STATS=$(docker stats --no-stream $CONTAINER_ID | tail -n 1 | awk '{print $3, $4}')
        echo "docker container stats: :$DOCKER_MEM_STATS:"

        wget -qO- $WEB_HOST/big_transfer.csv > /dev/null 2>&1

        DOCKER_MEM_STATS=$(docker stats --no-stream $CONTAINER_ID | tail -n 1 | awk '{print $3, $4}')
        echo "docker container stats: :$DOCKER_MEM_STATS:"

        wget -qO- $WEB_HOST/big_transfer_file > /dev/null 2>&1

        DOCKER_MEM_STATS=$(docker stats --no-stream $CONTAINER_ID | tail -n 1 | awk '{print $3, $4}')
        echo "docker container stats: :$DOCKER_MEM_STATS:\n"

        docker ps -q | xargs docker stop > /dev/null 2>&1
    done
}

#if [ "$#" -ne 2 ]
if [ "$#" -ne 1 ]
then
    echo "\nUsage: load_tests.sh tcell-less-dc-service tcell-full-dc-service\n"
    exit 1
fi

#echo ":$1:$2:"

foo $1
#foo $2
