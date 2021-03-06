.PHONY: default check

default:
	gofmt -s -w .
	go get -t -v -d ./...
	go install -v ./...
	@echo "distrobuilder built successfully"

check: default
	go get -v -x github.com/remyoudompheng/go-misc/deadcode
	go get -v -x github.com/golang/lint/golint
	go test -v ./...
	golint -set_exit_status ./...
	deadcode ./
	go vet ./...
