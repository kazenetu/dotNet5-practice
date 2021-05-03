# dotNet5-practice
.NET5+Angularの練習 

## 使用方法
Dockerコンテナにて開発環境を構築する  
※基本的に管理者権限のユーザで実行する

* Dockerイメージのビルド
   ```sh
   docker build -t dotnet5 .
   ```

* Dockerコンテナの実行と終了
  1. Dockerコンテナの実行(コンテナ名：test)
     ```sh
     docker run --rm -d -t -p 5000:5000 -v $PWD/source/:/source --name test dotnet5 
     ```

  1. Dockerコンテナの終了
     ```sh
     docker stop test
     ```
