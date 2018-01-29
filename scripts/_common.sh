#!/bin/bash

# Add a systemd configuration using ynh_add_systemd_config,
# by replacing __PORT__ with the $port variable value.
mattermost_add_systemd_config () {
  local config_path="../conf"

  # Replace variables in the systemd template config file
  sed -i'.template' "s/__PORT__/$port/g" "$config_path/systemd.service"

  # Create a dedicated systemd config
  ynh_add_systemd_config

  # Restore the original configuration template
  rm "$config_path/systemd.service"
  mv "$config_path/systemd.service.template" "$config_path/systemd.service"
}
