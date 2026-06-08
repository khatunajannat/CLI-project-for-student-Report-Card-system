import "dart:io" ;
void main(){
int opt=0;
const String appTitle= "Student Grader v1.0 ";

final Set<String> availableSubjects = {"English" , "Math", "Science", "History"};
List<int> scores = [];
Map<String, dynamic> studentDetails= {

  "name": { },
  "Scores" : [],
  "Subjects" : [availableSubjects],
  "Bonus" : null,
  "Comments" : null,
};
List<Map<String, dynamic>> students=[];

do {


  print('''
========= $appTitle===========
1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8.Exit

 print(" Choose an option: ");

'''
  );
  switch(opt){
    case "1" :
      students.add(studentDetails);




  }



}while(

);


}