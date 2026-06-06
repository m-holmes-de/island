island_step "Deploying configuration"
run_logged "$ISLAND_INSTALL/config/deploy.sh"
run_logged "$ISLAND_INSTALL/config/services.sh"
run_logged "$ISLAND_INSTALL/config/environment.sh"
