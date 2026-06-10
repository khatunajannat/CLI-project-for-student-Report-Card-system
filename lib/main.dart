import "dart:io";
import "dart:math";

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
        for (int x = 0; x < students.length; x++) {
          print(students[x]["name"]);
        }
        print("Pick a student: ");
        String? p = stdin.readLineSync();
        for (Map y in students) {
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
        for (int cnt = 0; cnt < students.length; cnt++) {
          print(students[cnt]["name"]);
        }
        print("Pick a student : ");
        String stud = stdin.readLineSync()!;
        print(" Added bonus for $stud :");
        int bonusAdd = int.parse(stdin.readLineSync()!);
        for(Map bM in students){

          if(bM["name"]== stud){
            if(bM["Bonus"]!=null){
              print("You cannot add bonus again");
            }

             bM["Bonus"]??= bonusAdd;

          }
        }
        print("Bonus of $stud is $bonusAdd");


      case 4:
        for (int cnt = 0; cnt < students.length; cnt++) {
          print(students[cnt]["name"]);
        }
        print("Pick a student : ");
        String stud = stdin.readLineSync()!;
        for( Map cM in students) {
          if (cM["name"]==stud) {
            print("Add comment for $stud :");

            String? commentGiven = stdin.readLineSync();
            cM["Comments"] = commentGiven;
            if (commentGiven != null) {
              print(commentGiven);
            }

            cM["Comments"] = commentGiven?.toUpperCase() ??
                "No comment provided ";
          }
        }
      // print(students);
       case 5:
               for(Map h in students) {
                 List<dynamic> display = [
                   ("print name : "),
                   (h["name"]),
                   ("Print scores : "),
                   (h["Scores"]),
                   ("The number of scores : "),
                   (h["Scores"].length),
                   if (h["Bonus"] != null) " * Has bonus ${h["Bonus"]}"
                 ];
                 for (dynamic dW in display) {
                   print(dW);
                 }
               }
      case 6:
        for (int cnt = 0; cnt < students.length; cnt++) {
          print(students[cnt]["name"]);
        }
        print("Pick a student : ");
        String stud = stdin.readLineSync()!;

        for(Map bM in students){
          if(bM["name"]==stud) {
            num storedScore = 0 ;
            for (int f = 0; f < bM["Scores"].length; f++) {
              storedScore +=  bM["Scores"][f];
            }
            double avg = storedScore / bM["Scores"].length;
            print("Average is : $avg");

            num bonusPoints = bM["Bonus"] ?? 0;
            num total = avg + bonusPoints;
            if (total > 100) {
              total = 100;
            }
            print(total);

            String grade;
            if (total >= 90) {
              grade = "A";
            }
            else if (total >= 80 && total <= 89) {
              grade = "B";
            }
            else if (total >= 70 && total <= 79) {
              grade = "C";
            }
            else if (total >= 60 && total <= 69) {
              grade = "D";
            }
            else {
              grade = "F";
            }

            String feedback = switch (grade){

              "A" => "Outstanding performance! ",
              "B" => "Good Work",
              "C" => "Satisfactory. Room to improve" ,
              "D" => "Needs improvement ",
              "F" => "Failing. Please Seek Help",

             _ =>"Unknown grade! ",
            };






            print(
             '''
              =============================
                     Report Card      
              ==============================
             
             Name     : ${bM["name"]},
             
             Scores   : ${bM["Scores"]},
 
             Bonus    : +${bM["Bonus"]},

             Mark     : $total,
             
             Grade    : $grade ,
             
             Comment  : ${bM["Comments"] ?? "No comment provided "}},


           '''
            );

          }
        }



      case 7:

        List<double> classAvg =[];

        for(Map bM in students) {
          print("Total Students: ");
          print(students.length);

          num storedScore = 0;
          for (int f = 0; f < bM["Scores"].length; f++) {
            storedScore += bM["Scores"][f];
          }
          double avg = storedScore / bM["Scores"].length;
          print("Average is : $avg");

          num bonusPoints = bM["Bonus"] ?? 0;
          double total = avg + bonusPoints;
          if (total > 100) {
            total = 100;
          }
          print(total);
          classAvg.add(total);
        }

        double totalClassAvg = 0;
        for(double ans in classAvg){
           totalClassAvg += ans ;
        }
        double storeAvg = totalClassAvg/ classAvg.length;
        print("Class average is : $storeAvg");
        double minAvg = classAvg.reduce(min);
        print("Minimum avg: $minAvg" );
        double maxAvg = classAvg.reduce(max);
        print("Maximum avg : $maxAvg ");


      case 8:
        return;
    }
  } while (true);
}
