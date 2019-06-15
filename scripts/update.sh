#!/usr/bin/env bash

set -e

SUEXEC='sh -c'
UPLOAD_PATH='/tmp/resolv.conf.static'
OUTPUT_PATH='/etc/resolv.conf.static'

function command_exists() {
	command -v "$@" > /dev/null 2>&1
}

user="$(id -un 2>/dev/null || true)"
release_id="$(lsb_release -is)"

if [ "$user" != 'root' ]; then
  command_exists sudo && SUEXEC='sudo -E sh -c' || true
fi

$SUEXEC "test -r $UPLOAD_PATH"

if [ "release_id" == 'Ubuntu' ]; then
  if systemd-resolve --status --no-pager >/dev/null; then
    $SUEXEC "systemctl daemon-reload >/dev/null"
    $SUEXEC "systemctl disable systemd-resolved >/dev/null"
    $SUEXEC "systemctl stop systemd-resolved >/dev/null"
  fi
fi

$SUEXEC "mv $UPLOAD_PATH $OUTPUT_PATH"
$SUEXEC "chown root:root $OUTPUT_PATH"
$SUEXEC "chmod 0644 $OUTPUT_PATH"
$SUEXEC "ln -f $OUTPUT_PATH /etc/resolv.conf"
$SUEXEC "rm -f $UPLOAD_PATH"

cat /etc/resolv.conf
