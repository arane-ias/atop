unit:
	pdk test unit
all:
#	pdk test unit
	pdk bundle install
	pdk bundle exec rake 'litmus:provision[docker, litmusimage/centos:7]'
	pdk bundle exec rake litmus:install_agent
#	pdk bundle exec bolt command run 'puppet --version' --targets localhost:2222 --inventoryfile spec/fixtures/litmus_inventory.yaml
	pdk bundle exec rake litmus:install_module
#	pdk bundle exec bolt command run 'puppet module list' --targets localhost:2222 -i spec/fixtures/litmus_inventory.yaml
	pdk bundle exec rake litmus:acceptance:parallel
clean:
	pdk bundle exec rake litmus:tear_down