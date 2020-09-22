# validate Jenkinsfile with `jenkinsfile-runner`

- Use `-ns` to bypass script approvals by not using a sandbox to execute

```sh
docker container run \
  --rm -it \
  -v "${PWD}:/workspace" \
  jenkins4eval/jenkinsfile-runner \
  -ns
```