Repro:

1. Ensure Docker running

2. Clone repo

3. Build docker image using 

```shell
docker build -t pants-test-image:latest .
```

4. Run container 

```shell
docker run -v ${PWD}:${PWD} -w ${PWD} --entrypoint bash -it pants-test-image:latest
```

Then, run pants package command within container 

```shell
/root/.local/bin/pants package ::
```

OR 

4. Run command within container in a single step:

```shell
docker run -v ${PWD}:${PWD} -w ${PWD} pants-test-image:latest package ::
```
