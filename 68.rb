# job_require_skill_tags = ["red", "green", "blue", "white", "black", "yello"] #6
# # require_skill_tags = ["red", "green", "mmmmm"]
# # 3

# user_courses_comp = ["red", "green", "mmmmm", "aaaaa"]

# a_b = job_require_skill_tags - user_courses_comp

# p a_b.length # 4

# # p user_courses.length
# result = ( job_require_skill_tags.length - a_b.length ) / user_courses_comp.length.to_f

# p result



# ============================================================

job_require_skill_tags = ["red", "green", "blue", "white", "black", "yello", "mmmmm", "bbb"]

# user_courses_comp = ["red", "green", "mmmmm", "aaaaa"]
user_courses_comp = ["red", "green", "aaaaa", "blue"]

duplication_arr = job_require_skill_tags & user_courses_comp

p duplication_arr #2

p duplication_arr.length / job_require_skill_tags.length.to_f

p 6 / 9.0
