---
categories:
- Blog
date: 2016-07-22T09:55:27+08:00
draft: false
slug: ""
title: Test database dependent code in Go
---

There are two problems need to slove to test database operations:

1. these database operations should be mocked when testing the upper layer callers
2. the test environment should as similar to the production as possible


## Mock database operation

For each database entity we define an interface of all its operation method.
Then we can define mock operation service which implements the interface mentioned above.

Actually, whenever we need to decouple two layers, we can use `interface`.

```go
// project.go
type ProjectService interface {
	// Create a new Project.
	Create(proj *Project) (bool, error)

	// Update an existing Project in the database.
	Update(proj *Project) (bool, error)
}

// project_test.go
type MockProjectService struct {
	OnCreate             func(proj *Project) (bool, error)
	OnUpdate             func(proj *Project) (bool, error)
}

func (t *MockProjectService) Create(proj *Project) (bool, error) {
	return t.OnCreate(proj)
}

func (t *MockProjectService) Update(proj *Project) (bool, error) {
	return t.OnUpdate(proj)
}
```

See [this discussion](https://groups.google.com/forum/#!topic/golang-nuts/9i01tuVo-1E) for more information.

## Test environment

Docker fit this situation.

Every time we do the test, a docker container will be start before any test running.
This container use the same image as producion.

```go
import (
	"fmt"
	"os"

	"github.com/docker/engine-api/client"
	"github.com/docker/engine-api/types"
	"github.com/docker/engine-api/types/container"
	"golang.org/x/net/context"
)

func launchTestMysql() (connStr string, err error) {
	database := "dbname"
	password := "password"
	port := ""

	defaultHeaders := map[string]string{"User-Agent": "engine-api-cli-1.0"}
	cli, err := client.NewClient("unix:///var/run/docker.sock", "v1.23", nil, defaultHeaders)
	if err != nil {
		return
	}

	cfg := &container.Config{
		Image: "mysql",
		Env:   []string{"MYSQL_ROOT_PASSWORD=" + password},
	}

	wd, err := os.Getwd()
	if err != nil {
		return "", err
	}
	hostcfg := &container.HostConfig{
		Binds:           []string{wd + "/init.sql:/docker-entrypoint-initdb.d/init.sql"}, // mount init.sql
		PublishAllPorts: true,
	}

	resp, err := cli.ContainerCreate(context.Background(), cfg, hostcfg, nil, "")
	if err != nil {
		return "", err
	}
	containerId = resp.ID

	if err := cli.ContainerStart(context.Background(), resp.ID, types.ContainerStartOptions{}); err != nil {
		return "", err
	}

	cJson, err := cli.ContainerInspect(context.Background(), resp.ID)
	if err != nil {
		return "", err
	}

  // get port
	for _, hostPort := range cJson.NetworkSettings.Ports {
		port = hostPort[0].HostPort
		break
	}

	return fmt.Sprintf("root:%s@tcp(127.0.0.1:%s)/%s", password, port, database), nil
}
```
