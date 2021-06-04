sudo docker stop $(sudo docker ps -aq -f name=inventory-box)
sudo docker rm $(sudo docker ps -aq -f name=inventory-box) 
#sudo docker rmi newki/inventory-box:1.1 
sudo docker run --name inventory-box --network host -i -d newki/inventory-features:1.1 
sudo docker exec -w / inventory-box git clone https://github.com/newkisoft/newki-inventory-box-publish.git
sudo docker exec -d -w /newki-inventory-box-publish/ inventory-box cp appsettings.live.json appsettings.json
sudo docker exec -d -w /newki-inventory-box-publish/ inventory-box dotnet newki-inventory-box.dll 


