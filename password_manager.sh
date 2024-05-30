echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください("Add Password" / "Get Password" / "Exit")：";
read input


while true; do
   case $input in
     "Add Password")
     # Add Password が入力された場合
       echo "サービス名を入力してください："; read service
       echo "ユーザー名を入力してください："; read user
       echo "パスワードを入力してください："; read password
       echo "$service,$user,$password" >> ~/passmana_info.txt
       echo "パスワードの追加は成功しました。" 
       ;;


       
      "Get Password")
      # Get Password が入力された場合
        echo "サービス名を入力してください：";
        read search_service
  
      ## サービス名が保存されていた場合内容を表示  
        result=$(grep -o  "$search_service" passmana_info.txt |  tr '\n' ',');
        if [ -n "$result" ]; then
          echo "サービス名：$search_service"
          echo "ユーザー名：$(echo $result | awk -F',' '{print $2}')"
          echo "パスワード：$(echo $result | awk -F',' '{print $3}')"
        else
      ## サービス名が保存されていなかった場合
          echo "そのサービスは登録されていません。"
      fi 
      ;;



     "Exit")
       echo "Thank you!"
       break
       ## プログラムが終了
      ;;



      *)
      # Add Password/Get Password/Exit 以外が入力された場合
        echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
      ;;

   esac  
   echo "次の選択肢から入力してください("Add Password" / "Get Password" / "Exit")：";
   read input
done

