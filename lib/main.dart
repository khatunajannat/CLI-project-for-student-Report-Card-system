import "dart:io";

void main() {
  //int opt=1;
  const String appTitle = "Student Grader v1.0 ";

  final Set<String> availableSubjects = {
    "English",
    "Math",
    "Science",
    "History",
  };
  List<int> scores = [];

  List<Map<String, dynamic>> students = [];

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

''');

    int opt = int.parse(stdin.readLineSync()!);

    switch (opt) {
      case 1:
        Map<String, dynamic> studentDetails = {
          "name": {},
          "Scores": [],
          "Subjects": {...availableSubjects},
          "Bonus": null,
          "Comments": null,
        };

        print("Enter Student name: ");
        var n = stdin.readLineSync();
        studentDetails["name"] = n;
        print("$n is added to the student list\n");

        students.add(studentDetails);
        print(studentDetails);



      case 2:
        for(int x=0; x<students.length; x++){
         print(students[x]["name"]);

        }
        print("Pick a student: ");
        String? p = stdin.readLineSync() ;
        for( Map y in students) {
          if (y["name"] == p) {
            print(y["Subjects"]);

            print("Enter the scores for $p");
            for (String sub in y["Subjects"]) {
              print("Enter Score for $sub :\n ");
              int num = int.parse(stdin.readLineSync()!);

              while (num > 0 && num < 100) {
                y["Scores"].add(num);
                break;
              }

            }
            print("Scores are :  ");
            print(y["Scores"]);
          }

        }


      case 3:




      case 8:
        return;
    }
  } while (true);
}
