# OpenGL Practice Project

<div align="center">
  <img src="https://www.docker.com/wp-content/uploads/2022/03/Moby-logo.png" width="100" alt="Docker Logo">
  <img src="https://www.opengl.org/img/opengl_logo.jpg" width="200" alt="OpenGL Logo">
</div>

## Tags

`OpenGL` `Docker` `WSL2` `C++` `CMake` `GLFW` `GLAD`

## 概要

このリポジトリは、WSL2環境上でDockerコンテナを使用してOpenGLの開発環境を構築し、プログラムを実行するための練習用プロジェクトです。
GLFWおよびGLADを使用して、OpenGL 3.3 Core Profileでの描画を行います。

## 注意事項（WSL2環境での実行）

本プロジェクトはWSL2のディストリビューション上での実行を前提としています。
WSL2のローカルディストリビューションによっては，必要に応じてGUIアプリケーションをDockerコンテナ内から表示するために、WSLg（Windows 11以降推奨）または適切なXサーバ（VcXsrv等）の設定が必要です。

## 構成

```
.
├── .env                # 環境変数（ユーザーID、グループIDの定義）
├── .gitignore          # Git管理除外設定
├── CMakeLists.txt      # CMakeビルド設定
├── docker-compose.yml  # Docker Compose設定
├── Dockerfile          # コンテナイメージ定義
├── glad/               # GLADソースコード・ヘッダ
├── src/
│   └── main.cpp        # メインプログラム
└── README.md           # 本ドキュメント
```

## 実行手順

### 1. Dockerイメージのビルドとコンテナの起動

ホストマシン（WSL2）側で以下のコマンドを実行し、開発環境を構築します。

```bash
# イメージのビルド
docker compose build

# コンテナの起動
docker compose up -d
```

#### 補足: USER_ID / GROUP_ID に関するトラブルシューティング
`docker compose` の実行時に `USER_ID` や `GROUP_ID` に関する警告やエラーが発生する場合、`.env` ファイルの設定が現在の実行ユーザーと一致していない可能性があります。その場合は、以下の手順で設定を更新してください。

1. ホストマシン（WSL2）のシェルで自身のIDを確認します。
   ```bash
   id -u  # ユーザーIDの確認
   id -g  # グループIDの確認
   ```
2. 出力された数値に合わせて `.env` ファイルの内容を書き換えます。
   ```text
   USER_ID=確認したユーザーID
   GROUP_ID=確認したグループID
   ```

### 2. コンテナ内でのビルドと実行

コンテナに入り、CMakeを使用してプログラムをビルド・実行します。

```bash
# コンテナ内に入る
docker compose exec opengl-dev bash

# コンテナ内での操作
# ビルド用ディレクトリの作成
mkdir build && cd build

# ビルド
cmake ..
make

# プログラムの実行
./main
```

実行に成功すると、ウィンドウが表示され、背景が指定の色で塗りつぶされます。
