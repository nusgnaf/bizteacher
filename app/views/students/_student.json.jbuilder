json.extract! student, :id, :name, :stuid, :submitted?, :homework, :created_at, :updated_at
json.url student_url(student, format: :json)
json.homework url_for(student.homework)
