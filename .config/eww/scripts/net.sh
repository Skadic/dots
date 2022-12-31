json=$(nmcli | grep "connected to" | sed -r -e "s/(\S+): connected to (.+)/{\"\1\":\"\2\"}/g" | jq -sc "add")
data=$(echo $json | jq "with_entries(if .key | startswith(\"wl\") then .key |= \"wl\" else .key |= \"en\" end)")
base_json='{ "en": "", "wl": "" }'
src="${base_json}${data}"

merged=$(echo $src | jq -s "add")
echo $merged
