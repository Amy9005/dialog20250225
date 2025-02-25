# 1
dialog --title "歡迎光臨" --msgbox "歡迎來到 Amy 的Dialog專案畫面" 10 50

# 2 登入

useraccount=$(dialog --title "請輸入您的資料" --inputbox "您的帳號：" 10 50 --stdout)

# 3 密碼
password=$(dialog --title "請輸入密碼" --passwordbox "您的密碼：" 10 50 --stdout)

# 4 驗證
dialog --title "驗證帳號、密碼" --yesno "帳號：$useraccount\n密碼：$password\n\n是否完全正確？" 10 50
if [ $? -eq 0 ]; then 
	dialog --msgbox "成功登入" 10 50
else
	dialog --msgbox "登入失敗" 10 50
	exit 1 
fi

# 5
choice=$(dialog --title "請選擇想要查看的項目" --menu "可上下選擇" 10 50 3 1 "今天日期" 2 "休息一下" 3 "使用者資訊" --stdout)

if [ "$choice" == "1" ]; then
	dialog --calendar "今天日期" 10 50 25 02 2025
elif [ "$choice" == "2" ]; then 
	dialog --msgbox "請好好休息，即將離開..." 10 50
	sleep 2
	exit 1
elif [ "$choice" == "3" ]; then
	dialog --msgbox "當前使用者：$useraccount\n密碼：$password" 10 50
fi