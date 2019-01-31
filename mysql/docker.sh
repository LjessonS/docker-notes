docker build -t ub_mysql .
docker run -d -p 10024:22 --name test_ub_mysql ub_mysql

