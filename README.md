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
     * Windows用
       ```sh
       docker run --rm -d -t -p 5000:5000 -v $PWD/source/:/source --name test  --env-file=windows.env dotnet5 
       ```
     * Linux・Mac
       ```sh
       docker run --rm -d -t -p 5000:5000 -v $PWD/source/:/source --name test dotnet5 
       ```

  1. Dockerコンテナの終了
     ```sh
     docker stop test
     ```

  * <span>C#</span>をTypeScriptに変換するツールの実行  
    **source/Interfaces/*.cs**を**source/ClientApp/src/interfaces/*.ts**に変換するツールの実行  
    拙作[CStoTS](https://github.com/kazenetu/CStoTS)を使用。  
    ```sh
    CStoTS.sh
    ```  
    ※実態は*tools/CStoTS/*
  
  * フロントエンドとサーバーサイドのソースコードを作成するツールの実行  
    下記を作成する
    * source/Controllers/**引数(名称)**.cs
    * source/ClientApp/src/app/**引数(名称)**.ts
    * source/ClientApp/src/app/**引数(名称)**.html
    * source/ClientApp/src/app/**引数(名称)**.spec.ts
    ```sh
    create.sh 引数(名称)
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
