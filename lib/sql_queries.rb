# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT title, SUM(amount) FROM projects
   JOIN pledges ON pledges.project_id = projects.id
   GROUP BY title
   ORDER BY title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT name, age, SUM(amount) FROM users
   JOIN pledges ON pledges.user_id = users.id
   GROUP BY name
   ORDER BY name"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  #title, amount OVER goal
  "SELECT title, SUM(amount) - funding_goal AS difference FROM projects
   JOIN pledges on pledges.project_id = projects.id
   GROUP BY title
   HAVING difference >= 0"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  #user.name, pledges.amount, grouped by name, ordered by summed amount
  "SELECT name, SUM(amount) FROM users
   JOIN pledges ON pledges.user_id = users.id
   GROUP BY name
   ORDER BY SUM(amount)"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  #projects.category, pledges.amount
  "SELECT category, amount FROM projects
   JOIN pledges ON pledges.project_id = projects.id
   WHERE projects.category == 'music'"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  #projects.category, pledges.amount SUM, books
  "SELECT category, SUM(amount) FROM projects
  JOIN pledges ON pledges.project_id = projects.id
  WHERE projects.category == 'books'"
end
