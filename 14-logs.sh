USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

echo "script started executing at : $(date)" | tee -a $LOG_FILE
if [ $USERID -ne 0 ]
then 
    echo -e "$R ERROR:: Please run this script using root access $N" | tee -a $LOG_FILE
    exit 1
else 
    echo -e " $G You are running with root access $N" | tee -a $LOG_FILE
fi


VALIDATE(){
    if [ $1 -eq 0 ]
    then 
        echo -e "$Y Installing $2 is ..... SUCCESS $N" | tee -a $LOG_FILE
    else 
         echo " Installing $2 is .... FAILURE" | tee -a $LOG_FILE
         exit 1
    fi
}

dnf list installed mysql | tee -a $LOG_FILE
if [ $? -ne 0 ]
then 
    echo "MYSQL is not installed... Installing now" | tee -a $LOG_FILE
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else 
     echo -e "$Y MYSQL is already Installed...Nothing to do $N" | tee -a $LOG_FILE
fi


dnf list installed java | tee -a $LOG_FILE
if [ $? -ne 0 ]
then 
    echo "JAVA is not installed... Installing now" | tee -a $LOG_FILE
    dnf install java -y
    VALIDATE $? "JAVA"
else 
     echo -e "$Y JAVA is already Installed...Nothing to do" | tee -a $LOG_FILE
fi