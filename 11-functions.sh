USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "ERROR:: Please run this script using root access"
    exit 1
else 
    echo " You are running with root access" 
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "MYSQL is not installed... Installing now"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then 
        echo "Installing MYSQL is ..... SUCCESS"
    else 
         echo " Installing MYSQL is .... FAILURE"
         exit 1
    fi
else 
     echo "MYSQL is already Installed...Nothing to do"
fi


dnf list installed java
if [ $? -ne 0 ]
then 
    echo "JAVA is not installed... Installing now"
    dnf install JAVA -y
    if [ $? -eq 0 ]
    then 
        echo "Installing JAVA is ..... SUCCESS"
    else 
         echo " Installing JAVA is .... FAILURE"
         exit 1
    fi
else 
     echo "JAVA is already Installed...Nothing to do"
fi
