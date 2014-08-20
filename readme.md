## Console Lab

For this lab, we'd like you to strengthen your Rails console skills. This lab is going to be very familiar to the SQL lab, where we'll ask you to create a model and then write out the console commands you would use to execute these queries

### To Start

1. Create a model called Student, that has a first_name, last_name and age
2. Don't forget to run your migrations

### Tasks to create

1. Using the new/save syntax, create a student, first and last name and an age 

	student = Student.new(:first_name=>"Connie", :last_name=>"Chang", :age=>24)
	```	
		
2. Save the student to the database  
	```
	student.save
	```
3. Using the find/set/save syntax update the student's first name to taco
```
student = Student.find_by_id(1)
student.first_name = "Taco"  
student.save
```
4.  Delete the student (where first_name is taco)
```
student = Student.find_by_first_name("Taco")
student.destroy
```

5. Validate that every Student's last name is unique     
  *in the student.rb file in app/models:*
	```
  	validates_uniqueness_of :last_name
	```
	
	*test by adding a student with the same last name, error message returned will be:*
	```
	 (0.6ms)  BEGIN
	  Student Exists (2.6ms)  SELECT  1 AS one FROM "students"  WHERE "students"."last_name" = 'Person' LIMIT 1
   (0.7ms)  ROLLBACK   
=> false
```
6. Validate that every Student has a first and last name that is longer than 4 characters
```
validates_length_of :first_name, :minimum => 4                 
validates_length_of :last_name, :minimum => 4
```
7. Validate that every first and last name cannot be empty
```
validates_length_of :first_name, :allow_blank => false
validates_length_of :last_name, :allow_blank => false 
```
7. Combine all of these individual validations into one validation (using validate and a hash)	
```
	validates :first_name, :presence => true,
		:length => {:minimum => 4},
		:allow_blank => false
```
```
	validates :last_name, :presence => true,
		:length => {:minimum =>4},
		:allow_blank => false,
		:uniqueness => true
```

8. Using the create syntax create a student named John Doe who is 33 years old
```
him=Student.new
him.first_name = "John"
him.last_name = "Doe"
him.age = 33
```
9. Show if this new student entry is valid
him.save should return an error 

10. Show the number of errors for this student instance
 (0.4ms)  BEGIN
  Student Exists (0.6ms)  SELECT  1 AS one FROM "students"  WHERE "students"."last_name" = 'Doe' LIMIT 1
   (0.2ms)  ROLLBACK
   
   
11. In one command, Change John Doe's name to Jonathan Doesmith 
previously created John Doe by using him = Student.new....
him.update_attributes(:last_name => "Doesmith")
12. Clear the errors array
13. Save Jonathan Doesmith
	him.save 
15. Find all of the Students
	Student.all
16. Find the student with an ID of 128 and if it does not exist, make sure it returns nil and not an error
	Student.find_by_id(128)
17. Find the first student in the table
	Student.first
18. Find the last student in the table
	Student.last
19. Find the student with the last name of Doesmith
	Student.find_by_last_name("Doesmith")
21. Find all of the students and limit the 	search to 5 students, starting with the 2nd student and finally, order the students in alphabetical order



20. Delete Jonathan Doesmith
Student.find_by_id(3).destroy	
### Bonus
1. Use the validates_format_of and regex to only validate names that consist of letters (no numbers or symbols) and start with a capital letter
2. Write a custom validation to ensure that no one named Delmer Reed, Tim Licata, Anil Bridgpal or Elie Schoppik is included in the students table


