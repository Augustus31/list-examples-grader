CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
   echo 'File Found'
else
   echo 'Your submission lacks the correct files'
   exit
fi

#Should be copying into student-submission, but this still works

cp student-submission/ListExamples.java .
javac -cp $CPATH *.java

if [[ $? -ne 0 ]]
then
   echo 'Compilation error. Check syntax.'
   exit
else
   echo 'Compilation successful'
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > testResults.txt

resultLine=$(grep 'Tests run' testResults.txt)
echo $resultLine
resultLine2=$(grep 'OK' testResults.txt)
echo $resultLine2
