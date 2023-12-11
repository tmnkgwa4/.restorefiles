#!/bin/zsh -e

function copy_str() {
  if [[ $# -eq 0 ]]; then
    cat <&0
  elif [[ $# -eq 1 ]]; then
    if [[ -f "$1" ]] && [[ -r "$1" ]]; then
      cat "$1"
    else
      echo "$1"
    fi
  else
    return 1
  fi
}

function lower() {
  copy_str | tr "[:upper:]" "[:lower:]"
}

function upper() {
  copy_str | tr "[:lower:]" "[:upper:]"
}

function ostype() {
  uname | lower
}

function os_detect() {
  export PLATFORM
  case "$(ostype)" in
  *'linux'*) PLATFORM='linux' ;;
  *'darwin'*) PLATFORM='osx' ;;
  *) PLATFORM='unknown' ;;
  esac
}

function is_osx() {
  os_detect
  if [[ ${PLATFORM} = "osx" ]]; then
    return 0
  else
    return 1
  fi
}

function is_linux() {
  os_detect
  if [[ ${PLATFORM} = "linux" ]]; then
    return 0
  else
    return 1
  fi
}

function peco-history-selection() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}

function ku() {
  local selected_cluster
  selected_cluster=$(aws eks list-clusters | jq -r ".clusters[]" | peco)
  if [ -n "$selected_cluster" ]; then
    aws eks update-kubeconfig --name $selected_cluster
  fi
}

function step() {
  local cluster_name=$(aws eks list-clusters | jq -r '.clusters[]' | sort | peco --prompt="select target cluster")
  echo "cluster_name=$cluster_name"

  local token=""
  local alllist=""

  while true; do
    local json=$(aws ssm describe-instance-information --max-items 50 --filters "Key=tag:alpha.eksctl.io/cluster-name,Values=$cluster_name" --starting-token "$token")
    local token=$(echo $json | jq -r '.NextToken')

    local list=$(echo $json | jq -r '.InstanceInformationList[] | [.InstanceId, .IPAddress, .PingStatus, .LastPingDateTime, .ComputerName] | @csv' | sed 's/"//g')
    local alllist=$(echo -e "${alllist}\n${list}")

    if [ -z "$token" -o "$token" = "null" ]; then
      break
    fi
  done

  local inst=$(echo -e "$alllist" | grep ssm-agent-r2 | column -t -s, | peco)
  local id=$(echo $inst | awk '{print $1}')

  ONELOGIN_USERNAME=tomoaki-nakagawa@c-fo.com ssh $id
}

function ts () {
  tmux split-window -h
  tmux split-window -v
  tmux resize-pane -D 15
  tmux select-pane -t 1
}

function continuelifecyclehook() {
  local asgname=$1
  aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names $asgname | jq -r ".AutoScalingGroups[].Instances[].InstanceId" | xargs -I{} bash -c "aws autoscaling complete-lifecycle-action --lifecycle-hook-name nodedrainer --auto-scaling-group-name $asgname --lifecycle-action-result CONTINUE --instance-id {}"
}

function retireinstance() {
  local instance=$1
  lsec2 | grep $instance
  echo aws autoscaling terminate-instance-in-auto-scaling-group --no-should-decrement-desired-capacity --instance-id $instance
}
