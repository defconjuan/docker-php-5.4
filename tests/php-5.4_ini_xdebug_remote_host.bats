#!/usr/bin/env bats

DOCKER_COMPOSE_FILE="${BATS_TEST_DIRNAME}/php-5.4_ini_xdebug_remote_host.yml"

container() {
  echo "$(docker-compose -f ${DOCKER_COMPOSE_FILE} ps php-5.4 | grep php-5.4 | awk '{ print $1 }')"
}

setup() {
  docker-compose -f "${DOCKER_COMPOSE_FILE}" up -d

  sleep 10
}

teardown() {
  docker-compose -f "${DOCKER_COMPOSE_FILE}" kill
  docker-compose -f "${DOCKER_COMPOSE_FILE}" rm --force
}

@test "php-5.4: ini: xdebug.remote_host" {
  run docker exec "$(container)" /bin/su - root -lc "cat /usr/local/src/php-5.4farm/inst/current/etc/conf.d/xdebug.ini | grep 'xdebug.remote_host'"

  [ "${status}" -eq 0 ]
  [[ "${output}" == *"192.168.1.1"* ]]
}
