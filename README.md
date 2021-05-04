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

## Docker独自の設定
* Properties/launchSettings.json の修正  
  **applicationUrl**を修正する  
  ```json
   {
   〜中略〜
   "profiles": {
   〜中略〜
      },
      "source": {
         "commandName": "Project",
         "launchBrowser": true,
         "applicationUrl": "http://localhost:5000,http://localhost:5001",
         "environmentVariables": {
         "ASPNETCORE_ENVIRONMENT": "Development"
         }
      }
   }
  ```
  ↓
  ```json
   {
   〜中略〜
   "profiles": {
   〜中略〜
      },
      "source": {
   〜中略〜
         "applicationUrl": "http://+:5000,http://+:5001",
   〜中略〜
         }
      }
   }
  ```
