#
# ~/.bashrc
#

set -a
. /dev/fd/0 <<EOF
$(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)
EOF
set +a

export KUBECONFIG=$(echo $(ls ~/.kube/config.d/* 2>/dev/null) | sed 's/ /:/g')

eval "$(starship init bash)"
