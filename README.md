# gcp-web-infra

gcpで実装するwebアプリケーションインフラのサンプル

Cloud Build上のterraformによりデプロイする。

## secret managerに以下を追加

| 名前 | 値 |
----|---- 
| dbpassword | dbのパスワード |
| domain | Cloud DNS で使用するドメイン |
| backend_domain | Cloud Load Balancing で使用するドメイン |
| iap_brand_name | iap のブランド (projects/${project_number}/brand/${project_number}) |
| alert_email_address　| ログベースalert の通知先Eメールアドレス |
