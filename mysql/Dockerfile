# ベースイメージとして公式のMySQLイメージを使用
FROM mysql:8.0

# データベース名の設定
ENV MYSQL_DATABASE=laravel_db

# データベースユーザーの設定
ENV MYSQL_USER=laravel_user

# データベースユーザーのパスワード設定
ENV MYSQL_PASSWORD=laravel_password

# ルートユーザーのパスワード設定（必要に応じて変更）
ENV MYSQL_ROOT_PASSWORD=root_password

# 初期化用SQLスクリプトを追加（任意、必要な場合のみ）
# ADD init.sql /docker-entrypoint-initdb.d/

# ポートの公開
EXPOSE 3306
