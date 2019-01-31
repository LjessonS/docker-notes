docker build -t ub_base:v1 .
docker run -d -p 10025:22 --name mysql_ssh_container ub_base:v1
