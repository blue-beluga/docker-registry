#!/usr/bin/env bats

setup() {
  docker history "$REGISTRY/$REPOSITORY:$TAG" >/dev/null 2>&1
  export IMG="$REGISTRY/$REPOSITORY:$TAG"
}

@test "the image has a disk size under 25MB" {
  run docker images $IMG
  echo 'status:' $status
  echo 'output:' $output
  size="$(echo ${lines[1]} | awk -F '   *' '{ print int($5) }')"
  echo 'size:' $size
  [ "$status" -eq 0 ]
  [ $size -lt 10 ]
}
