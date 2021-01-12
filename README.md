"# html_demos_docker"

# build
docker build -t html_demos .

# run
docker container run -d -p 9099:8080 --name demos html_demos

# access
http://localhost:9099/html_demos