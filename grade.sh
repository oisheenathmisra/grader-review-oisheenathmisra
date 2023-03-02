CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [[ -f ListExamples.java ]]
then 
    echo 'File found'
else 
    echo 'File not found'
    exit 1
fi 
 
cp -r ../lib ./
cp ../TestListExamples.java ./

javac -cp $CPATH *.java > output.txt 2>&1
cat output.txt

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples.java > results.txt
cat results.txt