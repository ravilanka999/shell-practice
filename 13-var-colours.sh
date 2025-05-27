USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]
then 
    echo -e "$R ERROR:: Please run this script using root access $N"
    exit 1
else 
    echo -e " $G You are running with root access $N" 
fi


VALIDATE(){
    if [ $1 -eq 0 ]
    then 
        echo -e "$G Installing $2 is ..... SUCCESS $N"
    else 
         echo " Installing $2 is .... FAILURE"
         exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "MYSQL is not installed... Installing now"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else 
     echo -e "$Y MYSQL is already Installed...Nothing to do $N"
fi


dnf list installed java
if [ $? -ne 0 ]
then 
    echo "JAVA is not installed... Installing now"
    dnf install java -y
    VALIDATE $? "JAVA"
else 
     echo -e "$Y JAVA is already Installed...Nothing to do $N"
fi