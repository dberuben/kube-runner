# Start the dev server.
#
# Note that the API server must
# also be running.
start:
	@gopherjs -m -v serve --http :3000 http://104.154.130.94/john/kube-runner/docs/client
.PHONY: start

# Start the API server.
api:
	@go run main.go
.PHONY: api

# Display dependency graph.
deps:
	@godepgraph http://104.154.130.94/john/kube-runner/docs/client | dot -Tsvg | browser
.PHONY: deps

# Display size of dependencies.
#- Any comment preceded by a dash is omitted.
size:
	@gopherjs build client/*.go -m -o /tmp/out.js
	@du -h /tmp/out.js
	@gopher-count /tmp/out.js | sort -nr
.PHONY: size
