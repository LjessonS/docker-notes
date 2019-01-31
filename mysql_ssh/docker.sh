#docker build -t hdcancer_img .
#docker run -d -p 10023:22 -v /mnt/share1/liusheng_test:/home/liusheng/workspace --name hdc_container hdcancer_img

docker build -t hdc_mysql .
docker run -d -p 10025:22 -v /mnt/share1/liusheng_test:/home/liusheng/workspace --name test_hdc_mysql hdc_mysql
