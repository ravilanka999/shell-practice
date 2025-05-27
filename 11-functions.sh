USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "ERROR:: Please run this script using root access"
    exit 1
else 
    echo " You are running with root access" 
fi


VALIDATE(){
    if [ $1 -eq 0 ]
    then 
        echo "Installing $2 is ..... SUCCESS"
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
     echo "MYSQL is already Installed...Nothing to do"
fi


dnf list installed java
if [ $? -ne 0 ]
then 
    echo "JAVA is not installed... Installing now"
    dnf install java -y
    VALIDATE $? "JAVA"
else 
     echo "JAVA is already Installed...Nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo "NGINX is not installed... Installing now"
    dnf install nginx -y
    VALIDATE $? "NGINX"
else 
     echo "NGINX is already Installed...Nothing to do"
fi