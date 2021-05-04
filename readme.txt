docker build -t dotnet5 .

docker run --rm -d -t -p 8080:5000 -v ./source/:/source --name test dotnet5 

docker run --rm -d -t -p 5000:5000 -v $PWD/source/:/source --name test --privileged dotnet5 
