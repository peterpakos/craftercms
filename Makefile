FETCH_DIR		= files
CRAFTERCMS_URL	= https://downloads.craftercms.org/3.1.3/crafter-cms-authoring-3.1.3.tar.gz
CRAFTERCMS_FILE	= $(FETCH_DIR)/crafter-cms-authoring-3.1.3.tar.gz

all: deploy
.PHONY: all

fetch: $(CRAFTERCMS_FILE)
.PHONY: fetch

$(CRAFTERCMS_FILE): $(FETCH_DIR)
	wget -nv -N -P $(FETCH_DIR) $(CRAFTERCMS_URL)

$(FETCH_DIR):
	mkdir -p $@

deploy: fetch
	vagrant up
.PHONY: deploy

destroy:
	vagrant destroy -f || true
.PHONY: destroy

rebuild: destroy deploy
.PHONY: rebuild

clean: destroy
	rm -rf $(FETCH_DIR)
.PHONY: clean
