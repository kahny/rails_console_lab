## Console Lab

For this lab, we'd like you to strengthen your Rails console skills. This lab is going to be very familiar to the SQL lab, where we'll ask you to create a model and then write out the console commands you would use to execute these queries

### To Start

1. Create a model called Student, that has a first_name, last_name and age
2. Don't forget to run your migrations

### Tasks to create

1. Using the new/save syntax, create a student, first and last name and an age 
	```
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
	validates :first_name,
  :presence => true,
  :length => {:minimum => 5}
```
```
validates :last_name,
  :presence => true,
  :length => {:minimum => 5},
  :uniqueness => true
	```

8. Using the create syntax create a student named John Doe who is 33 years old
	```
	john = Student.create(:first_name => "John", :last_name => "Doe", :age => 33)
	```
9. Show if this new student entry is valid
	```
	john.valid? 
	```
10. Show the number of errors for this student instance
 	```
 john.errors.size
	```   
   
11. In one command, Change John Doe's name to Jonathan Doesmith 
	```
	john.update_attributes(:first_name => "Jonathan", :last_name => "Doesmith") 
	```
12. Clear the errors array
	```
	john.errors.clear
	```
13. Save Jonathan Doesmith
	```
	john.save 
	```
15. Find all of the Students
	```
	Student.all
	```
16. Find the student with an ID of 128 and if it does not exist, make sure it returns nil and not an error
	```
	Student.find_by_id(128)
	```
17. Find the first student in the table
	```
	Student.first
	```
18. Find the last student in the table
	```	
	Student.last
	```
19. Find the student with the last name of Doesmith
	```
	Student.find_by_last_name("Doesmith")
	```
21. Find all of the students and limit the search to 5 students, starting with the 2nd student and finally, order the students in alphabetical order
	```
	Student.order(:first_name).offset(1).limit(5)
    ```
20. Delete Jonathan Doesmith
	```
	Student.find_by_id(3).destroy	
	```
### Bonus
1. Use the validates_format_of and regex to only validate names that consist of letters (no numbers or symbols) and start with a capital letter
```
 validates_format_of :first_name, :with => /\A[A-Z][a-zA-Z]*\z/
  validates_format_of :last_name, :with => /\A[A-Z][a-zA-Z]*\z/
```
2. Write a custom validation to ensure that no one named Delmer Reed, Tim Licata, Anil 
Bridgpal or Elie Schoppik is included in the students table
   ```
   INSTRUCTORS = [{:first_name => "Delmer", :last_name => "Reed"},
                 {:first_name => "Tim", :last_name => "Licata"},
                 {:first_name => "Anil", :last_name => "Bridgpal"},
                 {:first_name => "Elie", :last_name => "Schoppik"}]
```
```
  validate :no_instructors
  def no_instructors
    INSTRUCTORS.each do |teacher|
      if teacher[:first_name] == first_name and teacher[:last_name] == last_name
        errors.add(:username, "This is a restricted instructor name")
      end
    end
  end
  ```

